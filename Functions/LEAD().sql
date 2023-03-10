--Script Name: LEAD() function
--Script Type: Function
--Article: https://raresql.com/2012/11/30/sql-server-2012-analytic-functions-lead/
--Developed By: Muhammad Imran
--Date Created: 30 Nov 2012
--Date Modified: 22 Dec 2022

--Sample-1
--Use database tempdb
USE tempdb
GO

--Create table
CREATE Table [Test_Table]
(
 [S.No] int,
 [Letters] varchar(50)
)
GO

--Insert records into promotion table
INSERT INTO [Test_Table] values (1,'LETTER A')
INSERT INTO [Test_Table] values (2,'LETTER B')
INSERT INTO [Test_Table] values (3,'LETTER C')
INSERT INTO [Test_Table] values (5,'LETTER D')
INSERT INTO [Test_Table] values (6,'LETTER E')
INSERT INTO [Test_Table] values (7,'LETTER F')
INSERT INTO [Test_Table] values (8,'LETTER G')
INSERT INTO [Test_Table] values (9,'LETTER H')
INSERT INTO [Test_Table] values (10,'LETTER I')

--End of sample-1

--Example-1
--Default values

--Use LEAD() function
SELECT [S.No]
	 , [Letters]
	 , LEAD([Letters]) Over (Order By [Letters]) as [Next Value]
FROM  [Test_Table]

--End of example-1

--Example-2
--Replace default values

--Use LEAD() function
SELECT [S.No]
	 , [Letters]
	 , LEAD([Letters],1,'') Over (Order By [Letters]) as [Next Value]
FROM  [Test_Table]

--End of example-2

--Example-3
--Change ofset value

--Use LEAD() function
SELECT [S.No]
	 , [Letters]
	 , LEAD([Letters],2,'') Over (Order By [Letters]) as [Next Value]
FROM  [Test_Table]

--End of example-3

--Sample-2
--Use database tempdb
Use tempdb

--Create table
CREATE table [tbl_Promotion]
(
 [S.No] int,
 [Date] datetime,
 [Employee Name] varchar(50),
 [Designation]  varchar(50)
)
 
--Insert records into promotion table
INSERT INTO [tbl_Promotion] values(1,'2009-08-20','Imran','Assistant Manager')
INSERT INTO [tbl_Promotion] values(2,'2011-11-21','Imran','Manager')
INSERT INTO [tbl_Promotion] values(3,'2010-09-05','Bob','Technical Manager')
INSERT INTO [tbl_Promotion] values(4,'2012-10-06','Bob','Technical Director')
INSERT INTO [tbl_Promotion] values(5,'2012-01-10','Robert','Junior Developer')
INSERT INTO [tbl_Promotion] values(6,'2012-06-11','Robert','Developer')
GO

--Browse table
SELECT * FROM [tbl_Promotion]
GO
--End of sample-2

--Example-4
--Find promotions of employees
 
--Use LEAD() function
SELECT [S.No]
	 , [Date]
	 , [Employee Name]
	 , [Designation]
	 , LEAD ([Designation],1,0) Over (Partition By [Employee Name] Order By [S.No]) as [Next Promotion]
FROM [tbl_Promotion]
Go

--Drop table
Drop Table [tbl_Promotion]

--End of example-4
