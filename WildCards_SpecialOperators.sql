-- Q.1 write a SQL query to find the details of those salespeople who come from the 'Paris' City or 'Rome' City. Return salesman_id, name, city, commission. Sample table: salesman
SELECT 
    salesman_id, name, city, commission
FROM
    salesman
WHERE
    city = 'Paris' OR city = 'Rome';
    
-- Q.2 write a SQL query to find the details of the salespeople who come from either 'Paris' or 'Rome'. Return salesman_id, name, city, commission. 
SELECT 
    salesman_id, name, city, commission
FROM
    salesman
WHERE
    city = 'Paris' OR city = 'Rome';
    
-- Q.3 write a SQL query to find the details of those salespeople who live in cities other than Paris and Rome. Return salesman_id, name, city, commission. 
SELECT 
    *
FROM
    salesman
WHERE
    NOT city IN ('Paris' , 'Rome');
