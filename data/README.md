# Data dictionary

## Raw file: `raw/jobspiq_skills_demand_india_2026-11-11.csv`

- `skill`: normalised skill label shown by Jobspiq.
- `active_job_postings`: count of active tech listings mentioning the skill.
- `as_of_date`: date captured.
- `total_active_technology_postings`: source-reported denominator.
- `share_of_active_technology_postings_pct`: count divided by denominator times 100. Skill shares overlap because a job may mention multiple skills.
- `source`: page/access note.

## Mapping file: `processed/aicte_2022_curriculum_skill_mapping.csv`

- `curriculum_coverage_score`: 0 (no explicit match), 1 (related/elective), 2 (core/direct).
- `coverage_category`: text label for the score.
- `skill_family`: broad analytical category.
- `curriculum_evidence`: relevant AICTE course/specialisation or note that no explicit match was identified.
- `mapping_rationale`: explanation of how the score was assigned.
- `evidence_scope`: the reference document used.
