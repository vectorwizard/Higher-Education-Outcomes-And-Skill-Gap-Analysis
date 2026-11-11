# Data sources and citation notes

## 1. Jobspiq — Indian technology skills in demand

- Skills page: https://jobspiq.in/skills
- Data download page: https://jobspiq.in/data
- Public open-data repository: https://github.com/jobspiq/jobspiq-public
- Access date / captured snapshot: 11 November 2026
- Data window: active Indian technology job postings observed in the 30 days preceding the capture date (as stated on the source page).
- Source page reported 128,053 active technology job listings and displayed skill counts. The CSV in `data/raw/` preserves the 76 skill rows visible on the page at capture time.
- Licence: Creative Commons Attribution 4.0 International (CC BY 4.0), as stated by Jobspiq.
- Suggested citation: Jobspiq. (2026). *Tech skills in demand in India* [Data set; live page captured 11 November 2026]. https://jobspiq.in/skills. CC BY 4.0.
- Important limitations: one job can mention multiple skills; counts measure public postings, not hires or total workforce demand. Jobspiq describes collection from public job postings and duplicate merging. Some postings may not expose all details.

## 2. All India Council for Technical Education (AICTE) — CSE model curriculum

- Document: *Model Curriculum for UG Degree Course in Computer Science and Engineering (Engineering & Technology)*, 2022.
- URL: https://www.aicte.gov.in/sites/default/files/Updated-AICTE%20-%20UG%20CSE.pdf
- Relevant sections consulted: Programming for Problem Solving; Introduction to Database Systems; Operating Systems; Computer Networks; Software Engineering, Machine Learning, and Distributed and Cloud Systems micro-specialisations.
- Examples of evidence used in mapping:
  - Database Systems learning outcomes include schema design and SQL queries (printed page 116 in the PDF).
  - Operating Systems material includes Unix shell tools and OS distributions (printed pages 130–131).
  - Software Engineering micro-specialisation includes testing, integration and deployment (printed pages 165–166).
  - Machine Learning micro-specialisation includes ML and programming frameworks such as PyTorch and TensorFlow (printed pages 167–168).
  - Distributed and Cloud Systems specialisation includes cloud-native applications, containerisation, REST-based web services, streaming data management and key-value storage (printed pages 169–170).
- Suggested citation: All India Council for Technical Education. (2022). *Model Curriculum for UG Degree Course in Computer Science and Engineering (Engineering & Technology).* https://www.aicte.gov.in/sites/default/files/Updated-AICTE%20-%20UG%20CSE.pdf
- Important limitation: the document is a model curriculum. Institutional adoption, course availability, sequencing and depth vary. The project does not assume that it is the student's actual curriculum.

## 3. AISHE — possible future extension

- AISHE Final Reports: https://aishe.gov.in/aishe-final-report/
- Use only if the project is expanded to analyse national higher-education enrolment, institutions, programmes, faculty or examination outcomes. AISHE is not included in the present numeric analysis.

## 4. NIRF — possible future extension

- NIRF Engineering ranking/institution disclosures: https://www.nirfindia.org/Rankings/2025/EngineeringRanking.html
- Use institution-level submitted data for number graduating, number placed and median salary by academic year. Placement metrics should not be merged with the current Jobspiq skills data as though they describe the same people or cohort.
