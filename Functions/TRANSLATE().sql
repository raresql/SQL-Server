--Script Name: TRANSLATE()
--Script Type: Function
--Article: https://raresql.com/2022/11/05/sql-server-string-functions-translate/
--Developed By: Muhammad Imran
--Date Created: 05 Nov 2022
--Date Modified: 22 Dec 2022

--Set Compatibility Level
ALTER DATABASE Northwind SET COMPATIBILITY_LEVEL = 140;
GO

--Example-1
--Old approach using REPLACE() function
DECLARE @Number VARCHAR(25)
SET @Number='+92-3317892345'
SELECT @Number AS PhoneNumber
     , REPLACE(REPLACE(@Number,'+',' '),'-',' ') AS ReplacedPhoneNumber;
GO 
--End of example-1

--Example-2
--New approach 
--Declare variable
DECLARE @Number AS VARCHAR(25)

--Set varaiable
SET @Number='+92-3317892345'

--Use TRANSLATE() function
SELECT @Number AS PhoneNumber
     , TRANSLATE(@Number,'+-','  ') AS TranslatedPhoneNumber 
GO
--End of example-2

--Example 3 
--Old approach 
--Use Northwind Database
USE Northwind
GO

--Use REPLACE() function 
SELECT FirstName
     , LastName
     , Title
     , HomePhone
     , REPLACE(REPLACE(REPLACE(HomePhone,'(',''),')',' '),'-',' ') AS ReplacedHomePhone
FROM [dbo].[Employees] ;
GO
--End of example-3

--Example 4
--Use Northwind Database
USE Northwind
GO
 
--Use TRANSLATE() function
SELECT FirstName
     , LastName
     , Title 
     , HomePhone
     , TRANSLATE(HomePhone,'()-','   ') AS TranslatedHomePhone  
FROM [dbo].[Employees] ;
GO
--End of Example 4
