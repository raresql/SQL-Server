--Script Name: How to remove leading zeros after a decimal point
--Script Type: Solution
--Article: https://raresql.com/2014/01/20/sql-server-how-to-remove-leading-zeros-after-a-decimal-point/
--Developed By: Muhammad Imran
--Date Created: 20 Jan 2014
--Date Modified: 5 Jan 2023

--Sample

--Declare table variable
DECLARE @tbl_sample AS TABLE
(
 [ID] INT,
 [Col_Varchar] VARCHAR(50)
)
 
--Insert records into table
INSERT INTO @tbl_sample VALUES (1,'2013.0000000001')
INSERT INTO @tbl_sample VALUES (2,'2014.0000000002')
INSERT INTO @tbl_sample VALUES (3,'2015.0000000003')
INSERT INTO @tbl_sample VALUES (4,'2016.0000000044')
INSERT INTO @tbl_sample VALUES (5,'2017.0000000555')
 
--Browse table
SELECT * FROM @tbl_sample

--End of sample

--Solution-1
--Use PARSENAME() , CONCAT() unction

--Browse table
SELECT [ID]
,CONCAT(PARSENAME([Col_Varchar],2)
,'.',CONVERT(INT,PARSENAME([Col_Varchar],1)))
AS [Col_Varchar]
FROM @tbl_sample

--End of solution-1

--Solution-2
--Use PARSENAME(), CONCAT(), CONVERT() unction

--Browse table
SELECT [ID]
	 , CONVERT(VARCHAR(5),PARSENAME([Col_Varchar],2))
+ '.'
+ CONVERT(VARCHAR(5),CONVERT(INT,PARSENAME([Col_Varchar],1)))
AS [Col_Varchar]
FROM @tbl_sample

--End of solution-2
