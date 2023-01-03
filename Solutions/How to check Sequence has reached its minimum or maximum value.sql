--Script Name: How to check Sequence has reached its minimum or maximum value
--Script Type: Solution
--Article: https://raresql.com/2013/10/05/sql-server-2012-how-to-check-sequence-has-reached-its-minimum-or-maximum-value/
--Developed By: Muhammad Imran
--Date Created: 5 Oct 2013
--Date Modified: 27 Dec 2022

--Sample

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--DROP SEQUENCE [dbo].[Seq_Sample1]
--GO

--Create Sequence
CREATE SEQUENCE [dbo].[Seq_Sample1]
    AS [tinyint]
	   START WITH 1
       INCREMENT BY 1
	   MINVALUE 1
	   MAXVALUE 4
GO

--Generate sequence number up to 4 ID
--because it has a maximum limit of 4.
SELECT Next value for [dbo].[Seq_Sample1]
GO

--End of sample

--Solution-1
--Not recommended

--This script is compatible with SQL Server 2012 and above.

--Declare variables
DECLARE @minimum_value As sql_variant
DECLARE @maximum_value As sql_variant
DECLARE @current_value As sql_variant

--Assign values to variables
SELECT @minimum_value=[minimum_value]
	 , @maximum_value=[maximum_value]
	 , @current_value=[current_value]
FROM sys.sequences AS seq WHERE name ='Seq_Sample1'
 
--Use IIF() function
SELECT IIF(@minimum_value=@current_value OR @maximum_value=@current_value
	 , 'You cannot generate a new ID'
	 , 'You can generate a new ID') AS [Result]

--End of solution-1

--Solution-2

--This script is compatible with SQL Server 2012 and above.

--Use IIF() function
SELECT IIF((SELECT is_exhausted FROM sys.sequences AS seq WHERE name ='Seq_Sample1')=1
	 , 'You cannot generate a new ID'
	 , 'You can generate a new ID')
AS [Result]

--End of solution-2
