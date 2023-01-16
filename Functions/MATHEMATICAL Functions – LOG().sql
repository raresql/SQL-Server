--Script Name: MATHEMATICAL Functions – LOG()
--Script Type: Function
--Article: https://raresql.com/2013/03/10/sql-server-2012-mathematical-functions-log/
--Developed By: Muhammad Imran
--Date Created: 10 Mar 2013
--Date Modified: 11 Jan 2023

--Example-1

--Declare variable
DECLARE @variable float;

--Set value of variable
SET @variable = 10;

--Browse variable
SELECT LOG(@variable) as [LOG with Default base value]
GO

--End of example-1

--Example-2

--Declare variable
DECLARE @variable float;

--Set value of variable
SET @variable = 10;

--Browse variable
SELECT LOG(@variable,EXP(1)) as [LOG with defined base value]
GO

--End of example-2

--Example-3

--Declare variable
DECLARE @variable float;

--Set value of variable
SET @variable = 10;

--Browse variable
SELECT LOG(@variable,EXP(2)) as [LOG with defined base value]
GO

--End of example-3
