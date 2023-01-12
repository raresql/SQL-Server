--Script Name: Selecting Domain from Email Address
--Script Type: Solution
--Article: https://raresql.com/2012/10/27/sql-server-selecting-domain-from-email-address/
--Developed By: Muhammad Imran
--Date Created: 27 Oct 2012
--Date Modified: 10 Jan 2023

--Sample

--Create table
Create table tbl_sample
(
[Email Address] varchar(max)
)

--Insert records into table
Insert into tbl_sample values ('info@microsoft.com')
Insert into tbl_sample values ('Contact@microsoft.com')
Insert into tbl_sample values ('Support@raresql.com')
Insert into tbl_sample values ('info@raresql.com')
Insert into tbl_sample values ('Queries@raresql.com')

--End of sample

--Method-1

--Use SUBSTRING() function
Select Substring([Email Address],CharIndex('@',[Email Address])+1 ,LEN([Email Address])) as [Domain Name]
,Count(*) as [Total No of domains]
from tbl_Sample
Where LEN([Email Address])>1
Group By Substring([Email Address],CharIndex('@',[Email Address])+1 ,LEN([Email Address]))

--End of method-1

--Method-2

--Use STUFF() function
Select STUFF([Email Address],1,CharIndex('@',[Email Address]) ,'') as [Domain Name]
,Count(*) as [Total No of domains]
from tbl_Sample
Group By STUFF([Email Address],1,CharIndex('@',[Email Address]) ,'')

--End of method-2

--Method-3

--Use RIGHT() function
Select Right([Email Address],LEN([Email Address])-CharIndex('@',[Email Address])) as [Domain Name]
,Count(*) as [Total No of domains]
from tbl_Sample
Where LEN([Email Address])>1
Group By Right([Email Address],LEN([Email Address])-CharIndex('@',[Email Address]))

--End of method-3

--Method-4

--Use LEFT() function
Select Reverse(Left(REVERSE([Email Address]),CharIndex('@',REVERSE([Email Address]))-1)) as [Domain Name]
,Count(*) as [Total No of domains]
from tbl_Sample
Where LEN([Email Address])>1
Group By Reverse(Left(REVERSE([Email Address]),CharIndex('@',REVERSE([Email Address]))-1))

--End of method-4

--Method-5

--Use XQUERY

--Declare variable
Declare @delimiter VARCHAR(50)

--Set value of variable
Set @delimiter='@'

--Use CTE  
;WITH Cte AS
(
SELECT CAST('<FirstPart>' + REPLACE([Email Address], @delimiter , '</FirstPart><SecondPart>') + '</SecondPart>' AS XML) AS [Email Address]
FROM  tbl_sample
)
,CTE2 AS (Select Split.a.value('(.)', 'VARCHAR(MAX)') AS [Email Address]
FROM Cte
CROSS APPLY [Email Address].nodes('/SecondPart')Split(a))
 
Select [Email Address]
,Count(*) as [Total No of domains]
from CTE2
Group By [Email Address]

--End of method-5
