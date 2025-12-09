/*
Question: What are the most optimal skills for data analysts?
    -Return the skill name
    -Return a top 10
    -Optimal refers to most high payment and most on-demand skills
*/
SELECT 
    sd.skills,
    COUNT(jpf.job_id) AS job_count,
    ROUND (AVG(jpf.salary_year_avg), 1) AS average_salary
FROM job_postings_fact jpf
JOIN skills_job_dim sjd ON jpf.job_id = sjd.job_id
JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
WHERE
    (jpf.job_title_short = 'Data Analyst') AND (jpf.salary_year_avg IS NOT NULL)
GROUP BY sd.skills
HAVING 
    COUNT(jpf.job_id) > 20
ORDER BY
    average_salary DESC,
    job_count DESC
LIMIT 10;
