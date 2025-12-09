/*
    Question: What are the top 20 highest paying jobs based on average salary?
    Based on my needs: 
        -I want this jobs to be for all types of Data analysis positions.
        -I want to know which companies are offering these jobs.
*/

SELECT
    jpf.job_title AS job_role,
    cd.name AS company_name,
    jpf.salary_year_avg AS average_salary,
    RANK() OVER (ORDER BY salary_year_avg DESC) AS rank_position
FROM job_postings_fact AS jpf
LEFT JOIN company_dim AS cd ON cd.company_id = jpf.company_id
WHERE
    (jpf.job_title_short LIKE '%Data Analyst%')
    AND
    (jpf.salary_year_avg IS NOT NULL)
LIMIT 20;




