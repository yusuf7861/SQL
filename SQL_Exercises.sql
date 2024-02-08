USE emp_details;

CREATE TABLE orders (
    ord_no INT,
    purch_amnt FLOAT,
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);

INSERT INTO orders
(ord_no, purch_amnt, ord_date, customer_id, salesman_id)
values
(70001 ,      150.5   ,    '2012-10-05' , 3005    ,     5002),
(70009  ,     270.65  ,    '2012-09-10' , 3001    ,     5005),
(70002   ,    65.26   ,    '2012-10-05' , 3002    ,     5001),
(70004   ,    110.5   ,    '2012-08-17' , 3009    ,     5003),
(70007   ,    948.5   ,    '2012-09-10' , 3005    ,     5002),
(70005    ,   2400.6   ,   '2012-07-27' , 3007    ,     5001),
(70008    ,   5760    ,    '2012-09-10' , 3002    ,     5001),
(70010    ,   1983.43  , '2012-10-10' , 3004      ,   5006),
(70003    ,   2480.4   ,  '2012-10-10' , 3009     ,    5003),
(70012    ,   250.45    ,  '2012-06-27' , 3008    ,     5002),
(70011    ,   75.29    ,   '2012-08-17' , 3003    ,     5007),
(70013    ,   3045.6  ,    '2012-04-25' , 3002    ,     5001);

-- Q.1 Write a query to display the columns in a specific order, such as order date, salesman ID, order number, and purchase amount for all orders.
SELECT 
    ord_date, salesman_id, ord_no, purch_amnt
FROM
    orders;

-- Q.2 From the following table, write a SQL query to identify the unique salespeople ID. Return salesman_id. 
SELECT DISTINCT
    salesman_id
FROM
    orders;
-- "DISTINCT" keyword is used to identify the unique salesman ID

SELECT 
    ord_no, ord_date, purch_amnt
FROM
    orders
WHERE
    salesman_id = 5001;

CREATE TABLE nobel_win (
    YEAR VARCHAR(20),
    SUBJECT VARCHAR(50),
    WINNER TEXT(100),
    COUNTRY VARCHAR(50),
    CATEGORY VARCHAR(50)
);

INSERT INTO nobel_win(YEAR, SUBJECT, WINNER, COUNTRY, CATEGORY)
VALUES
('1970', 'Physics','Hannes Alfven',  'Sweden' , 'Scientist'),
('1970', 'Physics','Louis Neel', 'France', 'Scientist'),
('1970', 'Chemistry' ,'Luis Federico Leloir', 'France','Scientist'),
('1970', 'Physiology','Ulf von Euler', 'Sweden','Scientist'),
('1970', 'Physiology','Bernard Katz ', 'Germany','Scientist'),
('1970', 'Literature','Aleksandr','Russia','Linguist'),
('1970', 'Economics','Paul Samuelson', 'USA','Economist'),
('1970', 'Physiology','Julius Axelrod','USA','Scientist'),
('1971', 'Physics','Dennis Gabor', 'Hungary', 'Scientist'),
('1971', 'Chemistry','Gerhard Herzberg', 'Germany','Scientist'),
('1971', 'Peace','Willy Brandt', 'Germany' ,'Chancellor'),
('1971', 'Literature' ,'Pablo Neruda','Chile','Linguist'),
('1971', 'Economics ' ,'Simon Kuznets ','Russia', 'Economist'),
('1978', 'Peace  ' ,'Anwar al-Sadat','Egypt','President'),
('1978', 'Peace' ,'Menachem Begin','Israel', 'Prime Minister'),
('1987', 'Chemistry' ,'Donald J. Cram', 'USA' , 'Scientist'),
('1987', 'Chemistry' ,'Jean-Marie Lehn' ,'France', 'Scientist'),
('1987', 'Physiology' ,'Susumu Tonegawa', 'Japan', 'Scientist'),
('1994', 'Economics','Reinhard Selten' , 'Germany', 'Economist'),
('1994', 'Peace','Yitzhak Rabin' , 'Israel' ,'Prime Minister'),
('1987', 'Physics','Johannes Georg','Germany','Scientist'),
('1987', 'Literature' ,'Joseph Brodsky','Russia','Linguist'),
('1987', 'Economics','Robert Solow','USA','Economist'),
('1994', 'Literature','Kenzaburo Oe', 'Japan','Linguist');

-- Q.4  From the following table, write a SQL query to find the Nobel Prize winner in ‘Literature’ for 1971. Return winner. 
SELECT 
    WINNER
FROM
    nobel_win
WHERE
    YEAR = 1971 AND SUBJECT = 'Literature';

-- Q.5 From the following table, write a SQL query to locate the Nobel Prize winner ‘Dennis Gabor'. Return year, subject. 
SELECT 
    YEAR, SUBJECT
FROM
    nobel_win
WHERE
    WINNER = 'Dennis Gabor';

-- Q.6 From the following table, write a SQL query to find the Nobel Prize winners in the field of ‘Physics’ since 1950. Return winner. 
SELECT 
    WINNER
FROM
    nobel_win
WHERE
    SUBJECT = 'Physics' AND YEAR >= 1950;

-- Q.7 From the following table, write a SQL query to find the Nobel Prize winners in ‘Chemistry’ between the years 1965 and 1975. Begin and end values are included. Return year, subject, winner, and country. 
SELECT 
    YEAR, SUBJECT, WINNER, COUNTRY
FROM
    nobel_win
WHERE
    SUBJECT = 'Chemistry' AND YEAR >= 1965
        AND YEAR <= 1975;

-- Q.8 Write a SQL query to display all details of the Prime Ministerial winners after 1972 of Menachem Begin and Yitzhak Rabin. 
SELECT 
    *
FROM
    nobel_win
WHERE
    YEAR > 1972
        AND WINNER IN ('Menachem Begin' , 'Yitzhak Rabin');

-- Q.9 From the following table, write a SQL query to retrieve the details of the winners whose first names match with the string ‘Louis’. Return year, subject, winner, country, and category. 
SELECT 
    YEAR, SUBJECT, WINNER, COUNTRY
FROM
    nobel_win
WHERE
    WINNER LIKE 'Louis %';
    
-- Q.10 From the following table, write a SQL query that combines the winners in Physics, 1970 and in Economics, 1971. Return year, subject, winner, country, and category. 
SELECT *
FROM nobel_win
-- Combines the results of two SELECT statements using the UNION operator.
-- The first SELECT statement retrieves rows where the 'subject' is 'Physics' and the 'year' is 1970.
WHERE (subject = 'Physics' AND year = 1970)
-- The UNION operator combines the results of the first SELECT statement with the results of the second SELECT statement.
UNION
-- The second SELECT statement retrieves rows where the 'subject' is 'Economics' and the 'year' is 1971.
(SELECT * FROM nobel_win WHERE (subject = 'Economics' AND year = 1971));

-- Q.11 From the following table, write a SQL query to find the Nobel Prize winners in 1970 excluding the subjects of Physiology and Economics. Return year, subject, winner, country, and category.
-- This query selects all columns from the 'nobel_win' table.
SELECT 
    *
FROM
    nobel_win
WHERE
    year = 1970
        AND TRIM(SUBJECT) NOT IN ('Physiology' , 'Economics');
-- The TRIM() function removes leading and trailing spaces from a string. Using this function will ensure that any leading or trailing spaces in the 'subject' column are removed before the comparison. This should correctly exclude the 'Economics' entry from the output.

-- Q.12 From the following table, write a SQL query to combine the winners in 'Physiology' before 1971 and winners in 'Peace' on or after 1974. Return year, subject, winner, country, and category. 
SELECT 
    *
FROM
    nobel_win
WHERE
    (subject = 'Physiology' AND year < 1971) 
UNION (SELECT 
    *
FROM
    nobel_win
WHERE
    subject = 'Peace' AND year > 1974);
    
-- Q.13 From the following table, write a SQL query to find Nobel Prize winners for the subject that does not begin with the letter 'P'. Return year, subject, winner, country, and category. Order the result by year, descending and winner in ascending. 
SELECT 
    *
FROM
    nobel_win
WHERE
    SUBJECT NOT LIKE 'P%'
ORDER BY YEAR DESC , winner;

-- Q.14 From the following table, write a SQL query to find the details of 1970 Nobel Prize winners. Order the results by subject, ascending except for 'Chemistry' and ‘Economics’ which will come at the end of the result set. Return year, subject, winner, country, and category. 
-- This query selects all columns from the 'nobel_win' table.
SELECT *
FROM nobel_win
WHERE year = 1970
-- Orders the result set based on multiple criteria.
ORDER BY
  -- The CASE statement assigns a priority (1 or 0) based on the 'subject' column.
  CASE
    WHEN subject IN ('Chemistry','Economics') THEN 1
    ELSE 0
  END ASC,
  -- Orders the result set by 'subject' in ascending order.
  subject,
  -- Orders the result set by 'winner' in ascending order.
  winner;

-- --------------------------------------------------------------------------------------------------------------
CREATE TABLE item_mast (
    PRO_ID INT PRIMARY KEY,
    PRO_NAME VARCHAR(255),
    PRO_PRICE DECIMAL(10, 2),
    PRO_COM INT
);
INSERT INTO item_mast  (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM)
VALUES 
(101, 'Mother Board', 3200.00, 15),
(102, 'Key Board', 450.00, 16),
(103, 'ZIP drive', 250.00, 14),
(104, 'Speaker', 550.00, 16),
(105, 'Monitor', 5000.00, 11),
(106, 'DVD drive', 900.00, 12),
(107, 'CD drive', 800.00, 12),
(108, 'Printer', 2600.00, 13),
(109, 'Refill cartridge', 350.00, 13),
(110, 'Mouse', 250.00, 12);

-- Q.15 write a SQL query to select a range of products whose price is in the range Rs.200 to Rs.600. Begin and end values are included. Return pro_id, pro_name, pro_price, and pro_com.
SELECT 
    *
FROM
    item_mast
WHERE
    pro_price BETWEEN 200 AND 600;

-- Q.16  write a SQL query to calculate the average price for a manufacturer code of 16. Return avg.
SELECT 
    AVG(pro_price)
FROM
    item_mast
WHERE
    pro_com = 16;

-- Q.17 write a SQL query to display the pro_name as 'Item Name' and pro_priceas 'Price in Rs.'
SELECT 
    pro_name AS 'Item Name', pro_price AS 'Price in Rs,'
FROM
    item_mast;

-- Q.18 write a SQL query to find the items whose prices are higher than or equal to $250. Order the result by product price in descending, then product name in ascending. Return pro_name and pro_price.
SELECT 
    pro_name, pro_price
FROM
    item_mast
WHERE
    pro_price >= 250.0
ORDER BY pro_price DESC , pro_name;

-- Q.19 write a SQL query to calculate average price of the items for each company. Return average price and company code
SELECT 
    AVG(pro_price), pro_com
FROM
    item_mast
    -- Groups the result set by the 'pro_com' column.
GROUP BY pro_com;

-- Q.20 write a SQL query to find the cheapest item(s). Return pro_name and, pro_price.
SELECT pro_name, pro_price
FROM item_mast
-- Filters the rows to only include those where the 'pro_price' column is equal to the minimum 'pro_price'.
WHERE pro_price = (SELECT MIN(pro_price) FROM item_mast);

-- ------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE employees_d (
    EMP_IDNO INT PRIMARY KEY,
    EMP_FNAME VARCHAR(50),
    EMP_LNAME VARCHAR(50),
    EMP_DEPT INT
);

-- Insert data into the employees table
INSERT INTO employees_d (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT)
VALUES 
(127323, 'Michale', 'Robbin', 57),
(526689, 'Carlos', 'Snares', 63),
(843795, 'Enric', 'Dosio', 57),
(328717, 'Jhon', 'Snares', 63),
(444527, 'Joseph', 'Dosni', 47),
(659831, 'Zanifer', 'Emily', 47),
(847674, 'Kuleswar', 'Sitaraman', 57),
(748681, 'Henrey', 'Gabriel', 47),
(555935, 'Alex', 'Manuel', 57),
(539569, 'George', 'Mardy', 27),
(733843, 'Mario', 'Saule', 63),
(631548, 'Alan', 'Snappy', 27),
(839139, 'Maria', 'Foster', 57);

-- Q.21 write a SQL query to find the unique last name of all employees. Return emp_lname.
SELECT DISTINCT emp_lname FROM employees_d;

-- Q.22 write a SQL query to find the details of employees whose last name is 'Snares'. Return emp_idno, emp_fname, emp_lname, and emp_dept.
SELECT emp_idno, emp_fname, emp_lname, emp_dept FROM employees_d WHERE emp_lname = 'Snares';

-- Q.23 write a SQL query to retrieve the details of the employees who work in the department 57. Return emp_idno, emp_fname, emp_lname and emp_dept.
SELECT emp_idno, emp_fname, emp_lname, emp_dept FROM employees_d WHERE emp_dept = 57;