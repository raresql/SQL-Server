--Script Name: How to insert space before Capital letters
--Script Type: Solution
--Article: https://raresql.com/2013/07/27/sql-server-how-to-insert-space-before-capital-letters-user-defined-function/
--Developed By: Muhammad Imran
--Date Created: 27 July 2013
--Date Modified: 28 Dec 2022

--Sample

--Use database tempdb
USE tempdb
GO

--Create table
CREATE TABLE Student
(
 [Student ID] INT Identity(1,1),
 [Student Name] VARCHAR(50)
);
GO

--Insert records into table
INSERT INTO Student VALUES ('SteveMasters')
INSERT INTO Student VALUES ('DavidOrtiz')
INSERT INTO Student VALUES ('MichaelSeanRay')
INSERT INTO Student VALUES ('StevenSelikoff')
INSERT INTO Student VALUES ('CarolePoland')
INSERT INTO Student VALUES ('BjornRettig')
INSERT INTO Student VALUES ('MichikoOsada')
INSERT INTO Student VALUES ('CarolPhilips')
INSERT INTO Student VALUES ('MeravNetz')
GO

--Browse table
SELECT * FROM Student;
GO

--End of sample

--User Defined Function

--Use database tempdb
USE tempdb
GO

--Create function
CREATE FUNCTION dbo.[UDF_Space_Before_Capital_Letters]
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
FROM N3 AS X, N3 AS Y);
 
SELECT @RETURN_STRING=ISNULL(@RETURN_STRING,'')+
(CASE WHEN SUBSTRING(@String,Nums.n,1)=
UPPER(SUBSTRING(@String,Nums.n,1)) collate Latin1_General_CS_As
AND Nums.n >1
THEN SPACE(1) + SUBSTRING(@String,Nums.n,1)
ELSE SUBSTRING(@String,Nums.n,1) END);
 
FROM N4 Nums
WHERE Nums.n<=LEN(@String)
 
RETURN @RETURN_STRING
END
GO
--Example
USE tempdb
GO
SELECT [Student ID]
,dbo.[UDF_Space_Before_Capital_Letters]([Student Name]) As [Student Name]
FROM Student;
GO

--End of example

--End of user defined function
