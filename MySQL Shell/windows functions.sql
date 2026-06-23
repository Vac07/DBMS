# ----------------------------------------------/ 14-04-2026 \---------------------------------------------------
# ----------------------------------------------/ movie_db \-----------------------------------------------------
# ---------------------------------------------/ Windows function \----------------------------------------------
use movie_db;
SELECT * FROM  movie_db.imdb_titles;    

SELECT 
	ROW_NUMBER() OVER(ORDER BY r.averagerating DESC) AS row_num,
    t.primaryTitle AS title,
    r.averageRating AS rating
FROM imdb_titles t
JOIN imdb_ratings r ON t.tconst = r.tconst
WHERE t.titleType = 'movie' AND r.numVotes >= 10000
LIMIT 10;

# -/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
WITH top1 as (
SELECT 
	ROW_NUMBER() OVER(ORDER BY r.averagerating DESC) AS row_num,
    t.primaryTitle AS title,
    r.averageRating AS rating
FROM imdb_titles t
JOIN imdb_ratings r ON t.tconst = r.tconst
WHERE t.titleType = 'movie' AND r.numVotes >= 10000
LIMIT 10
)
select * from top1 where row_num=1;
# -/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/

WITH topgenre as (
SELECT 
	ROW_NUMBER() OVER(ORDER BY r.averagerating DESC) AS row_num,
    t.genres AS genres,
    r.averageRating AS rating
FROM imdb_titles t
JOIN imdb_ratings r ON t.tconst = r.tconst
WHERE t.genres = 'Short' AND r.numVotes >= 1000
LIMIT 100
)
select * from topgenre;
select * from imdb_ratings;


# -/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
use hr;
SELECT employee_id, first_name, department_id, salary,
	ROW_NUMBER() OVER(PARTITION BY department_id ORDER BY salary DESC) AS row_num,
    RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) as_rank,
    DENSE_RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) as_dense_rank
    FROM employees;
    
# -/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
    
-- rank emp1 based on their salary - high to low

SELECT employee_id, first_name, department_id, salary,
	RANK() OVER(ORDER BY salary DESC) as_rank
    from employees
    limit 5;
    
-- top 3 unique salary employee

SELECT employee_id, first_name, department_id, salary,
	DENSE_RANK() OVER(ORDER BY salary DESC) as_rank
    from employees
    limit 3;
    
# -/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
-- rank the movie within the genre

use movie_db;
select * from imdb_ratings;



# -/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
use hr;
SELECT employee_id, first_name, department_id, salary,
last_value(salary) OVER(partition by department_id) as_last_value
from employees;

SELECT employee_id, first_name, department_id, salary,
first_value(salary) OVER(partition by department_id) as_first_value
from employees;

# -/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/


use movie_db;
select table_name, table_rows from information_schema.tables
where table_schema='movie_db';

select sum(table_rows) as num_rows from information_schema.tables where table_schema='movie_db';

-- 78,856,051
SHOW TABLES;


