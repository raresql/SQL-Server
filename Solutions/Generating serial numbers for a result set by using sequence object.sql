--Script Name: Generating serial numbers for a result set by using sequence object
--Script Type: Solution
--Article: https://raresql.com/2013/12/29/sql-server-2012-generating-serial-numbers-for-a-result-set-by-using-sequence-object/
--Developed By: Muhammad Imran
--Date Created: 29 Dec 2013
--Date Modified: 10 Jan 2023


--Use Row_Number

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Browse table
SELECT
ROW_NUMBER() OVER(ORDER BY Name) AS [S.No]
, ProductID
, Name
, ProductNumber
FROM Production.Product
GO

--Use Sequence object

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
--DROP SEQUENCE dbo.Seq_Sample
--GO

--Create Sequence Object
CREATE SEQUENCE dbo.Seq_Sample
 AS int     START WITH 1
INCREMENT BY 1 ;
GO

--Generate serial number using Sequence object
SELECT
  NEXT VALUE FOR dbo.Seq_Sample OVER (ORDER BY Name) AS [S.No]
, ProductID
, Name
, ProductNumber
FROM Production.Product
GO

--Reset Sequence object to 1, So it will start from 1
--in the next result set.
ALTER SEQUENCE [dbo].Seq_Sample RESTART WITH 1
GO

--End
