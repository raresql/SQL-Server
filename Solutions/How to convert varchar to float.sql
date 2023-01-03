--Script Name: How to convert varchar to float
--Script Type: Solution
--Article: https://raresql.com/2013/04/25/sql-server-get-month-name-from-date-using-format-function/6/sql-server-how-to-convert-varchar-to-float/
--Developed By: Muhammad Imran
--Date Created: 26 Apr 2013
--Date Modified: 28 Dec 2022

--Sample

--Use database tempdb
Use tempdb
GO

--Create table
Create Table tbl_test
(
[Numbers] varchar(50)
);
GO

--Insert records into table
Insert into tbl_test values(12345.6789)
Insert into tbl_test values('AB12345')
Insert into tbl_test values(12.1)
Insert into tbl_test values(11.2345678);
GO

--End of sample

--Method-1

--Use database tempdb
Use tempdb
GO

--Browse data
Select [Numbers]
     , (Case When Isnumeric([Numbers])=1 Then Convert(float
     , [Numbers]) else NULL end) As [Varchar to Float]
from tbl_test


--End of method-1

--Method-2

--Use database tempdb
Use tempdb
GO

--Browse data
Select Try_convert(float,[Numbers]) as [Varchar to float]
from tbl_test

--End of method-2

--Database cleanup
DROP TABLE tbl_test;
GO
