-- Script Name: CONCAT_WS()
-- Script Type: Fuction
-- Article: https://raresql.com/2022/11/30/sql-server-concat_ws-function/
-- Developed By: Muhammad Imran
-- Date Created: 30th Nov 2022
-- Date Modified: 22 Dec 2022

--Create Sample
USE TEST_DB
GO

--Create employee table  
CREATE TABLE Employees(
EmployeeID INT IDENTITY(1,1),
EmployeeName VARCHAR(100),
PrimaryEmail VARCHAR(100),
SecondaryEmail VARCHAR(100),
AlternateEmail VARCHAR(100)
);
GO

--Insert records into employee table 
INSERT INTO Employees
(EmployeeName, PrimaryEmail, SecondaryEmail, AlternateEmail)
VALUES
 ('Davolio Nancy', 'Davolio2@gmail.com', 'Davolio_Nancy@gmail.com', 'Nancy99@hotmail.com')
,('Fuller Andrew', 'Fuller_12@gmail.com', 'Andrew_f99@gmail.com', 'Andrew_f9@hotmail.com')
,('Leverling Janet', 'Leverling_42@gmail.com', 'j.Leverling_2@gmail.com', 'Janet_Leverling@hotmail.com')
,('Peacock Margaret', 'Peacock@gmail.com', 'Peacock_12@gmail.com', 'Margaret_Peacock@hotmail.com')
GO
 
--Browse employee data
SELECT * FROM Employees;
GO

--End of Sample

--Example-1
--Old approach using add (+) operator
--Concatenate multiple columns & applied semi-colon (;) as a delimiter in between
--Use TEST_DB database 
USE TEST_DB
GO
 
SELECT [EmployeeName]
    , ([PrimaryEmail]+';'+[SecondaryEmail]+';'+[AlternateEmail]) AS [AllEmails]
FROM [Employees];
GO

--New approach using CONCAT_WS() function
--Use TEST_DB database
USE TEST_DB
GO
 
SELECT [EmployeeName]
    , CONCAT_WS(';',[PrimaryEmail],[SecondaryEmail],[AlternateEmail]) AS [AllEmails]
FROM [Employees];
GO

--End of example-1

--Example-2
--Old approach using add (+) operator
--Concatenate multiple columns & applied space as a delimiter in between
--Use Northwind database
USE Northwind
GO
 
SELECT [CompanyName]
     , [Address]
     , [City]
     , [Region]
     , ISNULL([Address],'') + ' ' + ISNULL([City],'') + ' ' + ISNULL([Region],'') AS [FullAddress]
FROM [dbo].[Suppliers];
GO

--New Approach using CONCAT_WS() function
SELECT [CompanyName]
     , [Address]
     , [City]
     , [Region]
     , CONCAT_WS(' ',[Address],[City],[Region]) AS [FullAddress]
FROM [dbo].[Suppliers];
GO

--End of example-2
