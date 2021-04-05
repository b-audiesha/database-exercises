USE employees;

SELECT DISTINCT last_name
FROM employees
ORDER BY last_name DESC
LIMIT 10;

SELECT *
FROM employees
WHERE birth_date like '%-12-25'
AND hire_date BETWEEN '1990-01-01' AND '1999-12-31'
ORDER BY birth_date DESC, hire_date
    LIMIT 5;

SELECT *
FROM employees
WHERE birth_date like '%-12-25'
  AND hire_date BETWEEN '1990-01-01' AND '1999-12-31'
ORDER BY birth_date DESC, hire_date
    LIMIT 5 OFFSET 50;
