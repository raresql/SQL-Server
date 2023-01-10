--Script Name: How to insert multilingual data in a Table
--Script Type: Solution
--Article: https://raresql.com/2013/03/14/sql-server-how-to-insert-multilingual-data-in-a-table/
--Developed By: Muhammad Imran
--Date Created: 14 Mar 2013
--Date Modified: 5 Jan 2023

--Sample

--Step-1

--Create table
Create table test
(
[Employee ID] int identity(1,1),
[Employee Name] varchar(50)
)

--End of step-1

--Step-2

--Insert records into table
Insert into test ([Employee Name]) values('عمران')

--End of step-2

--Step-3

--Browse table
SELECT * FROM test

--End of step-3
--End of sample

--Resolution

--Step-1

--Alter table
Alter table dbo.test Alter column [Employee Name] nvarchar(50)

--End of step-1

--Step-2

--Insert record into table
Insert into test ([Employee Name]) values(N'عمران')

--End of step-2

--Step-3

--Browse table
SELECT * FROM test

--End of step-3

--End of resolution
