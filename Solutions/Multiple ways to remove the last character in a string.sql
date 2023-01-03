--Script Name: Multiple ways to remove the last character in a string
--Script Type: Solution
--Article: https://raresql.com/2013/11/16/sql-server-multiple-ways-to-remove-the-last-character-in-a-string/
--Developed By: Muhammad Imran
--Date Created: 16 Nov 2013
--Date Modified: 27 Dec 2022

--Solution-1

--Declare variable
DECLARE @String as VARCHAR(50)

--Set value of variable
SET @String='1,2,3,4,5,'

--Use LEFT() function
SELECT @String As [String]
	 , LEFT(@String,DATALENGTH(@String)-1)
As [Last Character removed from string];
GO

--End of solution-1

--Solution-2

--Declare variable
DECLARE @String as VARCHAR(50);

--Set value of variable
SET @String='1,2,3,4,5,';

--Use STUFF() function

SELECT @String As [String]
	 , STUFF(@String
	 , DATALENGTH(@String), 1, '')
As [Last Character removed from string];
GO

--End of solution-2
--Solution-3

--Declare variable
DECLARE @String as VARCHAR(50);

--Set value of variable
SET @String='1,2,3,4,5,';

--USE SUBSTRING() function
SELECT @String As [String]
	 , SUBSTRING(@String,1
	 , DATALENGTH(@String)-1)
As [Last Character removed from string];
GO

--End of solution-3
