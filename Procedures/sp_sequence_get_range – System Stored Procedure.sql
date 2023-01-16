--Script Name: sp_sequence_get_range – System Stored Procedure
--Script Type: Procedure
--Article: https://raresql.com/2013/01/20/sql-server-2012-sp_sequence_get_range-system-stored-procedure/
--Developed By: Muhammad Imran
--Date Created: 20 Jan 2013
--Date Modified: 7 Jan 2023


--Syntax

sp_sequence_get_range [ @sequence_name = ] N''
     , [ @range_size = ] range_size
     , [ @range_first_value = ] range_first_value OUTPUT
    [, [ @range_last_value = ] range_last_value OUTPUT ]
    [, [ @range_cycle_count = ] range_cycle_count OUTPUT ]
    [, [ @sequence_increment = ] sequence_increment OUTPUT ]
    [, [ @sequence_min_value = ] sequence_min_value OUTPUT ]
    [, [ @sequence_max_value = ] sequence_max_value OUTPUT ]
    [ ; ]

--End of syntax

--Step-1

--Create sequence
CREATE SEQUENCE [dbo].[Invoice]
 AS [int]
 START WITH 1
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 1000
 CYCLE
 CACHE
GO

--End of step-1

--Step-2

SELECT NEXT VALUE FOR dbo.[Invoice] as [New ID]

--End of step-2

--Step-3

--Declare variables
DECLARE @range_first_value sql_variant
, @range_first_value_output sql_variant
, @range_last_value_output sql_variant
 
EXEC sp_sequence_get_range
@sequence_name = N'dbo.Invoice'
, @range_size = 4
, @range_first_value = @range_first_value_output OUTPUT
, @range_last_value = @range_last_value_output OUTPUT
 
SELECT @range_first_value_output AS [First ID]
,@range_last_value_output as [Last ID]

--End of step-3

--Step-4

--NO query

--End of step-4

--Step-5

--Declare variables
DECLARE @First_Value sql_variant
, @Last_Value sql_variant
, @Cycle_Count int
, @Sequence_Increament sql_variant
, @Sequence_Min_Value sql_variant
, @Sequence_Max_Value sql_variant ;
 
--Execute sequence
EXEC sys.sp_sequence_get_range
@sequence_name = N'dbo.Invoice'
, @range_size = 5
, @range_first_value = @First_value OUTPUT
, @range_last_value = @Last_Value OUTPUT
, @range_cycle_count = @Cycle_Count OUTPUT
, @sequence_increment = @Sequence_Increament OUTPUT
, @sequence_min_value = @Sequence_Min_Value OUTPUT
, @sequence_max_value = @Sequence_Max_Value OUTPUT ;
 
SELECT
  @First_value AS FirstVal
, @Last_Value AS LastVal
, @Cycle_Count AS CycleCount
, @Sequence_Increament AS SeqIncrement
, @Sequence_Min_Value AS MinSeq
, @Sequence_Max_Value AS MaxSeq ;


--End of step-5
