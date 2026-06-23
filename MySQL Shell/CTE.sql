WITH emp as (
	SELECT employee_id, first_name,
    salary,department_id FROM employees 
	-- JOIN departments d
    -- ON e.department_id=d.department_id
)
SELECT (SELECT COUNT(*) AS no_of_emp FROM emp) AS no_emp,
	   (SELECT AVG(salary) AS avg_sal FROM emp) AS avg_sal,
       (SELECT SUM(salary) AS sum_sal FROM emp) AS sum_sal;
	
    
# -----------------------------------------------------------

use northwind;
       
WITH RECURSIVE rec AS (
    -- Start date (min date from orders)
    SELECT MIN(DATE(order_date)) AS dt
    FROM orders

    UNION ALL

    -- Generate next dates
    SELECT dt + INTERVAL 1 DAY
    FROM rec
    WHERE dt < (SELECT MAX(DATE(order_date)) FROM orders)
),

order_day AS (
    SELECT DATE(o.order_date) AS od_da, COUNT(*) AS no_od_od
    FROM order_details od
    join orders o
    on o.id=od.id
    WHERE YEAR(order_date) = 2006
    GROUP BY DATE(order_date)
)

SELECT 
    r.dt,
    DAYNAME(r.dt) AS day_name,
    COALESCE(od.no_od_od, 0) AS total_orders
FROM rec r
LEFT JOIN order_day od 
    ON r.dt = od.od_da
ORDER BY total_orders desc;




