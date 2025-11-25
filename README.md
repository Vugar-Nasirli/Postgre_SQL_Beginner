# Introduction
Let's dive into the job market which is related to the Data focused roles: With focusing on specifically Data Analyst job postings, this project explores the most in-demand and high-paid skills which we called most optimal skills needed in Data Analytics roles.
SQL queries you need? Check them out here [SQL_Project folder](/SQL_Project/) 
# Background
This project was born need for finding most optimum skills in order to start diving into the World of Data Analytics. With gaining insights about which skills are most demanded and high-paid for Data Analytics role, job seeker can build roadmap in order to find wide chances to gain experience and increase the cahnce of being high-paid roles. 
This project use some critical insights about job market of Data related roles: titles, salaries, companies, location and essential skills. 
### The questions this project intended to answer through queries which used throughout steps

1. What are the top-paying jobs for my role? 'top paying jobs'
2. What are skills required for these top-paying jobes? '
3. What are the most in-demand skills for my role?
4. What are top skills based on the salalry for my role? 
5. What are the most optimal skills to learn for my role? (Optimal means high demand and high paying.)

# Tools I Used
For my deep diving into the Data related job market, I use different tools and techniques with data analysis methods. 
- **SQL**: The backbone of my analysis. With practicing from foundational concepts to the advanced techniques.
- **PostgreSQL**: The DBMS which I choos in order to handle job market dataset. From creating tables to copying CSV data into tables and querying through data.
- **Excel**: Used for copying data into SQL tables with the help of delimeterizing data.
- **VSCode**: Visual Studio Code using managing queries and data as well as pushing to github.
- **Git and GitHub**: Essential for version control and sharing my work for collaboration and project tracking.
# The Analysis
Each query for this project aimed to investigate specific aspect of job market especially in the role of Data Analyst.
Now dive into how I approach each question:
### Query 1 - Top Paying Data Analyst Jobs
For finding top paying Data Analyst jobs I select jobs from table which contain all job postings where specifically Remote Data Analyst roles offering yearly average salary is most additionally I mentioned which company offer this job with joining tables contains information about companies and job postings.
This query highlights high-paid remote Data Analyst role job opportunities.
```sql
SELECT
    job_id,
    job_title,
    company_dim.name AS company,
    job_schedule_type,
    job_location,
    salary_year_avg,
    job_posted_date
FROM 
    job_postings_fact
LEFT JOIN
    company_dim
ON
    job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst'
    AND
    job_work_from_home = TRUE
    AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
``` 
Result:
| Job ID | Job Title                                       | Company                                      | Schedule   | Location | Salary (Year Avg) | Posted Date          |
|--------|--------------------------------------------------|-----------------------------------------------|------------|----------|--------------------|-----------------------|
| 226942 | Data Analyst                                     | Mantys                                        | Full-time  | Anywhere | 650000.0           | 2023-02-20 15:13:33   |
| 547382 | Director of Analytics                            | Meta                                          | Full-time  | Anywhere | 336500.0           | 2023-08-23 12:04:42   |
| 552322 | Associate Director- Data Insights                | AT&T                                          | Full-time  | Anywhere | 255829.5           | 2023-06-18 16:03:12   |
| 99305  | Data Analyst, Marketing                          | Pinterest Job Advertisements                  | Full-time  | Anywhere | 232423.0           | 2023-12-05 20:00:40   |
|1021647 | Data Analyst (Hybrid/Remote)                     | Uclahealthcareers                             | Full-time  | Anywhere | 217000.0           | 2023-01-17 00:17:23   |
| 168310 | Principal Data Analyst (Remote)                  | SmartAsset                                    | Full-time  | Anywhere | 205000.0           | 2023-08-09 11:00:01   |
| 731368 | Director, Data Analyst - HYBRID                  | Inclusively                                   | Full-time  | Anywhere | 189309.0           | 2023-12-07 15:00:13   |
| 310660 | Principal Data Analyst, AV Performance Analysis  | Motional                                      | Full-time  | Anywhere | 189000.0           | 2023-01-05 00:00:25   |
|1749593 | Principal Data Analyst                           | SmartAsset                                    | Full-time  | Anywhere | 186000.0           | 2023-07-11 16:00:05   |
| 387860 | ERM Data Analyst                                 | Get It Recruit - Information Technology       | Full-time  | Anywhere | 184000.0           | 2023-06-09 08:01:04   |

### Query 2 - Top Paying Job Skills
According afore-mentioned query I use again and find top paying jobs then joining this data with roles and find top paying jobs require which skills. And this data give job seekers in order to get high paid remote Data Analyst jobs which skills they need.
```sql
WITH high_payed_jobs AS 
(
SELECT
    job_id,
    job_title,
    company_dim.name AS company,
    salary_year_avg
FROM 
    job_postings_fact
LEFT JOIN
    company_dim
ON
    job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst'
    AND
    job_work_from_home = TRUE
    AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10
)

SELECT
    high_payed_jobs.job_id,
    job_title,
    skills_dim.skills,
    company,
    salary_year_avg
FROM
    high_payed_jobs
INNER JOIN
    skills_job_dim
ON
    skills_job_dim.job_id = high_payed_jobs.job_id
INNER JOIN
    skills_dim
ON
    skills_job_dim.skill_id = skills_dim.skill_id;
```
Result:
| Job ID | Job Title                                   | Skill       | Company                                   | Salary (Year Avg) |
|--------|----------------------------------------------|-------------|--------------------------------------------|--------------------|
| 552322 | Associate Director- Data Insights            | sql         | AT&T                                       | 255829.5           |
| 552322 | Associate Director- Data Insights            | python      | AT&T                                       | 255829.5           |
| 552322 | Associate Director- Data Insights            | r           | AT&T                                       | 255829.5           |
| 552322 | Associate Director- Data Insights            | azure       | AT&T                                       | 255829.5           |
| 552322 | Associate Director- Data Insights            | databricks  | AT&T                                       | 255829.5           |
| 552322 | Associate Director- Data Insights            | aws         | AT&T                                       | 255829.5           |
| 552322 | Associate Director- Data Insights            | pandas      | AT&T                                       | 255829.5           |
| 552322 | Associate Director- Data Insights            | pyspark     | AT&T                                       | 255829.5           |
| 552322 | Associate Director- Data Insights            | jupyter     | AT&T                                       | 255829.5           |
| 552322 | Associate Director- Data Insights            | excel       | AT&T                                       | 255829.5           |
| 552322 | Associate Director- Data Insights            | tableau     | AT&T                                       | 255829.5           |
| 552322 | Associate Director- Data Insights            | power bi    | AT&T                                       | 255829.5           |
| 552322 | Associate Director- Data Insights            | powerpoint  | AT&T                                       | 255829.5           |
| 99305  | Data Analyst, Marketing                      | sql         | Pinterest Job Advertisements               | 232423.0           |
| 99305  | Data Analyst, Marketing                      | python      | Pinterest Job Advertisements               | 232423.0           |
| 99305  | Data Analyst, Marketing                      | r           | Pinterest Job Advertisements               | 232423.0           |
| 99305  | Data Analyst, Marketing                      | hadoop      | Pinterest Job Advertisements               | 232423.0           |
| 99305  | Data Analyst, Marketing                      | tableau     | Pinterest Job Advertisements               | 232423.0           |
|1021647 | Data Analyst (Hybrid/Remote)                 | sql         | Uclahealthcareers                          | 217000.0           |
|1021647 | Data Analyst (Hybrid/Remote)                 | crystal     | Uclahealthcareers                          | 217000.0           |
|1021647 | Data Analyst (Hybrid/Remote)                 | oracle      | Uclahealthcareers                          | 217000.0           |
|1021647 | Data Analyst (Hybrid/Remote)                 | tableau     | Uclahealthcareers                          | 217000.0           |
|1021647 | Data Analyst (Hybrid/Remote)                 | flow        | Uclahealthcareers                          | 217000.0           |
| 168310 | Principal Data Analyst (Remote)              | sql         | SmartAsset                                 | 205000.0           |
| 168310 | Principal Data Analyst (Remote)              | python      | SmartAsset                                 | 205000.0           |
| 168310 | Principal Data Analyst (Remote)              | go          | SmartAsset                                 | 205000.0           |
| 168310 | Principal Data Analyst (Remote)              | snowflake   | SmartAsset                                 | 205000.0           |
| 168310 | Principal Data Analyst (Remote)              | pandas      | SmartAsset                                 | 205000.0           |
| 168310 | Principal Data Analyst (Remote)              | numpy       | SmartAsset                                 | 205000.0           |
| 168310 | Principal Data Analyst (Remote)              | excel       | SmartAsset                                 | 205000.0           |
| 168310 | Principal Data Analyst (Remote)              | tableau     | SmartAsset                                 | 205000.0           |
| 168310 | Principal Data Analyst (Remote)              | gitlab      | SmartAsset                                 | 205000.0           |
| 731368 | Director, Data Analyst - HYBRID              | sql         | Inclusively                                | 189309.0           |
| 731368 | Director, Data Analyst - HYBRID              | python      | Inclusively                                | 189309.0           |
| 731368 | Director, Data Analyst - HYBRID              | azure       | Inclusively                                | 189309.0           |
| 731368 | Director, Data Analyst - HYBRID              | aws         | Inclusively                                | 189309.0           |
| 731368 | Director, Data Analyst - HYBRID              | oracle      | Inclusively                                | 189309.0           |
| 731368 | Director, Data Analyst - HYBRID              | snowflake   | Inclusively                                | 189309.0           |
| 731368 | Director, Data Analyst - HYBRID              | tableau     | Inclusively                                | 189309.0           |
| 731368 | Director, Data Analyst - HYBRID              | power bi    | Inclusively                                | 189309.0           |
| 731368 | Director, Data Analyst - HYBRID              | sap         | Inclusively                                | 189309.0           |
| 731368 | Director, Data Analyst - HYBRID              | jenkins     | Inclusively                                | 189309.0           |
| 731368 | Director, Data Analyst - HYBRID              | bitbucket   | Inclusively                                | 189309.0           |
| 731368 | Director, Data Analyst - HYBRID              | atlassian   | Inclusively                                | 189309.0           |
| 731368 | Director, Data Analyst - HYBRID              | jira        | Inclusively                                | 189309.0           |
| 731368 | Director, Data Analyst - HYBRID              | confluence  | Inclusively                                | 189309.0           |
| 310660 | Principal Data Analyst, AV Performance Analysis | sql       | Motional                                   | 189000.0           |
| 310660 | Principal Data Analyst, AV Performance Analysis | python    | Motional                                   | 189000.0           |
| 310660 | Principal Data Analyst, AV Performance Analysis | r        | Motional                                   | 189000.0           |
| 310660 | Principal Data Analyst, AV Performance Analysis | git      | Motional                                   | 189000.0           |
| 310660 | Principal Data Analyst, AV Performance Analysis | bitbucket| Motional                                   | 189000.0           |
| 310660 | Principal Data Analyst, AV Performance Analysis | atlassian| Motional                                   | 189000.0           |
| 310660 | Principal Data Analyst, AV Performance Analysis | jira     | Motional                                   | 189000.0           |
| 310660 | Principal Data Analyst, AV Performance Analysis | confluence| Motional                                   | 189000.0           |
|1749593 | Principal Data Analyst                        | sql         | SmartAsset                                 | 186000.0           |
|1749593 | Principal Data Analyst                        | python      | SmartAsset                                 | 186000.0           |
|1749593 | Principal Data Analyst                        | go          | SmartAsset                                 | 186000.0           |
|1749593 | Principal Data Analyst                        | snowflake   | SmartAsset                                 | 186000.0           |
|1749593 | Principal Data Analyst                        | pandas      | SmartAsset                                 | 186000.0           |
|1749593 | Principal Data Analyst                        | numpy       | SmartAsset                                 | 186000.0           |
|1749593 | Principal Data Analyst                        | excel       | SmartAsset                                 | 186000.0           |
|1749593 | Principal Data Analyst                        | tableau     | SmartAsset                                 | 186000.0           |
|1749593 | Principal Data Analyst                        | gitlab      | SmartAsset                                 | 186000.0           |
| 387860 | ERM Data Analyst                              | sql         | Get It Recruit - Information Technology    | 184000.0           |
| 387860 | ERM Data Analyst                              | python      | Get It Recruit - Information Technology    | 184000.0           |
| 387860 | ERM Data Analyst                              | r           | Get It Recruit - Information Technology    | 184000.0           |
### Query 3 - Top Demanded Skills
According to count of skills in Remote Data Analyst job postings we can find the most demanded skills. As a category I selected which skills are mentioned more than 1000 job postings it is high demanded.
```sql
SELECT  
    skills AS skill_name,
    COUNT(job_postings_fact.job_id) AS job_count
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
GROUP BY
    skill_name
HAVING
    COUNT(job_postings_fact.job_id) > 1000
ORDER BY
    job_count DESC;
```
Result:
| Skill Name | Job Count |
|------------|-----------|
| sql        | 7291      |
| excel      | 4611      |
| python     | 4330      |
| tableau    | 3745      |
| power bi   | 2609      |
| r          | 2142      |
| sas        | 1866      |
### Query 4 - Top Skills Based on Salary
In this query we try to find skills impact to the salary of the job. How to find? Firstly we grouping Remote Data Analyst jobs according to skills then calculate average of average yearly salaries for each skill. Then the more average salary the more impact to the salary of job. And for me top 10 skills is most high paid skills. 
```sql
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
GROUP BY
    skills
ORDER BY
    average_salary DESC
LIMIT 25;
``` 
Result:
| Skill       | Average Salary |
|-------------|----------------|
| svn         | 400000         |
| solidity    | 179000         |
| couchbase   | 160515         |
| datarobot   | 155486         |
| golang      | 155000         |
| mxnet       | 149000         |
| dplyr       | 147633         |
| vmware      | 147500         |
| terraform   | 146734         |
| twilio      | 138500         |
### Query 5 - Optimal Skills (Final Query Version 1)
Question: Finding most optimal skills
Find high demand and associate with high paid skills according to high average salary skills.
As a result we find most payed 50 Data Analytics skills according to average salary based on each skill, then we find most demanded Data Analytics skills which are mentioned more than 500 jobs. Then we check these most demanded skills through most payed skills and matched skills are called most optimal skills. 
```sql
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
```
Result:
| Skill     | Demand Count |
|-----------|--------------|
| python    | 4330         |
| r         | 2142         |
| looker    | 868          |
| azure     | 821          |
| go        | 815          |
| aws       | 769          |
| oracle    | 619          |
| snowflake | 608          |

In this table we can see that most demanded skills check for are also most high paid skills if yes in the table you can see them as a optimal skills according to conditions that we give (Required more than 500 Data Analyst job postings and also more than 50 high paid Data Analyst jobs wihch are remote).
### Query 6 - Optimal Skills (Final Query Version 2)
The result set of skills is the high demand and high paid Data Analyst skills which are finding more than 10 000 Data Analyst job postings and also more than 50 high paid Data Analyst job postings
For example I am job seeker for Data Analyst role, I want to find job and I need gain some skills. With this data I try to find firstly which data analyst job are high paid with the help of dividing categories with the help of first CTE query, then I use other query to find which Data Analyst jobs are high paid jobs with second CTE query, then with UNION we can take high demand and high paid skills together and can see with category which is high demand which is high paid only. 
This skills give a chance to us being ready for most of the Data Analyst roles as well as High Paid Data Analyst roles.
```sql
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
```
Result:
| Skill      | Job Count | Category            |
|------------|-----------|---------------------|
| aws        | 57        | High_Paying_Skill   |
| azure      | 60        | High_Paying_Skill   |
| azure      | 10942     | High_Demand_Skill   |
| excel      | 122       | High_Paying_Skill   |
| excel      | 67031     | High_Demand_Skill   |
| oracle     | 54        | High_Paying_Skill   |
| oracle     | 10410     | High_Demand_Skill   |
| power bi   | 71        | High_Paying_Skill   |
| power bi   | 39468     | High_Demand_Skill   |
| powerpoint | 13848     | High_Demand_Skill   |
| python     | 264       | High_Paying_Skill   |
| python     | 57326     | High_Demand_Skill   |
| r          | 129       | High_Paying_Skill   |
| r          | 30075     | High_Demand_Skill   |
| sap        | 11297     | High_Demand_Skill   |
| sas        | 80        | High_Paying_Skill   |
| sas        | 28068     | High_Demand_Skill   |
| sql        | 327       | High_Paying_Skill   |
| sql        | 92628     | High_Demand_Skill   |
| tableau    | 180       | High_Paying_Skill   |
| tableau    | 46554     | High_Demand_Skill   |
| word       | 13591     | High_Demand_Skill   |

According this table we can see that aws not high demand but high paid skill, powerpoint, sap and word not high paid but high demand skills. When it comes to optimal skills means both high demand and high paid together all other skills in the table. This table show that azure, excel, oracle, python, power bi, sql and so on skills are optimal for both finding job very quickly and increase the chance of finding high-paid job.  
# What I Learned
Throughout this porject journey I extend my view according to how data can hide very meaningfull and reasonable infromation when approach in correct way. There are several techniques and methods I learned:
- Foundational basics: These include operations, functions, data types and changing them also reading the data story with columns and rows. 
- Case statements: With the help of case statements I can add some data according to conditions also reasonable use of information comes from data
- Joins and Unions: These two methods of working with data and tables according to columns and rows it is crucial weapon in my arsenal.
- Subqueries and CTE: When you try to perform something different than simple queries and tables you can use these twins. 
- Analytical Thinking: It is most valuable gift to me from this project. Thinking about the story of the data and the results of queries with thinking in a way that data may give us numerous information from every row and column. 
# Conclusion
This project talk about a story where a job seeker want to find remote Data Analyst roles from Data job market but he need some skills to gain job oppotunities. And he started to search for which skills he need? When he make quries to find skills he noticed that hee should gain skills which give him open door for many Data Analytics roles but also they should required from high paid roles. Then he find which skills required by high paid roles as well as high demanded according all Data Analyst roles and finally find optimal skills to learn and improve. According to the way of thinking we give you 2 different version of The End queries in the final of Data Story. 
