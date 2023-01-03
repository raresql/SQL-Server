--Script Name: How to find list of contained databases
--Script Type: Solution
--Article: https://raresql.com/2013/04/04/sql-server-2012-how-to-find-list-of-contained-databases/
--Developed By: Muhammad Imran
--Date Created: 4 Apr 2013
--Date Modified: 28 Dec 2022

--Browse table

SELECT name as [Database Name], containment ,containment_desc
FROM sys.databases
WHERE [containment] =1;
GO

--End

