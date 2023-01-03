--Script Name: How to implement conditional where clause
--Script Type: Solution
--Article: https://raresql.com/2013/10/08/sql-server-how-to-implement-condition-where-clause/
--Developed By: Muhammad Imran
--Date Created: 8 Oct 2013
--Date Modified: 27 Dec 2022

--Sample

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--DROP PROCEDURE Usp_sample
--GO

--Create Procedure
CREATE PROCEDURE Usp_sample
@City nvarchar(30),
@CountryRegionName nvarchar(50)
AS
 
SELECT * FROM HumanResources.vEmployee
	     WHERE (1=(CASE WHEN @City IS NULL THEN 1 ELSE 0 END) Or [City]=@City)
		 AND (1=(CASE WHEN @CountryRegionName IS NULL THEN 1 ELSE 0 END)
		 Or [CountryRegionName]=@CountryRegionName)
GO

--End of sample

--Example-1
--Without any filter

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Execute Procedure
EXEC Usp_sample @City=NULL,@CountryRegionName=NULL
GO

--End of example-1

--Example-2
--With one filter

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Execute Procedure
EXEC Usp_sample @City='Renton',@CountryRegionName=NULL;
GO

--End of example-2
