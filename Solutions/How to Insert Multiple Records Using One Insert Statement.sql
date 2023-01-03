--Script Name: How to Insert Multiple Records Using One Insert Statement
--Script Type: Solution
--Article: https://raresql.com/2012/10/03/sql-server-how-to-Insert-multiple-records-using-one-Insert-statement/
--Developed By: Muhammad Imran
--Date Created: 3rd October 2012
--Date Modified: 28th Dec 2022

--Sample

--Create Sample table

CREATE Table Test_Table
(
   [ID] int
 , [Designation] varchar(50)
);
GO

--End of Sample table

--Method-1
--Traditional Insert statement (Multiple records with Multiple Statements)

--Insert records into table
INSERT INTO Test_Table ([ID],[Designation]) Values(1,'Officer')
INSERT INTO Test_Table ([ID],[Designation]) Values(2,'Manager')
INSERT INTO Test_Table ([ID],[Designation]) Values(3,'Director');
GO

--End of sample
--End of Method-1

--Method-2
--Insert statement – Table Value Constructor – (Multiple records with Single Statement)

INSERT INTO Test_Table Values (1,'Officer'),(2,'Manager'),(3,'Director');
GO

--End of Method-2

--Method-3
--Insert statement – Union ALL – (Multiple records with Single statement

INSERT INTO Test_Table
SELECT 1,'Officer'
UNION ALL
SELECT 2,'Manager'
UNION ALL
SELECT 3,'Director';
GO

--End of Method-3
