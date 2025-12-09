/*
Question: What skills are required for the jobs located in the top 20?
    - Add all the skills required for each of the jobs. 
    - If they are null, do not display them.
*/
WITH top_20_paying_jobs AS(
    SELECT 
        jpf.job_id,
        jpf.job_title AS job_role,
        cd.name AS company_name,
        jpf.salary_year_avg AS average_salary,
        RANK() OVER (
            ORDER BY salary_year_avg DESC
        ) AS rank_position
    FROM job_postings_fact AS jpf
        LEFT JOIN company_dim AS cd ON cd.company_id = jpf.company_id
    WHERE (
            jpf.job_title_short LIKE '%Data Analyst%'
        )
        AND (jpf.salary_year_avg IS NOT NULL)
    LIMIT 20
)

SELECT 
    sd.skills AS skill_name,
    tpj.company_name,
    tpj.average_salary
FROM top_20_paying_jobs AS tpj
JOIN 
    skills_job_dim AS sjd ON tpj.job_id = sjd.job_id
JOIN 
    skills_dim AS sd ON sjd.skill_id = sd.skill_id
ORDER BY tpj.rank_position ASC;


