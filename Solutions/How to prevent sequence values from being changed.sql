--Script Name: How to prevent sequence values from being changed
--Script Type: Solution
--Article: https://raresql.com/2013/08/18/sql-server-2012-how-to-prevent-sequence-values-from-being-changed/
--Developed By: Muhammad Imran
--Date Created: 18 Aug 2013
--Date Modified: 27 Dec 2022

--Error
--This script is compatible with SQL Server 2005 and above.
--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Update table
UPDATE HumanResources.Department
SET [DepartmentID]=17
WHERE [DepartmentID]=16

--End of Error

--Solution

--Step-1

--Sample

--Use database tempdb
USE tempdb
GO

--Create table
CREATE TABLE tbl_sample_Seq
(
[ID] int,
[Name] varchar(50)
);
GO

--End of sample
--End of step-1

--Step-2

--Use database tempdb
USE tempdb
GO

--Create sequence
CREATE SEQUENCE [dbo].[Seq_Student]
AS [int]
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 1000;
GO

--End of step-2

--Step-3

--Use database tempdb
USE tempdb
GO

--Insert records into table
INSERT INTO tbl_sample_Seq VALUES (NEXT VALUE FOR [Seq_Student],'Imran')
INSERT INTO tbl_sample_Seq VALUES (NEXT VALUE FOR [Seq_Student],'Bob')
INSERT INTO tbl_sample_Seq VALUES (NEXT VALUE FOR [Seq_Student],'Alexander')
INSERT INTO tbl_sample_Seq VALUES (NEXT VALUE FOR [Seq_Student],'Hosanna')
INSERT INTO tbl_sample_Seq VALUES (NEXT VALUE FOR [Seq_Student],'William');
GO

--End of step-3

--Step-4

--Use database tempdb
USE tempdb
GO

--Browse table
SELECT * FROM tbl_sample_Seq
GO

--End of step-4

--Step-5

--Use database tempdb
USE tempdb
GO

--Update table
UPDATE tbl_sample_Seq SET [ID]=33 WHERE [ID]=3
GO

--End of step-5

--Step-6

--Use database tempdb
USE tempdb
GO

--Create trigger
CREATE TRIGGER trg_update
ON tbl_sample_Seq
AFTER UPDATE
AS
BEGIN
SET NOCOUNT ON;
 
DECLARE @OldID INT;
DECLARE @NewID INT;
 
SELECT @OldID =[ID] FROM deleted
SELECT @NewID =[ID] FROM inserted
 
--Print @OldID
--Print @NewID
 
IF @OldID <> @NewID
BEGIN
RAISERROR('Failed', 16, 1);
ROLLBACK TRANSACTION
END
END
GO

--End of step-6

--Step-7

--Use database tempdb
USE tempdb
GO

--Update table
UPDATE tbl_sample_Seq SET [ID]=33 WHERE [ID]=3
GO

--End of step-7

--End of solution
