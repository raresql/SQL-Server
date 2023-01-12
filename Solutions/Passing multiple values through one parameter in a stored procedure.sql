--Script Name: Passing multiple values through one parameter in a stored procedure
--Script Type: Solution
--Article: https://raresql.com/2013/05/31/sql-server-passing-multiple-values-through-one-parameter-in-a-stored-procedure/
--Developed By: Muhammad Imran
--Date Created: 31 May 2013
--Date Modified: 10 Jan 2023

--Method-1
--Use XQuery

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Create procedure
CREATE PROCEDURE usp_Employeelist
@Cities NVARCHAR(30)
AS
DECLARE @CitiesXML AS XML
SET @CitiesXML = cast(('<a>'+replace(@Cities,',' ,'</a><a>')
                 +'</a>') AS XML)
 
SELECT
BusinessEntityID
, FirstName
, JobTitle
, City
FROM HumanResources.vEmployee
WHERE City IN
(
    SELECT
    A.value('.', 'varchar(max)')
    FROM @CitiesXML.nodes('A') AS FN(A)
)
ORDER BY BusinessEntityID
GO
 
--Execute the stored procedure using multiple values
--through one parameter in this stored procedure

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
EXEC usp_Employeelist
'Cambridge,Newport Hills,Berlin,Bordeaux'
GO

--End of method-1

--Method-2
--Use Dynamic queryhe

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Create procedure
CREATE PROCEDURE usp_Employeelist
@Cities NVARCHAR(30)
AS
 
DECLARE @Sql VARCHAR(MAX)
SET @Cities = REPLACE(@Cities,',',''',''')
 
SET @Sql = 'SELECT
              BusinessEntityID
            , FirstName
            , JobTitle
            , City
            FROM HumanResources.vEmployee
            WHERE City IN
            (
                 ''' + @Cities + '''
            )
            ORDER BY BusinessEntityID'
 
EXEC (@Sql)
GO
 
--Execute the stored procedure using multiple values
--through one parameter in this stored procedure

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
EXEC usp_Employeelist
'Cambridge,Newport Hills,Berlin,Bordeaux'
GO

--End of method-2
