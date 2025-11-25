/*
    Question: Finding most optimal skills
    - Find high demand and associate with high paid skills according to high average salary skills
*/


WITH
high_payed_skills AS
(
SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS average_salary
FROM
    job_postings_fact
INNER JOIN
    skills_job_dim
ON
    job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim
ON
    skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND
    salary_year_avg IS NOT NULL
    AND
    job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    average_salary DESC
LIMIT 50
)


SELECT  
    skills,
    COUNT(job_postings_fact.job_id) AS demand_count
FROM
    job_postings_fact
INNER JOIN
    skills_job_dim
ON
    job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim
ON
    skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND
    job_work_from_home = TRUE
    AND
    skills IN 
    (
        SELECT
            skills
        FROM
            high_payed_skills
    )
GROUP BY
    skills
HAVING
    COUNT(job_postings_fact.job_id) > 500
ORDER BY
    demand_count DESC;


/*
As a result we find most payed 50 Data Analytics skills according to average salary based on each skill, then we find most demanded Data Analytics skills which are mentioned more than 500 jobs. Then we check these most demanded skills through most payed skills and matched skills are called most optimal skills. 
*/
