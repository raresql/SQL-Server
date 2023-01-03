--Script Name: Best way to get Table Row Count
--Script Type: Solution
--Article: https://raresql.com/2012/10/16/sql-server-best-way-to-get-table-row-count/
--Developed By: Muhammad Imran
--Date Created: 16th October 2012
--Date Modified: 28th Dec 2022

--Example-1
--Traditional way to count records from the table.

SET STATISTICS TIME ON
 
SELECT Count(*) AS [Total Records]
FROM [tbl_Sample]

--End of Example-1

--Example-2
--Find already calculated total rows from SSMS

SET STATISTICS TIME ON
 
SELECT SUM([rows]) AS [Total records] FROM sys.partitions
WHERE object_id=object_ID('tbl_Sample') AND [index_id] =1

--End of Example-2
