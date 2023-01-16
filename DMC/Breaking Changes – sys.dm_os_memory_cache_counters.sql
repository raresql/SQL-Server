--Script Name: Breaking Changes – sys.dm_os_memory_cache_counters
--Script Type: DMV
--Article: https://raresql.com/2013/04/22/sql-server-2012-breaking-changes-sys-dm_os_memory_cache_counters/
--Developed By: Muhammad Imran
--Date Created: 22 Apr 2013
--Date Modified: 12 Jan 2023

--Script

--This query is compatibale with SQL Server 2005 and 2008 only.

--Browse cache
Select [name],[type],SUM([single_pages_kb]) As [single_pages_kb]
,SUM([multi_pages_kb]) As [multi_pages_kb]
from  sys.dm_os_memory_cache_counters
Group By [name],[type]
Order By [name], [type]

Select [name],[type]
,SUM([single_pages_kb]) As [single_pages_kb]
,SUM([multi_pages_kb]) As [multi_pages_kb] 
from  sys.dm_os_memory_cache_counters
Group By [name],[type]
Order By [name], [type]


--SQL SERVER 2012

--This query is compatible with SQL Server 2012 and above.

--Browse cache
Select [name],[type]
,SUM([pages_kb]) As [pages_kb]
,SUM([pages_in_use_kb]) As [pages_in_use_kb]
from sys.dm_os_memory_cache_counters
Group By [name],[type]
Order By [name], [type]

--End of script
