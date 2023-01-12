--Script Name: List of all Table & its Index sizes in MBs along with row count
--Script Type: Solution
--Article: https://raresql.com/2013/09/28/sql-server-2014-list-of-all-table-its-index-sizes-in-mbs-along-with-row-count/
--Developed By: Muhammad Imran
--Date Created: 28 Sep 2013
--Date Modified: 10 Jan 2023

--Use hkNorthwind
USE hkNorthwind
GO
EXECUTE sp_MSforeachtable 'EXECUTE sp_spaceused [?];';
GO

--Solution

--Use database hkNorthwind
USE hkNorthwind
GO

--Declare variable
DECLARE @PageSize float
SELECT @PageSize=v.low/1024.0 FROM MASTER.dbo.spt_values v WHERE v.number=1 and v.type='E'

SELECT
  OBJECT_SCHEMA_NAME(tbl.object_id) as [Schema Name]
, OBJECT_NAME(tbl.object_id) as [Table Name]
, CASE
  WHEN (tbl.is_memory_optimized=0) THEN
        ROUND(TRY_CONVERT(float,ISNULL((SELECT @PageSize * SUM(CASE WHEN a.type <> 1 THEN a.used_pages WHEN p.index_id < 2 THEN a.data_pages ELSE 0 END)
        FROM sys.indexes as i
        JOIN sys.partitions as p ON p.object_id = i.object_id and p.index_id = i.index_id
        JOIN sys.allocation_units as a ON a.container_id = p.partition_id
        WHERE i.object_id = tbl.object_id),0.0))/1024,3)
  ELSE
        Round(TRY_CONVERT(float,isnull((SELECT (tms.[memory_used_by_table_kb])
        FROM [sys].[dm_db_xtp_table_memory_stats] tms
        WHERE tms.object_id = tbl.object_id), 0.0))/1024,3)
        END
 as [DataSpaceUsed (In Mbs)]
, (CASE
  WHEN (tbl.is_memory_optimized=0) THEN
    ROUND(TRY_CONVERT(float,ISNULL((
    (SELECT SUM (used_page_count) FROM sys.dm_db_partition_stats ps WHERE ps.object_id = tbl.object_id)
    + ( CASE (SELECT count(*) FROM sys.internal_tables WHERE parent_id = tbl.object_id AND internal_type IN (202,204,207,211,212,213,214,215,216,221,222))
        WHEN 0 THEN 0
        ELSE (
            SELECT sum(p.used_page_count)
            FROM sys.dm_db_partition_stats p, sys.internal_tables it
            WHERE it.parent_id = tbl.object_id AND it.internal_type IN (202,204,207,211,212,213,214,215,216,221,222) AND p.object_id = it.object_id)
        END )
    - (SELECT SUM (CASE WHEN(index_id < 2) THEN (in_row_data_page_count + lob_used_page_count + row_overflow_used_page_count) ELSE 0 END)
        FROM sys.dm_db_partition_stats WHERE object_id = tbl.object_id)
    ) * @PageSize, 0.0) )/1024,3)
 ELSE
    ROUND(TRY_CONVERT(float,isnull((SELECT (tms.[memory_used_by_indexes_kb])
    FROM [sys].[dm_db_xtp_table_memory_stats] tms
    WHERE tms.object_id = tbl.object_id), 0.0)) /1024,3)
END)
as [IndexSpaceUsed (In Mbs)]
 
,(CASE
WHEN (tbl.is_memory_optimized=0) THEN
OBJECTPROPERTYEX(OBJECT_ID, N'Cardinality')
ELSE
(
SELECT ISNULL([rows],0)  as [Total Records]
FROM sys.hash_indexes as Ind
CROSS APPLY sys.dm_db_stats_properties(Ind.object_id,Ind.index_id)
WHERE Ind.index_id =2 AND Ind.object_id=tbl.object_id
)
END) [Total No of Rows]
 
FROM
sys.tables as tbl

--End of solution
