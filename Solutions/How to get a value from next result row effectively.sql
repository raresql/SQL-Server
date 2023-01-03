--Script Name: How to get a value from next result row effectively
--Script Type: Solution
--Article: https://raresql.com/2013/11/03/sql-server-2012-how-to-get-a-value-from-next-result-row-effectively/
--Developed By: Muhammad Imran
--Date Created: 3 Nov 2013
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

--Browse table
--Use LEFT JOIN
SELECT A.ID
	 , A.Levels As [Current Level]
	 , B.Levels AS [Next Level]
FROM tbl_sample A
LEFT JOIN tbl_sample B ON A.ID+1=B.ID
ORDER BY A.ID;
GO

--End of old approach

--New approach

--Use database tempdb
USE tempdb
GO

--Browse table
--Use LEAD() function
SELECT A.ID
	 , A.Levels As [Current Level]
	 , LEAD(A.levels,1,0) OVER (ORDER BY A.ID) AS [Next Level]
FROM tbl_sample A;
GO

--End of new approach
