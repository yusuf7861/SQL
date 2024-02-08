CREATE DATABASE Emp_Details;
USE Emp_Details;
CREATE TABLE employees(
	emp_id INT,
    emp_name VARCHAR(30),
    emp_department VARCHAR(50)
);

CREATE TABLE customers (
	customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(100)
);

INSERT INTO customers 
(customer_id, customer_name, email)
VALUES (1, 'Yusuf Jamal', 'yjamal710@gmail.com'),
(2, 'komal saxena', 'komalsaxena612@'),
(3, 'Wasi Akhtar', 'wasi69@gmail.com');

SELECT * FROM customers;