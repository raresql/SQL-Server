--Script Name: An expression that contains a NEXT VALUE FOR function cannot be passed as an argument to a table-valued function.
--Script Type: Error
--Article: https://raresql.com/2013/06/10/sql-server-2012-fix-error-11724-an-expression-that-contains-a-next-value-for-function-cannot-be-passed-as-an-argument-to-a-table-valued-function/
--Developed By: Muhammad Imran
--Date Created: 10 June 2013
--Date Modified: 30 Dec 2022

--Error
--An expression that contains a NEXT VALUE FOR function cannot be passed as an argument to a table-valued function.

--End of error

--Error generation

--Sample

--Use database tempdb
USE tempdb
GO
 
--Create a sequence
CREATE SEQUENCE [dbo].[Seq_Sequence]
AS [int]
START WITH 1
GO
 
--Create a user defined function
CREATE FUNCTION [dbo].[fn_Sample]
(
@SequenceID INT
)
RETURNS TABLE AS RETURN
(
SELECT 'RCP' + TRY_Convert(varchar(10),@SequenceID) AS [ID]
, GETDATE() AS [CREATION DATETIME]
)
GO

--End of sample

--Browse data
USE tempdb
GO
SELECT * FROM [dbo].[fn_Sample]
(
NEXT VALUE FOR [Seq_Sequence]
)

--End of error generation

--Error resolution

--Use database tempdb
USE tempdb
GO

--Declare and set value of variable
DECLARE @ID AS BIGINT = NEXT VALUE FOR [Seq_Sequence]

--Browse data
SELECT * FROM [dbo].[fn_Sample](@ID)


--End of error resolution
