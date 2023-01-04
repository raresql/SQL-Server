--Script Name: Must pass parameter number and subsequent parameters
--Script Type: Error
--Article: https://raresql.com/2013/08/19/sql-server-fix-error-119-must-pass-parameter-number-and-subsequent-parameters/
--Developed By: Muhammad Imran
--Date Created: 19 Aug 2013
--Date Modified: 30 Dec 2022

--Error
--Must pass parameter number %d and subsequent parameters as ‘@name = value’. After the form ‘@name = value’ has been used, all subsequent parameters must be passed in the form ‘@name = value’.

--End of error

--Error generation

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
sp_describe_first_result_set @tsql =N'

--Browse data
SELECT object_id,name,type_desc
FROM sys.tables
WHERE object_id=@objectid'
,N'@objectid int'

--End of error generation

--Error resolution

--Method-1

--Use database tempdb
USE AdventureWorks2012
GO
sp_describe_first_result_set @tsql =N'

--Browse data
SELECT object_id,name,type_desc
FROM sys.tables
WHERE object_id=@objectid'
, @params =N'@objectid int'

--End of method-1

--Method-2

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
sp_describe_first_result_set N'

--Browse data
SELECT object_id,name,type_desc
FROM sys.tables
WHERE object_id=@objectid'
, N'@objectid int'

--End of method-2

--End of error resolution
