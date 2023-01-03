--Script Name: How to make Sequence as default value for a column in a table
--Script Type: Solution
--Article: https://raresql.com/2013/11/22/sql-server-2012-how-to-make-sequence-as-default-value-for-a-column-in-a-table/
--Developed By: Muhammad Imran
--Date Created: 22 Nov 2013
--Date Modified: 27 Dec 2022

--Step-1

--Use database tempdb
USE tempdb
GO

--Create table
CREATE TABLE dbo.tbl_sample
( [ID] VARCHAR(8) ,
[Product Name] varchar(50)
)
GO
 
--CREATE SEQUENCE
USE tempdb
GO
CREATE SEQUENCE dbo.Sample_Seq AS
INT START WITH 1
INCREMENT BY 1 ;
GO

--End of step-1

--Step-2

--Use database tempdb
USE tempdb
GO

--Alter table
ALTER TABLE dbo.tbl_sample
ADD CONSTRAINT Const_Sample_Seq
DEFAULT (NEXT VALUE FOR dbo.Sample_Seq) FOR [ID];
GO

--End of step-2

--Step-3

--Use database tempdb
USE tempdb
GO

--Insert records into table
INSERT INTO dbo.tbl_sample ([Product Name])
VALUES ('SQL SERVER 2005'),('SQL SERVER 2008')
	 , ('SQL SERVER 2012'),('SQL SERVER 2014')
GO

--End of step-3

--Step-4

--Use database tempdb
USE tempdb
GO

--Browse table
SELECT * FROM tbl_sample
GO

--End of step-4
