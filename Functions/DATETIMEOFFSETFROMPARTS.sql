--Script Name: Date and Time Function – DATETIMEOFFSETFROMPARTS
--Script Type: Function
--Article: https://raresql.com/2013/01/26/sql-server-2012-date-and-time-function-datetimeoffsetfromparts/
--Developed By: Muhammad Imran
--Date Created: 26 Jan 2013
--Date Modified: 7 Jan 2023

--Syntax
DATETIMEOFFSETFROMPARTS ( year, month, day, hour, minute, seconds, fractions, hour_offset, minute_offset, precision )

--End of syntax

--Example-1

--Declare variables
Declare @Year as smallint=2012
Declare @Month as smallint = 12
Declare @Day as smallint =31
Declare @Hour as int=23
Declare @Minute as int=59
Declare @Second as int=59
Declare @Fraction as int=50
Declare @Hour_offset as int=12
Declare @Minute_offset as int=00
 
--Browse data
Select DATETIMEOFFSETFROMPARTS( @Year,@Month,@Day,@Hour,@Minute,@Second,@Fraction,@Hour_offset,@Minute_offset,2)
as [RESULT]

--End of example-1

--Example-2

--Declare variables
Declare @Year as smallint=2012
Declare @Month as smallint = 12
Declare @Day as smallint =31
Declare @Hour as int=23
Declare @Minute as int=59
Declare @Second as int=59
Declare @Fraction as int=50
Declare @Hour_offset as int=15 -- Invalid Hour offset
Declare @Minute_offset as int=00
 
--Browse data
Select DATETIMEOFFSETFROMPARTS( @Year,@Month,@Day,@Hour,@Minute,@Second,@Fraction,@Hour_offset,@Minute_offset,2)
as [RESULT]

--End of example-2

--Example-3

--Declare variables
Declare @Year as smallint=2012
Declare @Month as smallint = 12
Declare @Day as smallint =31
Declare @Hour as int=23
Declare @Minute as int=59
Declare @Second as int=59
Declare @Fraction as int=50
Declare @Hour_offset as int=NULL -- Hour offset as NULL
Declare @Minute_offset as int=00
 
--Browse data
Select DATETIMEOFFSETFROMPARTS( @Year,@Month,@Day,@Hour,@Minute,@Second,@Fraction,@Hour_offset,@Minute_offset,2)
as [RESULT]

--End of example-3
