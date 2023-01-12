--Script Name: Retrieve Processes Using Specified Database
--Script Type: Solution
--Article: https://raresql.com/2013/02/28/sql-server-retrieve-processes-using-specified-database/
--Developed By: Muhammad Imran
--Date Created: 28 Feb 2013
--Date Modified: 10 Jan 2023

--Old approach
--Declare variable
Declare @database_name as varchar(max)

--Set value to variable
Set @database_name ='AdventureWorks2012'

--Browse data
Select [spid] as [session_id], [last_batch],[status]
,cmd as [Command], hostname as [host_name]
,[program_name], [loginame] as [Login_name]
from sys.sysprocesses
Where dbid = db_id(@database_name)

--End of old approach

--New approach

--Declare variable
Declare @database_name as varchar(max)

--Set value to variable
Set @database_name ='AdventureWorks2012'

--Browse data
Select A.session_id,A.last_request_end_time as [last_batch],A.[status]
, B.[command],A.[host_name]
,A.[program_name],A.[login_name]
from sys.dm_exec_sessions A
Left Join sys.dm_exec_requests B
On A.[session_id]=B.[session_id]
Where A.[database_id]=db_id(@database_name)

--End of new approach
