-- Script Name: String Split
-- Script Type: Fuction
-- Developed By: Muhammad Imran
-- Date Created: 09 Dec 2022
-- Date Modified: 21 Dec 2022

-- Create Sample
USE tempdb
GO

--Create employee table  
CREATE TABLE #Employee
(
 EmployeeID     INT IDENTITY(1,1),
 EmployeeName   VARCHAR(500),
 EmailAddresses VARCHAR(500)
);
GO

--Insert records into employee table 
INSERT INTO #Employee(EmployeeName, EmailAddresses)
VALUES
('John', 'John_1@gmail.com;John_2@gmail.com;John_3@hotmail.com'),
('Sarah', 'Sarah_1@gmail.com;Sarah_2@hotmail.com;Sarah_3@gmail.com'),
('Aaron', 'Aaron_1@gmail@com;Aaron_2@hotmail.com'),
('Ackerman', 'Ackerman_1@gmail.com;Ackerman_2@hotmail.com');
GO
 
--Browse employee data
SELECT * FROM #Employee;
GO

-- End of Sample

--Example-1
--Using String Split function 
USE tempdb
GO
 
SELECT EmployeeID
     , EmployeeName
 , value AS EmailAddress
 , Ordinal
FROM   #Employee
CROSS APPLY STRING_SPLIT(EmailAddresses, ';', 1);
GO
-- End of example-1

--Example-2
USE tempdb
GO
  
SELECT EmployeeID
     , EmployeeName
     , value AS EmailAddress
     , Ordinal
FROM   #Employee
CROSS APPLY STRING_SPLIT (EmailAddresses, ';', 1)
WHERE ordinal<3;
GO
-- End of example-2

--clean up 
DROP table employee;
GO

