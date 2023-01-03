--Script Name: How to Split one column into multiple columns
--Script Type: Solution
--Article: https://raresql.com/2015/08/22/sql-server-how-to-split-one-column-into-multiple-columns/
--Developed By: Muhammad Imran
--Date Created: 22 Aug 2015
--Date Modified: 3 Jan 2023


--Sample

--Use database tempdb
USE TEMPDB
GO

--Create table
CREATE TABLE [dbo].[tbl_Employee](
[Employee ID] INT IDENTITY(1,1) ,
[Employee Name] VARCHAR (100) NOT NULL);
GO

--Insert records into table
INSERT INTO dbo.[tbl_Employee] ([Employee Name])
VALUES ('Andreas Berglund T')
GO
INSERT INTO dbo.[tbl_Employee] ([Employee Name])
VALUES ('Sootha Charncherngkha T')
GO
INSERT INTO dbo.[tbl_Employee] ([Employee Name])
VALUES ('Peng Wu')
GO
 
--Browse the data
SELECT * FROM dbo.[tbl_Employee]
GO

--End of sample

--Solution

--Use database tempdb
USE TEMPDB
GO
 
--Declare variable
DECLARE @delimiter VARCHAR(50)

--Use CTE(Common Table Expresion)
--Set value of variable
SET @delimiter=' '  -- <=== Here, you can change the delimiter.
;WITH CTE AS

--Use CAST()
(
SELECT
[Employee ID],
[Employee Name],
CAST('' + REPLACE([Employee Name], @delimiter , '') + '' AS XML)
AS [Employee Name XML]
FROM  [tbl_Employee]
)
SELECT
[Employee ID],
[Employee Name],
[Employee Name XML].value('/M[1]', 'varchar(50)') As [First Name],
[Employee Name XML].value('/M[2]', 'varchar(50)') As [Last Name],
[Employee Name XML].value('/M[3]', 'varchar(50)') As [Middle Name]
 
FROM CTE
GO

--End of solution
