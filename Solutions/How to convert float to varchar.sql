--Script Name: How to convert float to varchar
--Script Type: Solution
--Article: https://raresql.com/2013/04/21/sql-server-how-to-convert-float-to-varchar/
--Developed By: Muhammad Imran
--Date Created: 21 Apr 2013
--Date Modified: 28 Dec 2022

--Method-1

--This script is compatible with SQL Server 2005 and above.

--Declare variables
Declare @varchar as varchar(50);
Declare @float as float;
 
--Set value of variable
Set @float =1234567.12345678;
Select @float as [Float];
 
--Set value of variable
Set @varchar =LTRIM(STR(@float,50,8));
GO
--Select set value 
Select @varchar as [Float converted to varchar];
GO

--End of method-1

--Method-2

--Declare variables
Declare @varchar as varchar(50)
Declare @float as float

--Set value of variable 
Set @float =1234567.12345678;

--browse set value
Select @float as [Float];
GO

--Set value of variable
Set @varchar =Format(@float,'#.#############');

--browse set value
Select @varchar as [Float converted to varchar];
GO

--End of method-2
