--Script Name: How to generate a varchar Sequence Number – Using Sequence Object
--Script Type: Solution
--Article: https://raresql.com/2013/06/21/sql-server-2012-how-to-generate-a-varchar-sequence-number-using-sequence-object/
--Developed By: Muhammad Imran
--Date Created: 21 June 2013
--Date Modified: 28 Dec 2022

--Step-1

--Use database tempdb
USE tempdb
GO

-- CREATE TABLE
CREATE TABLE dbo.tbl_sample
( [ID] VARCHAR(8) ,
  [Name] varchar(50)
CONSTRAINT PK_Employee_EmployeeID
PRIMARY KEY CLUSTERED ([ID] ASC));
GO

--CREATE SEQUENCE
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
DEFAULT FORMAT((NEXT VALUE FOR dbo.Sample_Seq),'CUS0000#') FOR [ID];
GO

--End of step-2

--Step-3

--Use database tempdb
USE tempdb
GO

--Insert records into table
INSERT INTO dbo.tbl_sample ([Name])
VALUES ('Imran'),('Bob'),('Sandra');
GO

--End of step-3

--Step-4

--Use database tempdb
USE tempdb
GO

--Browse Table
SELECT * FROM tbl_sample;
GO

--End of step-4
