--Script Name: How to remove extra spaces from string value
--Script Type: Solution
--Article: https://raresql.com/2013/11/04/sql-server-how-to-remove-extra-spaces-from-string-value/https://raresql.com/2013/11/04/sql-server-how-to-remove-extra-spaces-from-string-value/
--Developed By: Muhammad Imran
--Date Created: 4 Nov 2013
--Date Modified: 27 Dec 2022

--Sample

--Use database tempdb
USE tempdb
GO
--DROP TABLE tbl_sample
--GO
--Create table
CREATE TABLE tbl_sample
(
 [ID] INT,
 [NAME] VARCHAR(100)
)
GO

--Insert records in the table
--Note : Names have been taken from adventureworks2012 database.

INSERT INTO tbl_sample VALUES (1,'Terri    Lee          Duffy')
INSERT INTO tbl_sample VALUES (2,'Roberto     Tamburello')
INSERT INTO tbl_sample VALUES (3,'Rob   Walters')
INSERT INTO tbl_sample VALUES (4,'Gail   A        Erickson')
INSERT INTO tbl_sample VALUES (5,'Gigi      N      Matthew')
GO

--Browse table
SELECT
 [ID]
,[NAME] AS [String with extra spaces]
FROM tbl_sample

--End of sample

--Solution-1

--Use database tempdb
USE tempdb
GO

--Use REPLACE() function
SELECT [ID]
	 , [NAME] AS [String with extra spaces]
	 , REPLACE(REPLACE(REPLACE([NAME]
	 , CHAR(32),'()'),')(',''),'()',CHAR(32))
AS [String without extra spaces]
FROM tbl_sample
GO

--End of solution-1

--Solution-2

--Use database tempdb
USE tempdb
GO

--DROP FUNCTION dbo.[UDF_Remove_Extra_Space_From_String]
--Create user defined function

CREATE FUNCTION dbo.[UDF_Remove_Extra_Space_From_String]
(
   @String VARCHAR(MAX) -- Variable for string
)
RETURNS VARCHAR(MAX)
BEGIN

--Declare variables
DECLARE @Xml XML
DECLARE @Removed_Extra_Space VARCHAR(MAX)
DECLARE @delimiter VARCHAR(5)

--Set values of variables
SET @delimiter=' '
SET @Xml = CAST(('<a>'+REPLACE(@String,@delimiter,'</a><a>')+'</a>')
AS XML)

--Use common table expression
;WITH CTE AS (SELECT
 A.value('.', 'VARCHAR(MAX)') AS [Column]
 FROM @Xml.nodes('A') AS FN(A))

--Use REPLACE(), STUFF() function
 SELECT @Removed_Extra_Space=REPLACE(
 Stuff((
 SELECT ';' + A.[Column]
 FROM CTE A
 WHERE ISNULL(A.[Column],'') <>''
 FOR XML PATH('')),1,1,''),';',' ')
 
RETURN (@Removed_Extra_Space)
END
GO

--End of user defined function

--Browse table
SELECT
 [ID]
,[NAME] AS [String with extra spaces]
,dbo.[UDF_Remove_Extra_Space_From_String] ([Name])
AS [String without extra spaces]
FROM tbl_sample
GO

--End of solution-2
