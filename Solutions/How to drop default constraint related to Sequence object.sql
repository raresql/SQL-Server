--Script Name: Drop default constraint related to Sequence object
--Script Type: Solution
--Article: https://raresql.com/2014/03/10/sql-server-2012-how-to-drop-default-constraint-related-to-sequence-object/
--Developed By: Muhammad Imran
--Date Created: 10th March 2014
--Date Modified: 26th Dec 2022

--Sample Problem
--When we try to drop a sequence object it will give error due to dependency. 
--It seems that we need to go one by one and search each dependency of this sequence object and 
--drop all of them before dropping Sequence Object. A sample script for this is shown below

--This script is compatibile with SQL Server 2012 and above.
--Use temporary database
USE tempdb
GO

--CREATE TABLE
CREATE TABLE dbo.tbl_sample
(  [ID] VARCHAR(8) 
 , [Product Name] varchar(50)
);
GO
 
--CREATE SEQUENCE
USE tempdb
GO
CREATE SEQUENCE dbo.Sample_Seq AS
INT START WITH 1
INCREMENT BY 1 ;
GO
 
--CREATE DEFAULT VALUE OF SEQUENCE
USE tempdb
GO
ALTER TABLE dbo.tbl_sample
ADD CONSTRAINT Const_Sample_Seq
DEFAULT (NEXT VALUE FOR dbo.Sample_Seq) FOR [ID];
GO

--TRY TO DROP SEQUENCE OBJECT
DROP SEQUENCE Sample_Seq;
GO

--Result: This will give error

--End of Sample Problem

--Solution
--Drop Constraints

--This script is compatibile with SQL Server 2012 and above.
--Use temporary database
USE tempdb
GO

--Browse values 
SELECT 'ALTER TABLE '
        + object_name(parent_object_id)
        + ' DROP CONSTRAINT '
        + referencing_entity_name AS [Text]
FROM sys.dm_sql_referencing_entities ('dbo.Sample_Seq', 'OBJECT') re
INNER JOIN sys.default_constraints dc
    ON re.referencing_id=dc.object_id;
GO

--End of solution

--Once you drop the constraint, you can easily drop the sequence, you will not get any error.

--Drop Sequence 
DROP SEQUENCE Sample_Seq
