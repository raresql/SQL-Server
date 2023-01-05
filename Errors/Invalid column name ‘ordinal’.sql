--Script Name: Error – Fix – Invalid column name ‘ordinal’
--Script Type: Error
--Article: https://raresql.com/2022/12/12/sql-server-2022-error-fix-invalid-column-name-ordinal/
--Developed By: Muhammad Imran
--Date Created: 12th December 2022
--Date Modified: 29th Dec 2022

--Error

--Use Northwind database
USE Northwind
GO

SELECT CategoryID
     , CategoryName
     , Value AS Description
     , Ordinal
FROM   Categories
CROSS APPLY STRING_SPLIT(CONVERT(VARCHAR(100),Description), ',');
GO

--Output returns Invalid column name ‘ordinal’

--End of Error

--Solution
--Pass “1” as third argument in STRING_SPLIT() function whenever you place ordinal column in select statement

--Use Northwind database
USE Northwind
GO

--Pass '1' in string_split() 
SELECT CategoryID 
     , CategoryName
     , Value AS Description
     , Ordinal
FROM   Categories
CROSS APPLY STRING_SPLIT(CONVERT(VARCHAR(100),Description), ',', 1);
GO

--End of Solution
