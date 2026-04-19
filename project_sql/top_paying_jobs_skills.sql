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


