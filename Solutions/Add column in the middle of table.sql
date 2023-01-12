--Script Name: Add column in the middle of table
--Script Type: Solution
--Article: https://raresql.com/2012/10/15/sql-server-add-column-in-the-middle-of-table/
--Developed By: Muhammad Imran
--Date Created: 15 Oct 2012
--Date Modified: 10 Jan 2023


--Sample

--Create table
Create Table Test_Table
(
 [Customer ID] int,
 [Customer Name] varchar(50)
)

--End of sample

--Script

/* To prevent any potential data loss issues, you should review this script in 
detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO

--Create table
CREATE TABLE dbo.Tmp_Test_Table
    (
    [Customer ID] int NULL,
    [Customer Code] int NULL,
    [Customer Name] varchar(50) NULL
    )  ON [PRIMARY]
GO
IF EXISTS(SELECT * FROM dbo.Test_Table)
     EXEC('INSERT INTO dbo.Tmp_Test_Table ([Customer ID], [Customer Name])
        SELECT [Customer ID], [Customer Name] FROM dbo.Test_Table WITH (HOLDLOCK TABLOCKX)')
GO

--Drop table
DROP TABLE dbo.Test_Table
GO

--Execute sp_rename
EXECUTE sp_rename N'dbo.Tmp_Test_Table', N'Test_Table', 'OBJECT'
GO
COMMIT

--End of script
