--Script Name: How to find first or last occurrence of any character or word in the string
--Script Type: Solution
--Article: https://raresql.com/2013/07/20/sql-server-how-to-find-firstlast-occurrence-of-any-character-word-in-the-string/
--Developed By: Muhammad Imran
--Date Created: 20 July 2013
--Date Modified: 28 Dec 2022

--First occurrence

--Declare variables
DECLARE @String AS VARCHAR(100)
DECLARE @Search_String AS VARCHAR(100)

--Set values of variables
SET @String ='The SQL SERVER is one of the best applications of Microsoft'
SET @Search_String='the'
 
--Find First occurrence of any character/word in the string
SELECT CHARINDEX(@Search_String,@String) As [First occurrence]

--End of first occurrence

--Last occurrence

--Declare variables
DECLARE @String AS VARCHAR(100)
DECLARE @Search_String AS VARCHAR(100)

--Set values of variables
SET @String ='The SQL SERVER is one of the best applications of Microsoft'
SET @Search_String='the'

--Find Last occurrence of any character/word in the string
SELECT DATALENGTH(@String)-CHARINDEX(REVERSE(@Search_String)
	 , REVERSE(@String))-1 As [Last occurrence]

--End of last occurrence
