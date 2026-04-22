-- HANDLING NUL VALUES
use module_4;
 
 CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    WorkEmail VARCHAR(100),
    PersonalEmail VARCHAR(100),
    BackupEmail VARCHAR(100)
);
INSERT INTO Users (UserID, WorkEmail, PersonalEmail, BackupEmail) VALUES
(1, NULL, 'john@gmail.com', NULL),
(2, 'jane@company.com', NULL, NULL),
(3, NULL, NULL, 'user3@backup.com'),
(4, NULL, NULL, NULL);
select * from users;

select * from users where backupemail is null;

select sum( case when WorkEmail is null then 1 else 0 end )as null_count_workemail from users; 

SELECT CONCAT(workemail,personalemail) from users; -- problem


CREATE TABLE Emps (
    EmpID INT,
    EmpName VARCHAR(50),
    Salary DECIMAL(10, 2),
    AnnualBonus DECIMAL(10, 2)
);
 
INSERT INTO Emps(EmpID, EmpName, Salary, AnnualBonus)
VALUES 
(1, 'Raj', 60000, 6000),
(2, 'Brijesh', NULL, 8000),
(3, 'John', 75000, NULL),
(4, 'Manoj', NULL, 4500),
(5, 'Vanshil', 51000, NULL);
select * from emps;
SELECT Salary + AnnualBonus AS TotalCompensation FROM Emps;
select count(salary) as total_row from emps;
select count(empname) as total_emp from emps;



-- USE CASES
-- 1 IS NULL( TO FECTCH THE ROWS HAVING NULL VAUES )
-- select * from table where column is null'
-- 2 If NULL (fill null with the specified value, OR WE CAN SAY replace NULL values with a specified value)
-- 3--- COALESCE (Return the first non-null value in a list)

SELECT ifnull(NULL, 'Default Value') AS Result;
SELECT IfNULL(NULL, 20) AS Result;
SELECT IfNULL('Hello', 'Hi') AS Result;






-- to handle this we use coalesce
SELECT EmpName, Coalesce(AnnualBonus,0) FROM Emps;
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    WorkEmail VARCHAR(100),
    PersonalEmail VARCHAR(100),
    BackupEmail VARCHAR(100)
);
INSERT INTO Users (UserID, WorkEmail, PersonalEmail, BackupEmail) VALUES
(1, NULL, 'john@gmail.com', NULL),
(2, 'jane@company.com', NULL, NULL),
(3, NULL, NULL, 'user3@backup.com'),
(4, NULL, NULL, NULL);
select * from users;

SELECT 
  UserID,
  COALESCE(WorkEmail, PersonalEmail, BackupEmail, 'No Email Available') AS PreferredEmail
FROM Users;
-- If either is NULL, result is NULL



-- ⚠️ Important Notes
- NVL is Oracle-specific. For other databases:
- SQL Server: Use ISNULL()
- MySQL: Use IFNULL()
- PostgreSQL: Use COALESCE()
- 
