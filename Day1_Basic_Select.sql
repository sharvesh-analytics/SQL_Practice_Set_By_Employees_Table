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



-- 3. SELECT STATEMENT

SELECT * FROM employees;



-- 4. WHERE CLAUSE

SELECT * FROM employees 
WHERE city= 'Delhi';

SELECT * FROM employees
WHERE salary>=55000;



-- 5.ARITHIMATIC OPERATORS

SELECT name, salary,bonus, salary+bonus AS total_income
FROM employees;

SELECT name, salary*12 AS annual_income
FROM employees;



-- 6.COMPARISON OPERATORS

SELECT * FROM employees
WHERE salary > 60000;

SELECT * FROM employees 
WHERE age>28;

SELECT * FROM employees
WHERE experience >=5;

SELECT * FROM employees 
WHERE city!='Delhi';


-- 7.LOGICAL OPERATORS

SELECT * FROM employees
WHERE city='Delhi'
AND
salary >='55000';

SELECT * FROM employees
WHERE department ='IT'
OR
department ='HR';

SELECT * FROM employees
WHERE NOT city='Mumbai';



-- 8.BITWISE OPERATORS

SELECT emp_id, 
emp_id & 1 AS RESULT
FROM employees;

SELECT emp_id,
emp_id|2 AS RESULT
FROM employees;


SELECT emp_id,
emp_id^3 AS RESULT
FROM employees;


-- 9.LIMIT CLAUSE

SELECT * FROM employees
WHERE salary>=50000
LIMIT 3;



-- 10.ORDER BY 

SELECT * FROM employees
ORDER BY age ASC;

SELECT * FROM employees
ORDER BY salary DESC;

SELECT name,age,salary FROM employees
ORDER BY age,salary ASC;



-- 11.UPDATE TABLE

UPDATE employees
SET salary=80000
WHERE emp_id=101;

UPDATE employees
SET salary=60000,bonus=6000
WHERE emp_id=102;

SELECT * FROM employees;


-- 12. ALTER TABLE

ALTER TABLE employees
ADD email VARCHAR(50);

ALTER TABLE employees
DROP COLUMN email;



-- 13.STRING FUNCTION

SELECT UPPER(name),name
FROM employees
LIMIT 5;

SELECT LOWER(name),name
FROM employees
LIMIT 5;

SELECT LENGTH(name),name
FROM employees
LIMIT 10;

SELECT CONCAT(name,' work in ',department)
FROM employees;

SELECT SUBSTRING(name,1,3),name
FROM employees;



-- 14.AGGREGATE FUNCTIONS

SELECT COUNT(*) 
      FROM employees;


SELECT SUM(salary)
      FROM employees;

SELECT AVG(salary)
       FROM employees;

SELECT MIN(salary)
      FROM employees;

SELECT MAX(salary)
      FROM employees;




-- 15.GROUP BY

SELECT department,sum(salary)
FROM employees
GROUP BY department;

-- City-Wise average salary

SELECT city,AVG(salary)
FROM employees
GROUP BY city;



-- 17. HAVING CLAUSE

SELECT department,
AVG(salary)
FROM employees
GROUP BY department
HAVING AVG(salary) > 55000;


SELECT city,
COUNT(*)
FROM employees
GROUP BY city
HAVING COUNT(*) > 2;
	   








