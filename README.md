# Higher Education Outcomes and Skill Gap Analysis

**Project type:** Descriptive analytics  
**Study context:** India; technology job postings compared with the AICTE 2022 undergraduate CSE model curriculum  
**Data snapshot:** 2026-11-11  
**Prepared by:** [Student name]  
**Institution:** [College / university] 

## Project overview

This project investigates how the skills appearing in Indian technology job postings align with topics and courses in a published undergraduate Computer Science and Engineering reference curriculum. It uses a dated observation of Jobspiq's public skills-demand table and a researcher-coded curriculum mapping against the AICTE 2022 model curriculum.

The analysis is intentionally scoped as **descriptive analytics**. It measures frequency of skill mentions in active job postings and classifies curriculum coverage. It does **not** estimate the probability that a graduate will get a job, infer causal effects of a curriculum, or claim to measure actual placements. The broader project theme mentions higher-education outcomes; actual graduate outcomes require a separate, institution- and cohort-specific placement dataset and are identified as a future extension.

## Research question

Which technical skills are most frequently mentioned in active Indian technology job postings, and to what extent are those skills represented in the AICTE 2022 undergraduate CSE model curriculum?

### Sub-questions

1. What are the most frequently mentioned technical skills in the observed job-posting dataset?
2. Which skills fall in the top quartile of demand?
3. Which top-quartile skills are directly covered, related/elective, or not explicitly identified in the AICTE reference curriculum?
4. Which high-demand skills appear to have the largest curriculum-alignment gaps under the stated scoring rubric?

## Headline results from the captured snapshot

- The source page reported **128,053 active technology job postings** in India during its rolling 30-day window.
- The observed table contained **76 skills**.
- The most frequently mentioned skill was **Python** (42,872 postings; 33.48% of active technology postings).
- The top-demand quartile contained **19 skills**.
- Among those 19 high-demand skills, **2** received a direct/core score, **13** received a related/elective score, and **4** had no explicit match in the reference curriculum.
- The researcher-coded weighted alignment index for the top-demand quartile was **44.7%**. This is a descriptive rubric-based index, not an official institutional or AICTE metric.

## Repository structure

```text
higher-education-outcomes-skill-gap-analysis/
├── data/
│   ├── raw/jobspiq_skills_demand_india_2026-11-11.csv
│   └── processed/
│       ├── aicte_2022_curriculum_skill_mapping.csv
│       ├── skills_demand_curriculum_analysis.csv
│       └── institution_specific_mapping_template.csv
├── figures/
├── notebook/Project_Notebook.Rmd
├── output/
├── references/data_sources.md
├── scripts/analyze.R
├── .gitignore
└── higher-education-outcomes-skill-gap-analysis.Rproj
```

## How to run

1. Install **R** and **RStudio Desktop**.
2. Open `higher-education-outcomes-skill-gap-analysis.Rproj` in RStudio.
3. Install the required packages once:

   ```r
   install.packages(c("rmarkdown", "knitr", "readr", "dplyr", "ggplot2", "scales"))
   ```
4. Open `notebook/Project_Notebook.Rmd` and click **Knit** (HTML).
5. To run the analysis script independently, use `source("scripts/analyze.R")` from the repository root.

The R Markdown notebook reads the included CSV files and regenerates the analysis and plots. Pre-generated PNGs and CSV result tables are included so the project can be inspected before knitting.

## Important data and interpretation notes

- Jobspiq's skills page is a live rolling-window page. This project captured its displayed values on **2026-11-11** so this copy of the data remains stable. The source page stated that counts cover active technology job postings in India during the preceding 30 days.
- One posting may mention multiple skills. Therefore, skill percentages are not mutually exclusive and should not be added together.
- Job postings are not job hires, and the data does not represent all employment or all employers.
- The AICTE curriculum is a **reference model**, not proof that any specific college teaches those exact courses. The institution-specific template is provided for replacement when the student's own official syllabus is available.
- `institution_outcomes_template.csv` is a blank extension sheet for NIRF-style graduate outcomes. It is not populated with invented data and is not included in the current skill-gap calculations.
- The coverage score is researcher-coded: 0 = no explicit match found; 1 = related/elective coverage; 2 = named/direct core coverage. Vendor-specific products are generally scored 1 only when the underlying subject is taught, and the product itself is not named.
- Do not present the weighted alignment index as an official or objective measure of education quality. It depends on the stated coding rubric.

## Licence and attribution

The captured Jobspiq dataset is attributed to Jobspiq and is covered by the CC BY 4.0 terms shown on its public data page. The AICTE curriculum is cited as a government model-curriculum document. See `references/data_sources.md` for source links and citation notes.

## Suggested personalisation before submission

Replace `[Student name]` and `[College / university]` in the notebook and README. If your professor expects your own institution's curriculum, populate `data/processed/institution_specific_mapping_template.csv` from your official syllabus, revise the mapping, and rerun the notebook. Do not claim the AICTE model is your college's actual syllabus unless you verify that it is.
