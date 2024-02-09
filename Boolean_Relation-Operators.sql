CREATE TABLE customer (
    customer_id INT,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesman_id INT
);

INSERT INTO customer (customer_id, cust_name, city, grade, salesman_id)
VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006),
(3009, 'Geoff Cameron', 'Berlin', 100, 5003),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007),
(3001, 'Brad Guzan', 'London', NULL, 5005);

CREATE TABLE salesman (
    salesman_id INT,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(4, 2)
);

INSERT INTO salesman (salesman_id, name, city, commission)
VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12);

-- ----------------------------- BOOLEAN & RELATIONAL OPERATORS EXERCISES --------------------------------------------------
-- Q.1 write a SQL query to locate the details of customers with grade values above 100. Return customer_id, cust_name, city, grade, and salesman_id.
SELECT 
    customer_id, cust_name, city, grade, salesman_id
FROM
    customer
WHERE
    grade > 100;

-- Q.2 write a SQL query to find all the customers in ‘New York’ city who have a grade value above 100. Return customer_id, cust_name, city, grade, and salesman_id.
SELECT 
    customer_id, cust_name, city, grade, salesman_id
FROM
    customer
WHERE
    city = 'New York' AND grade > 100;
    
-- Q.3 write a SQL query to find customers who are from the city of New York or have a grade of over 100. Return customer_id, cust_name, city, grade, and salesman_id.
SELECT 
    customer_id, cust_name, city, grade, salesman_id
FROM
    customer
WHERE
    city = 'New York' OR grade > 100;
    
-- Q.4 write a SQL query to find customers who are either from the city 'New York' or who do not have a grade greater than 100. Return customer_id, cust_name, city, grade, and salesman_id.
SELECT 
    *
FROM
    customer
WHERE
    city = 'New York' OR NOT grade > 100;

-- Q.5 write a SQL query to identify customers who do not belong to the city of 'New York' or have a grade value that exceeds 100. Return customer_id, cust_name, city, grade, and salesman_id.
SELECT 
    *
FROM
    customer
WHERE
    NOT (city = 'New York' OR grade > 100);

-- Q.6 write a SQL query to find details of all orders excluding those with ord_date equal to '2012-09-10' and salesman_id higher than 5005 or purch_amt greater than 1000.Return ord_no, purch_amt, ord_date, customer_id and salesman_id.
SELECT 
    *
FROM
    orders
WHERE
    NOT ((ord_date = '2012-09-10'
        AND salesman_id > 5005)
        OR purch_amnt > 1000.00);
        
-- Q.7 write a SQL query to find the details of those salespeople whose commissions range from 0.10 to 0.12. Return salesman_id, name, city, and commission. use 'salesman' table
SELECT 
    salesman_id, name, city, commission
FROM
    salesman
WHERE
    commission BETWEEN 0.10 AND 0.12;
    
-- Q.8 write a SQL query to find details of all orders with a purchase amount less than 200 or exclude orders with an order date greater than or equal to '2012-02-10' and a customer ID less than 3009. Return ord_no, purch_amt, ord_date, customer_id and salesman_id
SELECT 
    *
FROM
    orders
WHERE
    (purch_amnt < 200)
        OR NOT (ord_date >= '2012-02-10'
        AND customer_id < 3009);
        
-- Q.9 write a SQL query to find all orders that meet the following conditions. Exclude combinations of order date equal to '2012-08-17' or customer ID greater than 3005 and purchase amount less than 1000.
SELECT 
    *
FROM
    orders
WHERE
    NOT (ord_date = '2012-08-17'
        OR customer_id > 3005 AND purch_amnt < 1000);

-- Q.10 Write a SQL query that displays order number, purchase amount, and the achieved and unachieved percentage (%) for those orders that exceed 50% of the target value of 6000.
SELECT ord_no, purch_amt,
-- Calculates the percentage of the achieved amount.
       (100 * purch_amt) / 6000 AS "Achieved %",
       -- Calculates the percentage of the unachieved amount.
       (100 * (6000 - purch_amnt) / 6000) AS "Unachieved %"
-- Specifies the table from which to retrieve the data (in this case, 'orders').
FROM orders
-- Filters the rows to only include those where the percentage of the achieved amount is greater than 50%.
WHERE (100 * purch_amnt) / 6000 > 50;

-- Q.11 write a SQL query to find the details of all employees whose last name is ‘Dosni’ or ‘Mardy’. Return emp_idno, emp_fname, emp_lname, and emp_dept. TABLE: employees_d
SELECT 
    *
FROM
    employees_d
WHERE
    emp_lname = 'Dosni'
        OR emp_lname = 'Mardy';

-- Q.12 write a SQL query to find the employees who work at depart 47 or 63. Return emp_idno, emp_fname, emp_lname, and emp_dept.  
-- Sample table : employees_d
SELECT 
    *
FROM
    employees_d
WHERE
    emp_dept = 47 OR emp_dept = 63;
