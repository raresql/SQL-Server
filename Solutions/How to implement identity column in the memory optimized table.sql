--Script Name: How to implement identity column in the memory optimized table
--Script Type: Solution
--Article: https://raresql.com/2013/07/15/sql-server-hekaton-how-to-implement-identity-column-in-the-memory-optimized-table/
--Developed By: Muhammad Imran
--Date Created: 15 July 2013
--Date Modified: 28 Dec 2022

--Sample
--Error

--Use database Northwind
USE Northwind
GO

--Create table
CREATE TABLE tbl_sample
(
 [ID] integer identity(1,1) not null primary key nonclustered hash
  with (bucket_count = 1024),
 [Name] varchar(200) not null
) WITH (MEMORY_OPTIMIZED = ON);
GO

--End of error

--Solution

--Step-1

--Use database hkNorthwind
USE hkNorthwind
GO

--Create table
CREATE TABLE tbl_sample
(
 [ID] integer not null primary key nonclustered hash
  with (bucket_count = 1024),
 [Name] varchar(200) not null
) WITH (MEMORY_OPTIMIZED = ON);
GO

--End of step-1
--End of sample

--Step-2

--Use database hkNorthwind
USE hkNorthwind
GO

--Create sequence
CREATE SEQUENCE [Seq_Sample]
 AS [int]
 START WITH 1
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 1000;
GO

--End of step-2

--Step-3

--Use database Northwind
USE Northwind
GO

--Insert records into table
INSERT INTO tbl_sample ([ID],[Name])
VALUES (NEXT VALUE FOR [Seq_Sample],'raresql-1')
GO
INSERT INTO tbl_sample ([ID],[Name])
VALUES (NEXT VALUE FOR [Seq_Sample],'raresql-2')
GO

--End of step-3

--Step-3

--Use database Northwind
USE Northwind
GO

--Browse table
SELECT * FROM tbl_sample

--End of step-4

--End of solution
