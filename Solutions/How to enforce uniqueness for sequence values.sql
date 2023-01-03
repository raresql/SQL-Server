--Script Name: How to enforce uniqueness for sequence values
--Script Type: Solution
--Article: https://raresql.com/2013/09/23/sql-server-2012-how-to-enforce-uniqueness-for-sequence-values/
--Developed By: Muhammad Imran
--Date Created: 23rd September 2013
--Date Modified: 27th December 2022

--Sample Problem

--Step-1
--Sample

--Use database AdventureWorks
USE [AdventureWorks2012]
GO

--Create a sample Table
CREATE TABLE [dbo].[tbl_sample]
( 
   [ID] [int] NULL
 , [Name] [varchar](100) NULL
) ON [PRIMARY];
GO

--End of sample
--End of Step-1

--Step-2
--Create a sequence object with CYCLE property.

--Create Sequence
CREATE SEQUENCE [dbo].[Seq_Sample]
AS [tinyint]
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 2
CYCLE;
GO

--End of step-2

--Step-3
--Insert Records

--Use database AdventureWorks
USE [AdventureWorks2012]
GO

--Insert
INSERT INTO [tbl_sample] VALUES (NEXT VALUE FOR [Seq_Sample],'TEST-1')
INSERT INTO [tbl_sample] VALUES (NEXT VALUE FOR [Seq_Sample],'TEST-2')
INSERT INTO [tbl_sample] VALUES (NEXT VALUE FOR [Seq_Sample],'TEST-3')
INSERT INTO [tbl_sample] VALUES (NEXT VALUE FOR [Seq_Sample],'TEST-4');
GO

--End of Step-3

--Step-4
--Browse the table

--Use database AdventureWorks
USE [AdventureWorks2012]
GO

--Browse table
SELECT * FROM [tbl_sample];
GO

--End of Step-4

--Result will give you duplicate values in the column

--End of Sample Problem

--Solution

--Step-1
--Create Sample table

--Use database AdventureWorks
USE [AdventureWorks2012]
GO

--Drop table tbl_sample
--Create a sample Table
CREATE TABLE [dbo].[tbl_sample]
(
   [ID] [int] NULL
 , [Name] [varchar](100) NULL
) ON [PRIMARY];
GO

--End of Step-1

--Step-2
--Create a unique index on column ID of sample table

--Use database AdventureWorks
USE [AdventureWorks2012]
GO

--Unique index
CREATE UNIQUE INDEX AK_tbl_sample_ID
  ON dbo.tbl_sample (ID);
GO

--End of Step-2

--Step-3
--Sequence object with no cycle property

--Use database AdventureWorks
USE [AdventureWorks2012]
GO
--Create a sample Sequence object
CREATE SEQUENCE [dbo].[Seq_Sample]
AS [tinyint]
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 4
NO CYCLE;
GO

--End of Step-3

--Step-4
--Insert Values

--Use database AdventureWorks
USE [AdventureWorks2012]
GO

--Insert records into table
INSERT INTO [tbl_sample] VALUES (NEXT VALUE FOR [Seq_Sample],'TEST-1')
INSERT INTO [tbl_sample] VALUES (NEXT VALUE FOR [Seq_Sample],'TEST-2')
INSERT INTO [tbl_sample] VALUES (NEXT VALUE FOR [Seq_Sample],'TEST-3')
INSERT INTO [tbl_sample] VALUES (NEXT VALUE FOR [Seq_Sample],'TEST-4');
GO

--End of Step-4

--Step-5
--Browse table again

--Use database AdventureWorks
USE [AdventureWorks2012]
GO

--Browse
SELECT * FROM [tbl_sample]
GO

--End of Step-5

--End of Solution
