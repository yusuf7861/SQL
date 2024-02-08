
CREATE TABLE integral_emp(
 CustomerID INT ,
 CustomerName VARCHAR(50),
 ContactName VARCHAR(50),
 Address VARCHAR(100),
 City VARCHAR(30),
 PostalCode VARCHAR(10),
 Country VARCHAR(30)
);

INSERT INTO integral_emp
(CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES 
(1, 'Alfreds Futterkiste', 'Maria Anders', 'Obere Str. 57', 'Berlin', '12209', 'Germany'),
(2,	'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Avda. de la Constitución 2222', 'México', 'D.F. 05021', 'Mexico'),
(3, 'Antonio Moreno Taquería', 'Antonio Moreno', 'Mataderos 2312', 'México D.F.', '05023', 'Mexico'),
(4, 'Around the Horn', 'Thomas Hardy', '120 Hanover Sq.', 'London', 'WA1 1DP', 'UK'),
(5, 'Berglunds snabbköp', 'Christina Berglund', 'Berguvsvägen 8', 'Luleå', 'S-958 22', 'Sweden');

SELECT * FROM integral_emp
WHERE Country = 'Mexico';
