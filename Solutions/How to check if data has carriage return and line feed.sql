--Script Name: How to check if data has carriage return and line feed
--Script Type: Solution
--Article: https://raresql.com/2013/12/30/sql-server-how-to-check-if-data-has-carriage-return-and-line-feed/
--Developed By: Muhammad Imran
--Date Created: 30th December 2013
--Date Modified: 27th December 2022

--Sample Script

--This script is compatible with SQL Server 2005 and above.

--Create new user defined Function 
CREATE FUNCTION dbo.[UDF_Check_existance_of_carriage_return_line_feed]
(
      @String VARCHAR(MAX)
)
RETURNS VARCHAR(MAX)
BEGIN
DECLARE @RETURN_BOOLEAN INT
 ;WITH N1 (n) AS (SELECT 1 UNION ALL SELECT 1),
N2 (n) AS (SELECT 1 FROM N1 AS X, N1 AS Y),
N3 (n) AS (SELECT 1 FROM N2 AS X, N2 AS Y),
N4 (n) AS (SELECT ROW_NUMBER() OVER(ORDER BY X.n)
FROM N3 AS X, N3 AS Y)

--Browse data 
SELECT @RETURN_BOOLEAN = COUNT(*)
FROM N4 Nums
WHERE Nums.n<=LEN(@String) AND ASCII(SUBSTRING(@String,Nums.n,1))  IN (13,10)    
 
RETURN (CASE WHEN @RETURN_BOOLEAN >0 THEN 'TRUE' ELSE 'FALSE' END)
END
GO

--End of Sample

--Example-1
--Manually inserted a carriage return and line feed in employee table to test the above solution

--Use AdventureWorks database
USE AdventureWorks2012
GO

--Update query
UPDATE [HumanResources].[Employee] SET [JobTitle] ='Research
and
Development Manager' WHERE BusinessEntityID =6;
GO

--Lets browse the employee table using above solution and check.

--Use AdventureWorks database
USE AdventureWorks2012
GO

--Browse data
SELECT BusinessEntityID,OrganizationLevel,JobTitle
,dbo.[UDF_Check_existance_of_carriage_return_line_feed] ([JobTitle])
AS [Boolean]
FROM HumanResources.Employee

--End of example-1

