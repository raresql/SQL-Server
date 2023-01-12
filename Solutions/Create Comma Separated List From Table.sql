--Script Name: Create Comma Separated List From Table
--Script Type: Solution
--Article: https://raresql.com/2012/12/18/sql-server-create-comma-separated-list-from-table/
--Developed By: Muhammad Imran
--Date Created: 18 Dec 2012
--Date Modified: 10 Jan 2023

--Sample-1

--Create table
Create Table tbl_Currency
(
[Currency] varchar(50)
)
GO

--Insert records into table
Insert into tbl_Currency Values ('US dollar')
Insert into tbl_Currency Values ('European euro')
Insert into tbl_Currency Values ('Indian rupee')
Insert into tbl_Currency Values ('Pakistani rupee')
Insert into tbl_Currency Values ('Philippine peso')
Insert into tbl_Currency Values ('UAE dirham')
Insert into tbl_Currency Values ('British pound')

--End of sample-1

--Method-1
--Use CURSOR

--Create procedure
CREATE PROCEDURE Cursor_Example1_Proc
AS
    DECLARE @Currency varchar(Max)
    DECLARE @Consolidated_Currency varchar(Max)
    DECLARE Cur_Cursor CURSOR FOR
    SELECT [Currency] FROM tbl_Currency
 
    OPEN Cur_Cursor
 
    FETCH NEXT FROM Cur_Cursor INTO @Currency
 
    WHILE @@FETCH_STATUS = 0
    BEGIN
        Set @Consolidated_Currency =ISNULL(@Consolidated_Currency,'')
        + ISNULL(@Currency + ', ','')
 
            FETCH NEXT FROM Cur_Cursor INTO  @Currency
    END
    Select Left(@Consolidated_Currency,LEN(@Consolidated_Currency)-1) as [Currency]
 
CLOSE Cur_Cursor
DEALLOCATE Cur_Cursor
GO

--Execute Cursor_Example1_Proc
EXEC Cursor_Example1_Proc
GO

--End of method-1

--Method-2
--Use COALESCE

--Declare variable
Declare @Currency varchar(Max)

--Set value of variable
Set @Currency=''

--Browse variable
Select @Currency=@Currency + Coalesce([Currency]+ ', ','') from tbl_Currency
Select Left(@Currency,LEN(@Currency)-1) as [Currency]
GO

--End of method-2

--Method-3
--Use STUFF() function

--Browse table
SELECT STUFF((SELECT ', ' + [Currency] FROM tbl_Currency FOR XML PATH('')),1,1,'') as [Currency]
GO

--End of method-3


--Method-4
--Real World Example

--Sample-2

--Create table
Create Table tbl_Customer_Bank_Details
(
[Customer ID] int,
[Customer Name] varchar(50),
[Bank Account No] varchar(50)
)
GO

--Insert records into table
Insert into tbl_Customer_Bank_Details Values (1,'Imran','A001')
Insert into tbl_Customer_Bank_Details Values (1,'Imran','A002')
Insert into tbl_Customer_Bank_Details Values (1,'Imran','A003')
Insert into tbl_Customer_Bank_Details Values (2,'Bob','B001')
Insert into tbl_Customer_Bank_Details Values (2,'Bob','B002')
GO

--Browse table
Select * from tbl_Customer_Bank_Details

--End of sample-2

--Use STUFF() function

--Browse table
SELECT [Customer ID], [Customer Name]
, STUFF((SELECT ', ' + A.[Bank Account No] FROM tbl_Customer_Bank_Details A
Where A.[Customer ID]=B.[Customer ID] FOR XML PATH('')),1,1,'') As [Bank Accounts]
From tbl_Customer_Bank_Details B
Group By [Customer ID], [Customer Name]

--End of method-4
