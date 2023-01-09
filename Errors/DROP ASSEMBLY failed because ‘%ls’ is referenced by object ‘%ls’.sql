--Script Name: DROP ASSEMBLY failed because ‘%ls’ is referenced by object ‘%ls’
--Script Type: Error
--Article: https://raresql.com/2013/02/20/sql-server-drop-assembly-failed-because-ls-is-referenced-by-object-ls/
--Developed By: Muhammad Imran
--Date Created: 20 Feb 2013
--Date Modified: 7 Jan 2023

--Error
DROP ASSEMBLY failed because ‘%ls’ is referenced by object ‘%ls’

--End of error

--Error generation
Drop assembly CLRExcelFV

--End of error generation

--Error resolution

SELECT A.assembly_id,A.name as [Assembly Name],
B.object_id, C. name as [Object Name], C.type, C.type_desc
FROM Sys.Assemblies A
INNER JOIN SYS.ASSEMBLY_MODULES B oN a.assembly_id=B.assembly_id
INNER JOIN SYS.OBJECTS C ON B.object_id = C.object_id

--Drop functions
Drop Function FV
Drop Function PV
Drop Function Rate
Drop assembly CLRExcelFV

--End of error resolution
