--Script Name:  How to sort month names in month order instead of alphabetical order
--Script Type: Solution
--Article: https://raresql.com/2013/06/23/sql-server-how-to-sort-month-names-in-month-order-instead-of-alphabetical-order/
--Developed By: Muhammad Imran
--Date Created: 23 June 2013
--Date Modified: 28 Dec 2022

--Sample

--Use database tempdb
USE tempdb
GO

--Create table
CREATE TABLE tbl_Sample
(
 [ID] INT,
 [Date] DATETIME);
GO

--Insert records into table
INSERT INTO tbl_Sample VALUES (1,'2013-04-04')
INSERT INTO tbl_Sample VALUES (2,'2013-07-07')
INSERT INTO tbl_Sample VALUES (3,'2013-10-10')
INSERT INTO tbl_Sample VALUES (4,'2013-01-01')
INSERT INTO tbl_Sample VALUES (5,'2013-02-02')
INSERT INTO tbl_Sample VALUES (6,'2013-03-03')
INSERT INTO tbl_Sample VALUES (7,'2013-05-05')
INSERT INTO tbl_Sample VALUES (8,'2013-06-06')
INSERT INTO tbl_Sample VALUES (9,'2013-08-08')
INSERT INTO tbl_Sample VALUES (10,'2013-09-09')
INSERT INTO tbl_Sample VALUES (11,'2013-11-11')
INSERT INTO tbl_Sample VALUES (12,'2013-12-12');
GO

--End of sample

--Method-1

--Use database tempdb
USE tempdb
GO
--Browse table
SELECT DATENAME(month,Date) AS [Month Name]
	 , [Date]
FROM tbl_Sample
ORDER BY [Date]

--End of Method-1

--Method-2

--Use database tempdb
USE tempdb
GO
--Browse table
SELECT DATENAME(month,Date) AS [Month Name]
	 , [Date]
FROM tbl_Sample
ORDER BY Month(Date)

--End of method-2

--Method-3

--Use database tempdb
USE tempdb
GO
--Browse table
SELECT DATENAME(month,Date) AS [Month Name]
	 , [Date]
FROM tbl_Sample
ORDER BY DATEPART(m,Date);

--End of method-3

--Method-4

--Use database tempdb
USE tempdb
GO
--Browse table
SELECT DATENAME(month,Date) AS [Month Name]
	 , [Date]
FROM tbl_Sample
Order By FORMAT([Date],'MM')

--End of method-4
