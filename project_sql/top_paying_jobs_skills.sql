SELECT
  skills,
  ROUND(AVG(salary_year_avg),2) as avg_salary_paid ,ROW_NUMBER()OVER(ORDER BY ROUND(AVG(salary_year_avg),2)DESC) as SR_NO
FROM job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id=skills_dim.skill_id
WHERE
 job_work_from_home= TRUE
GROUP BY
  skills
HAVING AVG(salary_year_avg) IS NOT NULL
ORDER BY avg_salary_paid DESC
LIMIT 50;

----------------------------------------------------------------------------------------------------------------------

-- Select the skill name
-- Calculate the average yearly salary for each skill and round it to 2 decimal places
SELECT
  skills,
  ROUND(AVG(salary_year_avg),2) AS avg_salary_paid

-- Main table containing job postings and salary information
FROM job_postings_fact

-- Join table that links jobs with required skills
INNER JOIN skills_job_dim 
  ON job_postings_fact.job_id = skills_job_dim.job_id

-- Join table that contains the skill names
INNER JOIN skills_dim 
  ON skills_job_dim.skill_id = skills_dim.skill_id

-- Filter only Data Analyst jobs
-- Filter only remote (work from home) jobs
WHERE
  job_title_short = 'Data Analyst'
  AND job_work_from_home = TRUE

-- Group results by skill so we can calculate average salary per skill
GROUP BY skills

-- Sort skills by highest average salary first
ORDER BY avg_salary_paid DESC

-- Show only the top 50 highest paying skills
LIMIT 50;

------------------------------------------------------------------------------------------------