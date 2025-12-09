/*
Question: What are the most high payed skills for data analysts?
    -Return the skill name
    -Return a top 10
*/
SELECT 
    sd.skills AS skill_name,
    ROUND (AVG(jpf.salary_year_avg), 1) AS average_salary
FROM job_postings_fact AS jpf
JOIN skills_job_dim AS sjd ON jpf.job_id = sjd.job_id
JOIN skills_dim AS sd ON sjd.skill_id = sd.skill_id
WHERE 
    (jpf.salary_year_avg IS NOT NULL) AND (jpf.job_title_short = 'Data Analyst')
GROUP BY 
    sd.skills
ORDER BY average_salary DESC
LIMIT 10;
