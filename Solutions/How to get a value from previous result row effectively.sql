--Script Name: How to get a value from previous result row effectively
--Script Type: Solution
--Article: https://raresql.com/2013/09/11/sql-server-2012-how-to-get-a-value-from-previous-result-row-effectively/
--Developed By: Muhammad Imran
--Date Created: 11 Sep 2013
--Date Modified: 27 Dec 2022

--Sample

--Use database tempdb
USE tempdb
GO

--Create table
CREATE TABLE tbl_sample
(
 [ID] int,
 [Levels] varchar(50)
);
GO

--Insert records into table
INSERT INTO tbl_sample VALUES (1,'LEVEL 1')
INSERT INTO tbl_sample VALUES (2,'LEVEL 2')
INSERT INTO tbl_sample VALUES (3,'LEVEL 3')
INSERT INTO tbl_sample VALUES (4,'LEVEL 4')
INSERT INTO tbl_sample VALUES (5,'LEVEL 5');
GO

--Browse table
SELECT * FROM tbl_sample;
GO

--End of sample

--Old approach

--Use database tempdb
USE tempdb
GO

--Use Left Join
SELECT A.ID
	 , A.Levels As [Current Level]
	 , B.Levels AS [Previous Level]
FROM tbl_sample A
LEFT JOIN tbl_sample B ON A.ID=B.ID+1
ORDER BY A.ID;
GO

--End of old approach

--New approach

--Use database tempdb
USE tempdb
GO

--Use LAG()
SELECT A.ID
	 , A.Levels As [Current Level]
	 , LAG(A.levels,1,0) OVER (ORDER BY A.ID) AS [Previous Level]
FROM tbl_sample A;
GO

--End of New approach
