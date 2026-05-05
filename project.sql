-- Total Employees
SELECT COUNT(*) FROM employees;

-- Avg salary per dept
SELECT dept, AVG(salary)
FROM employees
GROUP BY dept;

-- Highest salary per dept
SELECT *
FROM (
  SELECT name, dept, salary,
  RANK() OVER (PARTITION BY dept ORDER BY salary DESC) AS rnk
  FROM employees
) t
WHERE rnk = 1;

-- Salary category
SELECT 
CASE 
  WHEN salary > 50000 THEN 'High'
  WHEN salary BETWEEN 30000 AND 50000 THEN 'Medium'
  ELSE 'Low'
END AS category,
COUNT(*)
FROM employees
GROUP BY category;

-- Bonus analysis
SELECT e.name, e.salary, b.bonus,
(e.salary + IFNULL(b.bonus,0)) AS total_income
FROM employees e
LEFT JOIN bonus b
ON e.emp_id = b.emp_id;

-- Top 3 earners
SELECT * FROM employees
ORDER BY salary DESC
LIMIT 3;
