--Script Name: How to find a row that contains a lower case letter
--Script Type: Solution
--Article: https://raresql.com/2013/11/01/sql-server-how-to-find-a-row-that-contains-a-lower-case-letter/
--Developed By: Muhammad Imran
--Date Created: 1 Nov 2013
--Date Modified: 27 Dec 2022

--Sample

--Use database tempdb
USE tempdb
GO

--Create table
CREATE TABLE tbl_sample
(
 [ID] INT,
 [Name] varchar(50)
);
GO

--Insert records into table
INSERT INTO tbl_sample VALUES (1,'RARESQL.COM')
INSERT INTO tbl_sample VALUES (2,'RaReSql.com')
INSERT INTO tbl_sample VALUES (3,'Raresql')
INSERT INTO tbl_sample VALUES (4,'raresql.com');
GO

--Browse table
SELECT * FROM tbl_sample;

--End of sample

--Solution-1

--Use database tempdb
USE tempdb
GO

--Browse table
--Use UPPER() function
SELECT * FROM tbl_sample WHERE
UPPER([NAME]) COLLATE Latin1_General_CS_AS !=[NAME];

--End of solution-1

--Solution-2

--Use database tempdb
USE tempdb
GO

--Browse table

--Use PATINDEX() function
--Use COLLATE
SELECT * FROM tbl_sample
WHERE PATINDEX('%[abcdefghijklmnopqrstuvwxyz]%'
	, [NAME] COLLATE Latin1_General_CS_AS)>0;
GO

--End of solution-2

--Solution-3

--Use database tempdb
USE tempdb
GO

--DROP FUNCTION dbo.[UDF_Extract_small_letters_From_String]
--GO

--Create user defined function
CREATE FUNCTION dbo.[UDF_Extract_small_letters_From_String]
(
      @String VARCHAR(MAX)  -- Variable for string
)
RETURNS VARCHAR(MAX)
BEGIN

--Declare variable
DECLARE @RETURN_STRING VARCHAR(MAX)
 
;WITH N1 (n) AS (SELECT 1 UNION ALL SELECT 1),
N2 (n) AS (SELECT 1 FROM N1 AS X, N1 AS Y),
N3 (n) AS (SELECT 1 FROM N2 AS X, N2 AS Y),
N4 (n) AS (SELECT ROW_NUMBER() OVER(ORDER BY X.n)
FROM N3 AS X, N3 AS Y)

--Use ASCII() function
--Use SUBSTRING() function
SELECT @RETURN_STRING=ISNULL(@RETURN_STRING,'')
+ SUBSTRING(@String,Nums.n,1)
FROM N4 Nums
WHERE Nums.n<=LEN(@String)
AND ASCII(SUBSTRING(@String,Nums.n,1)) BETWEEN 97 AND 122
 
RETURN @RETURN_STRING
END
GO
 
--End of user defined function

--Browse table
SELECT *,dbo.[UDF_Extract_small_letters_From_String]([NAME])
As [Lower cases letters]
FROM tbl_sample

--End of solution-3
