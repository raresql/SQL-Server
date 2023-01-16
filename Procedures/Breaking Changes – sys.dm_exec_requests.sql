--Script Name: Breaking Changes – sys.dm_exec_requests
--Script Type: Function
--Article: https://raresql.com/2013/03/26/sql-server-2012-breaking-changes-sys-dm_exec_requests/
--Developed By: Muhammad Imran
--Date Created: 26 Mar 2013
--Date Modified: 11 Jan 2023

--Step-1

--Sample

--Use database tempdb
use tempdb
GO

--Create table
CREATE TABLE [dbo].[dm_exec_requests_temp](
    [session_id] [smallint] NOT NULL,
    [status] [nvarchar](30) NOT NULL,
    [blocking_session_id] [smallint] NULL,
    [command] [nvarchar](16) NOT NULL,
    [wait_type] [nvarchar](60) NULL,
    [wait_time] [int] NOT NULL,
    [wait_resource] [nvarchar](256) NOT NULL,
    [transaction_id] [bigint] NOT NULL
) ON [PRIMARY]
GO

--End of step-1

--Step-2

--Insert into table
Insert into dm_exec_requests_temp
SELECT session_id ,status ,blocking_session_id, command
    ,wait_type ,wait_time ,wait_resource
    ,transaction_id
FROM sys.dm_exec_requests
GO

--Browse table
Select * from dm_exec_requests_temp

--End of sample

--End step-2

--Step-3

--Insert into table
Insert into dm_exec_requests_temp
SELECT session_id ,status ,blocking_session_id, command
    ,wait_type ,wait_time ,wait_resource
    ,transaction_id
FROM sys.dm_exec_requests
GO

--Browse table
Select * from dm_exec_requests_temp

--End step-3

--Step-4

--NO QUERY

--End step-4

--Step-5

--Alter table
Alter table dbo.dm_exec_requests_temp Alter column [command] nvarchar(32)

--End step-5
