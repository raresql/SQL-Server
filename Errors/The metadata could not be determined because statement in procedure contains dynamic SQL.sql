--Script Name: The metadata could not be determined because statement in procedure contains dynamic SQL
--Script Type: Error
--Article: https://raresql.com/2013/04/17/sql-server-2012-fix-error-11514-the-metadata-could-not-be-determined-because-statement-in-procedure-contains-dynamic-sql-consider-using-the-with-result-sets-clause-to-explicitly-describe-the/
--Developed By: Muhammad Imran
--Date Created: 17 April 2013
--Date Modified: 30 Dec 2022

--Error
--The metadata could not be determined because statement ‘%.*ls’ in procedure ‘%.*ls’  contains dynamic SQL.  Consider using the WITH RESULT SETS clause to explicitly describe the result set.

--End of error

--Error generation

--Use database tempdb
USE tempdb
Go

--Create procedure
CREATE Procedure UDP_Resultset
As

--Declare variables
DECLARE @FirstLetter varchar(3)
DECLARE @SecondLetter varchar(3)

--Set values of variables
SET @FirstLetter ='''A'''
SET @SecondLetter ='''B'''
 
--Declare variable
DECLARE @String varchar(Max)

--Set value of variable
SET @String ='Select ' + @FirstLetter +' As [First Letter]'
EXEC (@String)

--Set value of variable 
SET @String ='Select ' + @SecondLetter +' As [Second Letter]'
EXEC (@String)
GO
EXEC UDP_Resultset

--Execute procedure
EXEC Sp_describe_first_result_set @tsql =N'EXEC UDP_Resultset'

--End of error generation

--Error resolution

--Execute procedure
Sp_describe_first_result_set @tsql =
N'EXEC UDP_Resultset WITH RESULT SETS (([1st Letter] varchar(50))
,([2nd Letter] varchar(50)));'
GO

--End of error resolution
