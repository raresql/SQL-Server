--Script Name: SHOWPLAN permission denied in database.
--Script Type: Error
--Article: https://raresql.com/2015/07/30/sql-server-fix-error-262-showplan-permission-denied-in-database/
--Developed By: Muhammad Imran
--Date Created: 30th July 2015
--Date Modified: 29th Dec 2022

--Error

--Use AdventureWorks database
USE AdventureWorks2012
GO
 
--Create a user
CREATE USER Imran WITHOUT LOGIN;
GO

--Grant select permission to Imran user
GRANT SELECT ON [HumanResources].[Department] TO Imran;
GO
 
-- Press Ctl+M to Include Actual Execution Plan
EXECUTE AS USER = 'Imran';
SELECT * FROM [HumanResources].[Department] ;
REVERT;

--OUTPUT returns SHOWPLAN permission denied in database ‘AdventureWorks2012’.

--End of Error

--Solution
--Give this user the SHOWPLAN access. 

--Use AdventureWorks database
USE AdventureWorks2012
GO

GRANT SHOWPLAN TO Imran
GO

--End of Solution
