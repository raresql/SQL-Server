--Script Name: Explicit conversion from data type %ls to %ls is not allowed.
--Script Type: Error
--Article: https://raresql.com/2014/03/11/sql-server-fix-error-22830-could-not-update-the-metadata-that-indicates-database-s-is-enabled-for-change-data-capture/
--Developed By: Muhammad Imran
--Date Created: 29th January 2014
--Date Modified: 30th Dec 2022

--Create Sample

--Use temporary database
USE tempdb
GO

--DROP TABLE tbl_sample
--GO

--Create Table
CREATE TABLE tbl_sample
(
   [Col_ID] INT
 , [Col_Ntext] NTEXT
);
GO
 
--Insert few records
INSERT INTO tbl_sample VALUES (1,'0x7261726573716C2E636F6D')
INSERT INTO tbl_sample VALUES (2,'0x496D72616E')
INSERT INTO tbl_sample VALUES (3,'0x53514C20536572766572');
GO

--End of sample

--Error
 
--Convert the ntext data type column to varbinary
SELECT [Col_ID],CONVERT(VARBINARY(MAX),[Col_Ntext]) AS [Col_Ntext]
FROM tbl_sample
GO
 
--Output returns error Explicit conversion from data type ntext to varbinary(max) is not allowed.
--End of Error

--Solution

--Step-1
--First of all, add one varbinary data type column in the table as shown below.

--Use temporary database
USE tempdb
GO
 
ALTER TABLE tbl_sample ADD [Col_Varbinary] VARBINARY(MAX)
GO

--End of step-1

--Step-2
--Create an update statement using select statement as shown below.

--Use temporary database
USE tempdb
GO
 
SELECT 'UPDATE tbl_sample SET [Col_Varbinary]='
+ CONVERT(VARCHAR(MAX),[Col_Ntext]) +' WHERE [Col_ID] ='
+ CONVERT(VARCHAR(MAX),[Col_ID]) AS [Query]
FROM tbl_sample
GO

--End of step-2

--Step-3
--Once you execute the Step 2 query, you will get the updated statement as a result set as shown above. Just execute that updated statement as shown below.

--Use temporary database
USE tempdb
GO
 
UPDATE tbl_sample SET [Col_Varbinary]=0x7261726573716C2E636F6D
WHERE [Col_ID] =1
 
UPDATE tbl_sample SET [Col_Varbinary]=0x496D72616E
WHERE [Col_ID] =2
 
UPDATE tbl_sample SET [Col_Varbinary]=0x53514C20536572766572
WHERE [Col_ID] =3
GO

--End of step-3

--Step-4
--Delete the ntext column of the table (if not required) as shown below.

--Use temporary database
USE tempdb
GO
 
ALTER TABLE tbl_sample DROP COLUMN [Col_Ntext]
GO

--End of step-4

--Step-5
--Now, browse the table and you can view that you successfully converted ntext data type to varbinary data type.

--Use temporary database
USE tempdb
GO
 
SELECT
 [Col_ID]
,[Col_Varbinary]
FROM tbl_sample
 
GO

--End of step-5

--End of Solution
