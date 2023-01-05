--Script Name: Fix – Error :22939 – The parameter @supports_net_changes is set to 1.
--Script Type: Error
--Article: https://raresql.com/2014/07/06/sql-server-2012-fix-error-22939-the-parameter-supports_net_changes-is-set-to-1/
--Developed By: Muhammad Imran
--Date Created: 6th July 2014
--Date Modified: 29th Dec 2022

--Create sample

--Use AdventureWorks database
USE AdventureWorks2012
GO

--Create Sample Table
CREATE TABLE tbl_Sample
(
 [ID] INT NOT NULL,
 [NAME] VARCHAR(50)
);
GO

--End of sample

--Error
--Enable CDC feature on this table with net changes support parameter.

USE AdventureWorks2012
GO
EXEC sys.sp_cdc_enable_table
@source_schema = N'dbo',
@source_name = N'tbl_sample',
@role_name = NULL,
@supports_net_changes = 1
GO

--Output results The parameter @supports_net_changes is set to 1, but the source table does not have a primary key defined and no alternate unique index has been specified.

--End of Error

--Solution
--Lets re-write the RESULT SET and this time we need to mention, middle name column is NULL as shown below.

--Create Primary Key
--Use AdventureWorks database
USE AdventureWorks2012
GO

ALTER TABLE dbo.tbl_Sample ADD PRIMARY KEY (ID)
GO
 
--Create Unique Index
USE AdventureWorks2012
GO

ALTER TABLE tbl_Sample
ADD CONSTRAINT UX_Constraint UNIQUE (ID)
GO

--Now Enable CDC feature on this table with net changes support parameter.
USE AdventureWorks2012
 GO
 EXEC sys.sp_cdc_enable_table
 @source_schema = N'dbo',
 @source_name = N'tbl_sample',
 @role_name = NULL,
 @supports_net_changes = 1
 GO

--End of Solution
