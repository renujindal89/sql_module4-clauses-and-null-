create database batch3;
drop database batch3;

use batch3;
drop table dummyusers;
CREATE TABLE DummyUsers (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Address VARCHAR(255),
    City VARCHAR(50),
    Country VARCHAR(50),
    BirthDate DATE,
    RegistrationDate DATETIME,
    Salary DECIMAL(10,2),
    Bonus DECIMAL(10,2),
    Age INT,
    Score INT
);
INSERT INTO DummyUsers (FirstName, LastName, Email, Address, City, Country, BirthDate, RegistrationDate, Salary, Bonus, Age, Score)
VALUES
('John', '      Doe', 'john.doe@example.com', '123 Main St', 'New York', 'USA', '1990-05-15', '2023-01-10 09:30:00', 50000, 5000, 33, 85),
('Jane', 'Smith      ', 'jane.smith@example.com', '456 Elm St', 'Los Angeles', 'USA', '1985-08-22', '2023-03-15 14:45:00', 65000, 7000, 38, 92),
('Michael', '   Brown', 'michael.brown@example.com', '789 Oak St', 'Chicago', 'USA', '2000-12-05', '2023-05-20 11:20:00', 40000, 3000, 23, 78),
('Emily', 'Davis   ', 'emily.davis@example.com', '321 Pine St', 'Houston', 'USA', '1995-03-30', '2023-07-08 16:10:00', 55000, 4500, 28, 88),
('David', 'Wilson', 'david.wilson@example.com', '654 Maple St', 'Phoenix', 'USA', '1988-11-12', '2023-09-25 08:55:00', 72000, 8000, 35, 95);
select * from dummyusers;


-- string function

SELECT *,CONCAT(FirstName,' ',  LastName) as new_name
FROM DummyUsers;
-- SELECT firstname,lastname,(FirstName +  LastName) AS FullName FROM DummyUsers;

SELECT firstname,LENGTH(firstName) AS NameLength FROM DummyUsers;

SELECT email,UPPER(email) FROM DummyUsers;
SELECT city,LOWER(City) AS LowerCity FROM DummyUsers;
SELECT city,SUBSTRING(city, 3, 6) AS ShortAddress FROM DummyUsers;
SELECT email,SUBSTRING(Email, 1, 4) AS EmailStart FROM DummyUsers;

-- it returns the part of the string before or after a delimiter.



SELECT city,left(City, 3) AS CityShort FROM DummyUsers;
SELECT address, RIGHT(Address, 5) AS AddressEnd FROM DummyUsers;

-- TRIM / LTRIM / RTRIM
-- Purpose: Remove unwanted spaces or characters.

SELECT lastname,length(lastname),length(TRIM(lastname)) AS Cleaned,
trim(firstname),length(TRIM(lastname)) from DummyUsers;



update dummyusers
set lastname=trim(lastname);

select * from dummyusers;
SELECT lastname,length(LTRIM(lastname)) AS LeftClean from DummyUsers;

SELECT TRIM(BOTH '$' FROM '$$renu$$') AS result;

SELECT TRIM(LEADING '0' FROM '00012345') AS result;

SELECT TRIM(both '!' FROM '!!Hello World!!!') AS result;
-- date functions 

-- yyyy-mm-dd  sql format


create table a (date_id text(10));
drop table a;
insert into a values ('2026-2-17'),('2026-2-18');
select * from a;
desc a;
select date_id,str_to_date(date_id,'%Y-%m-%d') as updated_date
from a;
desc a;
drop table b;
CREATE TABLE b (
    date_id VARCHAR(20)
);

INSERT INTO b VALUES
('05/2026/02'),
('10/2026/09'),
('2026/11/23');
insert into b values
('invalid');

SELECT STR_TO_DATE(date_id,'%m/%Y/%d')
FROM b;

ALTER TABLE b
ADD COLUMN new_date DATE;

UPDATE b
SET new_date = STR_TO_DATE(date_id,'%d/%m/%Y');

ALTER TABLE b
DROP COLUMN date_id;

ALTER TABLE b
CHANGE new_date date_id DATE;


alter table  a
modify date_id date;

desc a;





-- Date functions:

 select birthdate,str_to_date(birthdate,'%Y-%m-%d') as updated_date
 from dummyuser;
 

SELECT CURDATE();  -- only current date
SELECT NOW(); -- Current date & time

SELECT now(),DATE(NOW());-- extract date 
select birthdate from dummyusers;
SELECT birthdate,YEAR(BirthDate) AS BirthYear FROM DummyUsers;
SELECT birthdate,day(BirthDate) AS BirthYear FROM DummyUsers;
SELECT birthdate,month(BirthDate) AS Birthmonth FROM DummyUsers;
SELECT birthdate,dayname(BirthDate) AS BirthYear FROM DummyUsers;
SELECT birthdate,monthname(BirthDate) AS BirthYear FROM DummyUsers;
SELECT MONTH(RegistrationDate) AS RegistrationMonth FROM DummyUsers;

SELECT birthdate, DATEDIFF(now(), BirthDate) AS DaysLived FROM DummyUsers;
SELECT birthdate, round((DATEDIFF(now(), BirthDate))/365,0) AS DaysLived FROM DummyUsers;
SELECT birthdate, round((DATEDIFF(now() , BirthDate))/365,0)
 AS yearsLived FROM DummyUsers;

SELECT birthdate,DATE_ADD(BirthDate, INTERVAL 10 month) as next_2_year from dummyusers;



-- integer functions 

select * from dummyusers;

SELECT salary,bonus,Salary + Bonus as updated_salary FROM DummyUsers;
SELECT salary,Salary * 0.1 AS Tax FROM DummyUsers; 
SELECT salary,ROUND(Salary * 0.1, 2) AS Tax FROM DummyUsers; 
SELECT salary,ROUND(Salary * 0.1) AS Tax FROM DummyUsers;

SELECT score/10 ,round((score/10),2) as round_2,
round((score/10)) as round,floor(Score / 10) AS floor,ceil(score/10) as ceil FROM DummyUsers; -- Rounds a number up to the nearest integer

SELECT salary/1000,FLOOR(Salary / 1000) AS SalaryInThousands FROM DummyUsers;-- Rounds a number down to the nearest integer
select round(55.4,1) ;
SELECT Salary - 60000,ABS(Salary - 60000) AS DifferenceFromTarget FROM DummyUsers;-- Returns the absolute (positive) value of a number


-- HANDLING NULL VALUES

select * from dummyusers;

INSERT INTO DummyUsers (FirstName, LastName, Email, Address, City, Country, BirthDate, RegistrationDate, Salary, Bonus, Age, Score)
VALUES
('Alice', 'Johnson', NULL, '987 Birch St', 'Seattle', 'USA', '1992-07-19', '2023-02-10 10:15:00', 60000, NULL, 31, 90),
('Bob', NULL, 'bob.smith@example.com', NULL, 'Miami', 'USA', NULL, '2023-04-12 12:00:00', NULL, 2000, NULL, 75),
('Charlie', 'Miller', 'charlie.miller@example.com', '159 Cedar St', NULL, 'USA', '1987-09-05', NULL, 70000, 5000, 38, NULL),
('Diana', NULL, NULL, NULL, 'Denver', 'USA', '1995-11-22', '2023-06-18 15:30:00', 55000, 3000, 28, 85);

-- MySQL because NULL represents “unknown” or missing data, and it behaves differently than regular values.
select * from dummyusers;
-- NULL can break Airthemetic operations
SELECT salary,bonus,Salary + Bonus AS TotalIncome
FROM DummyUsers;
-- NULL can break string operations
SELECT firstname,lastname,CONCAT(FirstName, ' ', LastName) AS FullName
FROM DummyUsers;

-- If either Salary or Bonus is NULL, TotalIncome becomes NULL

-- IFNULL()
-- Purpose: Replace NULL with a specified value.
select * from dummyusers where lastname is null;
SELECT bonus,IFNULL(Bonus, 0) AS BonusValue FROM DummyUsers;

SELECT salary,bonus,IFNULL(Salary,0) + IFNULL(Bonus,0) AS TotalIncome
FROM DummyUsers;

SELECT lastname,IFNULL(LastName,' ') AS lastName1
FROM DummyUsers;


SELECT firstname,lastname,CONCAT(FirstName, ' ', IFNULL(LastName,' ')) AS FullName
FROM DummyUsers;

SELECT bonus,IFNULL(Bonus, 0) AS BonusValue FROM DummyUsers;
select bonus from dummyusers;
SELECT SUM(IFNULL(Bonus,0)) AS TotalBonusWithZero FROM DummyUsers;
select bonus from dummyusers;


-- Aggregate functions like SUM(), AVG(), COUNT(column) ignore NULL values:
SELECT SUM(Bonus) FROM DummyUsers;  -- Ignores NULLs
SELECT COUNT(Bonus) FROM DummyUsers; -- Counts only non-NULL Bonus

-- IS NULL 

SELECT * FROM DummyUsers
WHERE Email IS NULL;

-- Find users with Email present
SELECT * FROM DummyUsers
WHERE Email IS NOT NULL;

update dummyusers
set email='unknown'
where email is null;

SET SQL_SAFE_UPDATES = 0;



-- In SQL Server, ISNULL() works differently:
-- ISNULL(column, replacement_value)


Database Function to Replace NULL
Oracle     NVL(bonus,0)
MySQL    IFNULL(bonus,0)
SQL Server   ISNULL()
postgre
All (Standard SQL) COALESCE()
-- ANOTHER EXAMPLE



--  COALESCE return  First non-NULL value in the list


CREATE TABLE UserContacts (
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Phone VARCHAR(20),
    Mobile VARCHAR(20)
);
INSERT INTO UserContacts (FirstName, LastName, Phone, Mobile)
VALUES
('John', 'Doe', '123-456-7890', NULL),
('Jane', 'Smith', NULL, '987-654-3210'),
('Michael', 'Brown', NULL, NULL),
('Emily', 'Davis', '555-111-2222', '555-333-4444'),
('David', 'Wilson', NULL, NULL),
('Alice', 'Johnson', NULL, NULL);

select * from usercontacts;
SELECT FirstName, LastName, phone,mobile,COALESCE(Phone, Mobile, 'No Contact') AS PrimaryContact
FROM usercontacts;

 
 
 CREATE TABLE student (
    name VARCHAR(50),
    CONSTRAINT chk_name
    CHECK (name REGEXP '^[A-Za-z ]+$')
);


-- CASE STATEMENT

use mohitdb;
create database mohitdb;
select * from employees;
CREATE TABLE Employees (
    EmployeeID   int PRIMARY KEY,
    Name         varchar(100),
    DepartmentID int,
    Salary       int
);
 
INSERT INTO Employees VALUES (1, 'Alice',   10, 50000);
INSERT INTO Employees VALUES (2, 'Bob',     20, 75000);
INSERT INTO Employees VALUES (3, 'Charlie', 10, 45000);
INSERT INTO Employees VALUES (4, 'Diana',   30, 90000);
 
 select * from employees;
 
   -- SIMPLE CASE EXPRESSION 
   -- compare a column with fixed value:
 
SELECT 
    Name,
    DepartmentID,
    CASE DepartmentID
        WHEN 10 THEN 'HR'
        WHEN 20 THEN 'Finance'
        WHEN 30 THEN 'Engineering'
        ELSE 'Unknown'
    END AS DepartmentName
FROM Employees;
 
 
     --- Searched CASE Expression 
     -- Checks logical conditions (>, <, =, etc.)

 
SELECT 
    Name,
    Salary,
    CASE 
        WHEN Salary < 50000 THEN 'Low'
        WHEN Salary BETWEEN 50000 AND 80000 THEN 'Medium'
        WHEN Salary > 80000 THEN 'High'
        ELSE 'Not Specified'
    END AS SalaryCategory
FROM Employees;
 
 
      -- CASE in ORDER BY :
SELECT 
    Name,
    Salary,
    CASE 
        WHEN Salary > 80000 THEN 'High'
        WHEN Salary BETWEEN 50000 AND 80000 THEN 'Medium'
        ELSE 'Low'
    END AS SalaryCategory
FROM Employees
ORDER BY salarycategory asc;

 
 
      

 
 
  -- CASE with Aggregate Functions :

  SELECT
    COUNT(CASE WHEN DepartmentID = 10 THEN 1 END) AS HR_Count,
    COUNT(CASE WHEN DepartmentID = 20 THEN 1 END) AS Finance_Count,
    COUNT(CASE WHEN DepartmentID = 30 THEN 1 END) AS Engineering_Count
FROM Employees;







CREATE TABLE employees (
    id INT,
    name VARCHAR(50),
    gender CHAR(1),
    salary INT
);

INSERT INTO employees (id, name, gender, salary) VALUES
(1, 'John', 'M', 5000),
(2, 'Mary', 'F', 6200),
(3, 'Alex', 'M', 7200),
(4, 'Sara', 'F', 5800),
(5, 'Mike', 'M', 4500);

SELECT
    MAX(CASE WHEN gender = 'M' THEN salary END) AS max_male_salary,
    MAX(CASE WHEN gender = 'F' THEN salary END) AS max_female_salary
FROM employees;


CREATE TABLE sales (
    id INT,
    date DATE,
    amount INT
);

INSERT INTO sales (id, date, amount) VALUES
(1, '2025-01-05', 100),
(2, '2025-01-20', 250),
(3, '2025-02-10', 300),
(4, '2025-02-28', 150),
(5, '2025-03-03', 500),
(6, '2025-03-15', 200);

SELECT
    SUM(CASE WHEN MONTH(date) = 1 THEN amount ELSE 0 END) AS jan,
    SUM(CASE WHEN MONTH(date) = 2 THEN amount ELSE 0 END) AS feb,
    SUM(CASE WHEN MONTH(date) = 3 THEN amount ELSE 0 END) AS mar
FROM sales;

