SELECT
sd.skills
COUNT(jp.job_title_short) as job_name
FROM job_postings_fact jp 
JOIN skills_job_dim sj on jp.job_id=sj.job_id
JOIN skills_dim sd on sd.skill_id=sj.skill_id
GROUP BY skills , 
limit 20;
