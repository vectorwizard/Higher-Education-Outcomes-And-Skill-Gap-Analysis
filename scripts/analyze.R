# Run from the repository root: source("scripts/analyze.R")
required <- c("readr", "dplyr", "ggplot2", "scales")
missing <- required[!vapply(required, requireNamespace, logical(1), quietly = TRUE)]
if (length(missing)) stop("Install required packages first: ", paste(missing, collapse = ", "))

library(readr); library(dplyr); library(ggplot2); library(scales)
job <- read_csv("data/raw/jobspiq_skills_demand_india_2026-11-11.csv", show_col_types = FALSE)
map <- read_csv("data/processed/aicte_2022_curriculum_skill_mapping.csv", show_col_types = FALSE)

out <- job |>
  left_join(map, by = "skill") |>
  arrange(desc(active_job_postings)) |>
  mutate(
    demand_rank = row_number(),
    demand_share_pct = active_job_postings / total_active_technology_postings * 100,
    high_demand_top_quartile = demand_rank <= ceiling(n() * 0.25),
    gap_priority_score = demand_share_pct * (2 - curriculum_coverage_score)
  )

if (anyNA(out$curriculum_coverage_score)) stop("Some skills are missing a curriculum mapping.")
dir.create("data/processed", recursive = TRUE, showWarnings = FALSE)
dir.create("figures", recursive = TRUE, showWarnings = FALSE)
write_csv(out, "data/processed/skills_demand_curriculum_analysis.csv")

p1 <- out |> slice_max(active_job_postings, n = 15, with_ties = FALSE) |>
  mutate(skill = reorder(skill, active_job_postings)) |>
  ggplot(aes(skill, active_job_postings)) + geom_col() + coord_flip() +
  scale_y_continuous(labels = comma) + labs(title = "Top 15 technology skills", x = NULL, y = "Active postings") + theme_minimal()
ggsave("figures/01_top_15_skills.png", p1, width = 10, height = 7, dpi = 180)

p2 <- out |> count(coverage_category) |>
  ggplot(aes(coverage_category, n)) + geom_col() +
  labs(title = "Curriculum coverage across 76 skills", x = NULL, y = "Number of skills") + theme_minimal()
ggsave("figures/02_coverage_all_skills.png", p2, width = 8, height = 5, dpi = 180)

p3 <- out |> filter(high_demand_top_quartile) |>
  slice_max(gap_priority_score, n = 15, with_ties = FALSE) |>
  mutate(skill = reorder(skill, gap_priority_score)) |>
  ggplot(aes(skill, gap_priority_score)) + geom_col() + coord_flip() +
  labs(title = "Highest-priority gaps among top-demand skills", x = NULL,
       y = "Demand share (%) × (2 − coverage score)") + theme_minimal()
ggsave("figures/03_top_quartile_gap_priority.png", p3, width = 10, height = 7, dpi = 180)

cat("Rows:", nrow(out), "\n")
cat("Top quartile:", sum(out$high_demand_top_quartile), "\n")
cat("Weighted alignment index (%):", round(mean(out$curriculum_coverage_score[out$high_demand_top_quartile] / 2) * 100, 1), "\n")
