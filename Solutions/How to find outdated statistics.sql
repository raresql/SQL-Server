--Script Name: How to find outdated statistics
--Script Type: Solution
--Article: https://raresql.com/2013/05/07/sql-server-how-to-find-outdated-statistics/
--Developed By: Muhammad Imran
--Date Created: 7 May 2013
--Date Modified: 28 Dec 2022

--Old approach

--Browse table
SELECT id                    AS [Table ID]
	 , OBJECT_NAME(id)       AS [Table Name]
	 , name                  AS [Index Name]
	 , STATS_DATE(id, indid) AS [LastUpdated]
	 , rowmodctr             AS [Rows Modified]
FROM sys.sysindexes 
WHERE STATS_DATE(id, indid)<=DATEADD(DAY,-1,GETDATE()) 
AND rowmodctr>0 AND (OBJECTPROPERTY(id,'IsUserTable'))=1;
GO

--End of old approach

--New approach

--Use database AdventureWorks2012
--USE AdventureWorks2012
GO

--Browse table
SELECT st.object_id                          AS [Table ID]
	 , OBJECT_NAME(st.object_id)             AS [Table Name]
	 , st.name                               AS [Index Name]
	 , STATS_DATE(st.object_id, st.stats_id) AS [LastUpdated]
	 , modification_counter                  AS [Rows Modified]
FROM sys.stats st 
CROSS APPLY
sys.dm_db_stats_properties(st.object_id, st.stats_id) AS sp 
WHERE
STATS_DATE(st.object_id, st.stats_id)<=DATEADD(DAY,-1,GETDATE())  
AND modification_counter > 0 
AND OBJECTPROPERTY(st.object_id,'IsUserTable')=1;
GO

--End of new approach
