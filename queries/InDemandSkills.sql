/*
Question: What are the most in-demand skills for data analysts?
    -Return the skill name
    -Return a top 10
*/
SELECT 
    sd.skills AS skill_name,
    COUNT(jpf.job_id) AS job_count
FROM skills_dim AS sd
JOIN skills_job_dim AS sjd ON sd.skill_id = sjd.skill_id
JOIN job_postings_fact AS jpf ON sjd.job_id = jpf.job_id
WHERE 
    jpf.job_title_short = 'Data Analyst'
GROUP BY 
    sd.skills
ORDER BY job_count DESC
LIMIT 10;