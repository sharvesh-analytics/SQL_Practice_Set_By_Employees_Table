-- 1.TABLE CREATE( DATA TYPES & CONSTRAINTS)

CREATE TABLE employees(
     emp_id INT PRIMARY KEY,
	 name VARCHAR(50) NOT NULL,
	 age INT CHECK(age>=18),
	 gender VARCHAR(10),
	 city VARCHAR(30),
	 department VARCHAR(30),
	 salary DECIMAL(10,2),
	 experience INT,
	 joining_date DATE,
	 bonus INT DEFAULT(0)
);


-- 2.INSERT DATA

INSERT INTO employees
VALUES
(101,'Rahul',25,'Male','Delhi','IT',50000,2,'2021-06-10',5000),

(102,'Priya',28,'Female','Mumbai','HR',45000,4,'2019-03-15',4000),

(103,'Amit',30,'Male','Lucknow','Finance',60000,6,'2018-01-20',7000),

(104,'Neha',24,'Female','Delhi','IT',55000,3,'2020-08-05',6000),

(105,'Vikas',35,'Male','Pune','Marketing',70000,8,'2016-09-12',8000),

(106,'Anjali',27,'Female','Mumbai','IT',52000,3,'2021-11-18',5500),

(107,'Rohan',29,'Male','Delhi','Finance',65000,5,'2019-05-22',7500),

(108,'Sneha',26,'Female','Lucknow','HR',48000,2,'2022-02-14',4500),

(109,'Arjun',32,'Male','Pune','IT',75000,7,'2017-07-09',9000),

(110,'Kiran',23,'Female','Delhi','Marketing',43000,1,'2023-01-25',3500);





-- 3. DEPARTMENT TABLE
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    department VARCHAR(30),
    manager_name VARCHAR(50),
    location VARCHAR(30)
);



-- 4. DATA INSERT

INSERT INTO departments
VALUES
(1,'IT','Rakesh','Delhi'),
(2,'HR','Pooja','Mumbai'),
(3,'Finance','Vivek','Lucknow'),
(4,'Sales','Ankit','Pune');



-- 5.Subqueries in WHERE Clause

SELECT *
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);




-- 5a.AVERAGE SALARY

SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);




-- 5b.MIN SALARY

SELECT *
FROM employees
WHERE salary = (
    SELECT MIN(salary)
    FROM employees
);




-- 5c. WHICH ONE EMPLOYEES SALARY IS GREATER THAN AVERAGE(SALARY)  IT DEPARTMENT

SELECT *
FROM employees
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
    WHERE department='IT'
);




-- 5d. MAXIMUM SALARY OF DELHI EMPLOYEES

SELECT *
FROM employees
WHERE salary =
(
    SELECT MAX(salary)
    FROM employees
    WHERE city='Delhi'
);




-- 6. Subquery with IN


SELECT *
FROM employees
WHERE department IN
(
    SELECT department
    FROM employees
    GROUP BY department
    HAVING AVG(salary) > 55000
);



-- 6a. IN ONE CITY HAVING EMPLOYEES GREATER THAN TWO
SELECT *
FROM employees
WHERE city IN
(
    SELECT city
    FROM employees
    GROUP BY city
    HAVING COUNT(*) > 2
);




-- 7.SUBSQUERY WITH EXISTS

SELECT *
FROM employees e
WHERE EXISTS
(
    SELECT *
    FROM employees
    WHERE department = e.department
    AND salary > 75000
);




-- 8.Subquery in SELECT Clause

SELECT
name,
salary,
(
    SELECT AVG(salary)
    FROM employees
) AS avg_salary
FROM employees;



SELECT
name,
salary,
(
    SELECT MAX(salary)
    FROM employees
) AS highest_salary
FROM employees;




-- 9.Subquery in FROM Clause

SELECT *
FROM
(
    SELECT department,
           AVG(salary) AS avg_sal
    FROM employees
    GROUP BY department
) AS dept_avg;


SELECT *
FROM
(
    SELECT department,
           AVG(salary) avg_salary
    FROM employees
    GROUP BY department
) temp
ORDER BY avg_salary DESC
LIMIT 1;




-- 10.CTE (Common Table Expression)


-- Department-wise average salary


WITH dept_avg AS
(
    SELECT department,
           AVG(salary) avg_salary
    FROM employees
    GROUP BY department
)

SELECT *
FROM dept_avg;




-- DEPARTMENT HIGHEST AVERAGE SALARY HEIHGER THAN 55000

WITH dept_avg AS
(
    SELECT department,
           AVG(salary) avg_salary
    FROM employees
    GROUP BY department
)

SELECT *
FROM dept_avg
WHERE avg_salary > 55000;



-- MAXIMUM AVERAGE SALARY FROM DEPARTMENT

WITH dept_avg AS
(
    SELECT department,
           AVG(salary) avg_salary
    FROM employees
    GROUP BY department
)

SELECT *
FROM dept_avg
ORDER BY avg_salary DESC
LIMIT 1;



-- Department-wise total bonus


WITH dept_bonus AS
(
    SELECT department,
           SUM(bonus) total_bonus
    FROM employees
    GROUP BY department
)

SELECT *
FROM dept_bonus;




-- Department-wise employee count


WITH dept_count AS
(
    SELECT department,
           COUNT(*) total_employees
    FROM employees
    GROUP BY department
)

SELECT *
FROM dept_count;



