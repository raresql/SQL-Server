--Script Name: How to pass parameters to an SP using select command (Without variables)
--Script Type: Solution
--Article: https://raresql.com/2013/07/25/sql-server-how-to-pass-parameters-to-an-sp-using-select-command-without-variables/
--Developed By: Muhammad Imran
--Date Created: 25 July 2013
--Date Modified: 28 Dec 2022

--Sample

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Create table
CREATE TABLE dbo.[Department_Audit]
(
DepartmentID smallint,
Name nvarchar(50),
);
GO

--Create Stored Procedure
CREATE PROCEDURE dbo.Usp_Department_Audit
@DepartmentID int,
@Name varchar(50)
AS
BEGIN
INSERT INTO [Department_Audit] VALUES(@DepartmentID,@Name)
END;

--End of sample

--Solution-1

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Declare variables
DECLARE @DepartmentID INT;
DECLARE @Name VARCHAR(50);
 
--Set value to variables
SELECT @DepartmentID=[DepartmentID],@Name=[Name]
FROM HumanResources.Department
Where [DepartmentID] = 1
 
--pass variables to stored procedure and execute it.
EXEC dbo.Usp_Department_Audit @DepartmentID,@Name;
GO

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
--Browse the table
SELECT * FROM [Department_Audit];
GO

--End of solution-1

--Solution-2

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Declare variable
DECLARE @SQL nvarchar(max);

--Set value to variable
SET @SQL = ''
SELECT @SQL = @SQL + 'EXEC dbo.Usp_Department_Audit '
+ Convert(nvarchar(2),[DepartmentID]) + ', '
+ '''' + [Name] + '''' + '; '
FROM HumanResources.[Department] Where [DepartmentID] =2
EXEC (@SQL)
 
--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Browse table
SELECT * FROM [Department_Audit]

--End of solution-2

