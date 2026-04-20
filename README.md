                             SQL Job & Skills Analytics Project

Exploring what the data job market actually looks like — through real data, real queries, and real insights.

![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)

---

Overview

I built this project because I wanted a real answer to a question a lot of people in data have but rarely dig into properly — what do companies actually want, what do they pay, and where are the opportunities?

Not what career blogs say. Not what course curriculums assume. What shows up in real job postings, at scale.

To find out, I took a dataset of 787,686 real-world job postings, loaded it into MySQL, wrote queries to surface the patterns, generated charts with Python, and built a Power BI dashboard that lets anyone explore the market on their own terms — filtered by role, location, salary range, and benefits.

This is a full end-to-end data project. Raw CSV data goes in. Actionable job market insights come out.

---

What This Project Answers

- Which skills are most in demand across data roles right now?
- Which companies are hiring the most and what do they pay?
- How does salary vary across different roles and locations?
- What does the global distribution of data jobs actually look like?
- If I am targeting a specific role, what should I know going in?

---

The Dataset

Source          — Luke Barousse, SQL for Data Analytics course dataset
Total Records   — 787,686 job postings
Tables          — job_postings_fact, company_dim, skills_dim, skills_job_dim
Format          — CSV, 4 files, approximately 48MB total

The four tables are connected through foreign keys. Job postings link to companies through company_dim and connect to required skills through the skills_job_dim bridge table. Most meaningful queries join across at least three of these tables.

Note: CSV files are stored in this repository using Git LFS due to their size. You may need to run git lfs pull after cloning to download them locally.

---

Project Structure

SQL_PROJECT/
│
├── DASHBOARD/
│   ├── job_analytics.pbix
│   └── images/
│
├── DATA/
│   └── data/
│       ├── company_dim.csv
│       ├── job_postings_fact.csv
│       ├── skills_dim.csv
│       └── skills_job_dim.csv
│
├── plot/
│   ├── skills_demand.py
│   ├── skills_plot.py
│   ├── top_paying_company.py
│   └── images/
│       ├── skills_demand.png
│       ├── skills_plot.png
│       └── top_paying_company.png
│
├── project_sql/
│   ├── top_paying_jobs_skills.sql
│   ├── top_company_skills.sql
│   └── optimal_skills.sql
│
├── .gitattributes
├── .gitignore
└── README.md

---

Part 1 — SQL Analysis (MySQL)

This is where the core analysis lives. All queries are written in MySQL and run against the four-table relational schema.

Top paying jobs and skills
Joins job_postings_fact with company_dim and skills_job_dim to find which roles and companies offer the highest compensation and what skills those postings consistently require.

Top company skills
Identifies which companies appear most frequently in postings and maps the skills they ask for — useful for targeting specific employers.

Optimal skills
Combines skill demand frequency with salary data to find skills that are both highly requested and associated with better pay. These are the ones worth prioritizing if you are trying to move fast.

Techniques used: multi-table JOINs, CTEs, GROUP BY aggregations, window functions, subqueries, and ORDER BY ranking.

---

Part 2 — Python Visualization (Pandas, Matplotlib, Seaborn)

Three Python scripts take SQL query results and turn them into charts saved to plot/images/.

skills_demand.py
Plots a ranked bar chart of the most frequently requested skills across all job postings in the dataset.

skills_plot.py
Compares skill demand across different role categories side by side — useful for seeing where certain tools are concentrated.

top_paying_company.py
Visualizes which companies post the most data roles and how their compensation compares across the board.

Libraries used — Pandas, Matplotlib, Seaborn

---

Part 3 — Power BI Dashboard

This is where everything comes together. The dashboard is built for someone who wants to understand the job market without running a single query themselves. Everything is visual, filterable, and designed to answer a specific question in under a minute.

Filters — personalize the entire dashboard by:
- Job role and title
- Location and country
- Salary range
- Benefits offered

KPIs — update live based on your filters:
- Total job postings for the selected role
- Median salary
- Maximum salary
- Top hiring company with open vacancies

Visuals included:

Most in-demand skills by role
See exactly which tools and technologies employers ask for depending on the role you filter to.

Average salary by role
A clean comparison of how compensation differs across data analyst, scientist, engineer, and other roles.

Market distribution
How different roles are spread across the job market and which ones dominate by volume.

Ribbon chart
Shows how role and skill demand has shifted over time, making trends visible at a glance.

Top countries by job vacancy
A table view of where the most opportunities are concentrated globally for the selected role.

Job listings table
The most detailed view in the dashboard. Each row shows the company logo, job title, posting date, company name, and a direct link to apply.

---

Key Findings

SQL is the most consistently requested skill across all data roles. It shows up regardless of seniority, specialization, or location.

Python follows closely and is growing into analyst roles, not just engineering and science positions.

A small set of tools — Excel, Tableau, Power BI — covers the majority of what analyst-level roles actually ask for. The list is shorter than most people think.

Salary varies significantly by location. The same role can pay very differently depending on country, and the dashboard makes this immediately visible.

A small number of companies account for a large share of postings. Knowing what those specific employers look for is a real edge.

---

Getting Started

1. Clone the repository
   git clone https://github.com/agnel02/SQL_PROJECT.git

2. Pull the CSV files via Git LFS
   git lfs pull

3. Import the CSVs into MySQL and run the SQL files in project_sql/
   Start with top_paying_jobs_skills.sql

4. Run the Python scripts to regenerate charts if needed
   python plot/skills_demand.py

5. Open DASHBOARD/job_analytics.pbix in Power BI Desktop to explore the full dashboard

---

Tech Stack

Tool                                  — Purpose
MySQL                                 — Core data storage, querying, and analysis
Python (Pandas, Matplotlib, Seaborn)  — Chart generation from query results
Power BI                              — Interactive dashboard with filters, KPIs, and visuals
Git and GitHub                        — Version control and project hosting

---

Purpose

This started as a way to learn SQL properly but turned into something genuinely useful. The dashboard alone gives anyone exploring a data career more clarity than most career guides do — because it is built on actual hiring data, not assumptions.

If you are figuring out what to learn, where to apply, or what to expect in terms of salary, the answers are in here.

---

787,686 job postings analyzed  —  MySQL  —  Python  —  Power BI
github.com/agnel02/data-jobs-analytics
