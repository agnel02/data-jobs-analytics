CREATE PROCEDURE top_paying_jobs(IN p_job_role VARCHAR(100))
BEGIN
    SELECT 
        cd.name AS comp_name,
        jp.job_id,
        jp.company_id,
        jp.job_title_short,
        jp.job_title,
        ROUND(AVG(jp.salary_year_avg), 2) AS avg_salary,
        GROUP_CONCAT(sd.skills SEPARATOR ', ') AS skills
    FROM job_postings_fact jp
    INNER JOIN company_dim cd ON jp.company_id = cd.company_id
    INNER JOIN skills_job_dim sj ON jp.job_id = sj.job_id
    INNER JOIN skills_dim sd ON sj.skill_id = sd.skill_id
    WHERE jp.salary_year_avg IS NOT NULL
      AND jp.job_title_short LIKE CONCAT('%', p_job_role, '%')
    GROUP BY cd.name, jp.job_id, jp.company_id, jp.job_title_short, jp.job_title
    ORDER BY avg_salary DESC
    LIMIT 10;
END;

CALL top_paying_jobs('Software Engineer');
CREATE INDEX idx_job_title_short ON job_postings_fact(job_title_short);