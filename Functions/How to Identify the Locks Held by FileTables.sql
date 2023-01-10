--Script Name: How to Identify the Locks Held by FileTables
--Script Type: Solution
--Article: https://raresql.com/2014/03/20/sql-server-how-to-identify-the-locks-held-by-filetables/
--Developed By: Muhammad Imran
--Date Created: 20 Mar 2014
--Date Modified: 5 Jan 2023

--Script

--Use database SampleDB
USE SampleDB
GO

--Browse table
SELECT * FROM [dbo].[CVBank] WITH (NOLOCK)
GO

--Use database SampleDB
USE SampleDB
GO

--Browse table
SELECT opened_file_name
    FROM sys.dm_filestream_non_transacted_handles
    WHERE fcb_id IN
        ( SELECT request_owner_id FROM sys.dm_tran_locks );
GO

--End of script
