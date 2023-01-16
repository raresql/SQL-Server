--Script Name: Undocumented function – fn_dblog
--Script Type: Function
--Article: https://raresql.com/2013/04/15/sql-server-undocumented-function-fn_dblog/
--Developed By: Muhammad Imran
--Date Created: 15 Apr 2013
--Date Modified: 11 Jan 2023

--Example-1

Select * from fn_dblog(NULL,NULL)

--End of example-1

--Example-2

--Passed LSN
use test
Go
Select * from fn_dblog('000005c9:0000133d:0022','000005c9:0000133d:0022')

--convert hexa decimal LSN into integer LSN

--Declare variables
Declare @Xml Xml
Declare @String Varchar(Max)
Declare @delimiter Varchar(5)

--Set values of variables
Set @delimiter=':'
Set @String ='000005c9:0000133d:0022'
SET @Xml = cast(('&lt;a&gt;0x'+replace(@String,@delimiter,'&lt;/a&gt;&lt;a&gt;0x')+'&lt;/a&gt;')
AS XML)
 
;With CTE as (SELECT A.value('.', 'varchar(max)') as [Column]
from @Xml.nodes('a') AS FN(A) )
Select Stuff((Select ':' +
Convert (varchar(max),Convert(INT,cast('' AS XML).value
('xs:hexBinary(substring(sql:column(&quot;[Column]&quot;),3) )', 'varbinary(max)')))
from CTE for xml path('') ),1,1,'') as [Current LSN]

--End of example-2
