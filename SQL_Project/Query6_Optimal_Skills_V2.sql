-- Practiice question 1
-- What are the top-paying jobs for my role? 'top paying jobs'
-- What are skills required for these top-paying jobes? 'skills in top-paying roles'
-- What are the most in-demand skills for my role? 'number of skills in my role'
-- What are top skills based on the salalry for my role? 'number of skills in top-paying jobs for my role'
-- What are the most optimal skills to learn for my role? Optimal means high demand and high paying
-- 15.000 - 585.000 - 650.000 - 890.000 - 960.000 pays for jobs
-- 25.000 - 650.000 for Data Analyst


WITH 
salary_category AS -- CTE 1 for salary category for categorizing jobs
(
    SELECT
        *,
        CASE
            WHEN salary_year_avg BETWEEN 15000 AND 80000
            THEN 'Low-paid'
            WHEN salary_year_avg BETWEEN 80001 AND 130000
            THEN 'Medium-paid'
            WHEN salary_year_avg > 130000
            THEN 'High-paid'
            ELSE 'Unknown'
        END AS category
    FROM
        job_postings_fact
    WHERE
        salary_year_avg IS NOT NULL
        AND
        job_title_short = 'Data Analyst'
),

high_paid_jobs AS -- CTE 2 for finding skills in high paid data analyst jobs
(
SELECT 
    job_postings_fact.job_id,
    job_postings_fact.job_title_short,
    job_postings_fact.job_location,
    skills_dim.skills AS skills,
    job_postings_fact.salary_year_avg,
    salary_category.category
FROM
    salary_category
INNER JOIN
    job_postings_fact
ON
    salary_category.job_id = job_postings_fact.job_id
INNER JOIN
    skills_job_dim
ON  
    job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim
ON
    skills_job_dim.skill_id = skills_dim.skill_id
WHERE  
    salary_category.category = 'High-paid'
ORDER BY
    job_postings_fact.salary_year_avg
)

-- Main query
SELECT
    skills AS skill,
    COUNT(*) AS job_count,
    'High_Paying_Skill' AS category
FROM 
    high_paid_jobs
GROUP BY
    skills
HAVING
    COUNT(*) > 50

UNION 

SELECT 
    skills_dim.skills AS skill,
    COUNT(*) AS job_count,
    'High_Demand_Skill' AS category
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
    job_postings_fact.job_title_short = 'Data Analyst'
GROUP BY
    skills_dim.skills
HAVING
    COUNT(*) > 10000;




/*
The result set of skills is the high demand and high paid Data Analyst skills which are finding more than 10 000 Data Analyst job postings and also more than 50 high paid Data Analyst job postings
For example I am job seeker for Data Analyst role, I want to find job and I need gain some skills. With this data I try to find firstly which data analyst job are high paid with the help of dividing categories with the help of first CTE query, then I use other query to find which Data Analyst jobs are high paid jobs with second CTE query, then with UNION we can take high demand and high paid skills together and can see with category which is high demand which is high paid only. 
This skills give a chance to us being ready for most of the Data Analyst roles as well as High Paid Data Analyst roles.
*/
