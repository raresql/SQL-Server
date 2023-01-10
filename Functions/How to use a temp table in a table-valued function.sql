--Script Name: How to use a temp table in a table-valued function
--Script Type: Solution
--Article: https://raresql.com/2013/12/11/sql-server-how-to-use-a-temp-table-in-a-table-valued-function/
--Developed By: Muhammad Imran
--Date Created: 11 Dec 2013
--Date Modified: 5 Jan 2023

--Solution

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Create function
CREATE FUNCTION [dbo].[ufnGetEmployeeInformation]
(@BusinessEntityID int)
RETURNS @EmployeeInformation TABLE
(
    [BusinessEntityID] int,
    [FirstName] [nvarchar](50) NULL,
    [LastName] [nvarchar](50) NULL,
    [JobTitle] [nvarchar](50) NULL,
    [City] [nvarchar](30) NULL,
    [Return Time] [datetime] NULL
)
AS
BEGIN
        INSERT INTO @EmployeeInformation
        SELECT
            [BusinessEntityID],
            [FirstName],
            [LastName],
            [JobTitle],
            [City],
            getdate()
        FROM [HumanResources].[vEmployee]
        WHERE
        BusinessEntityID=@BusinessEntityID
 
    RETURN;
END
GO

--Example

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Browse data
SELECT * FROM [dbo].[ufnGetEmployeeInformation](124)

--End of example

--End of solution
