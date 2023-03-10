--Script Name: CHOOSE()
--Script Type: Function
--Article: https://raresql.com/2012/08/05/sql-server-2012-new-logical-function-choose/
--Developed By: Muhammad Imran
--Date Created: 5 Aug 2012
--Date Modified: 23 Dec 2022

--Examples

--Use CHOOSE function
Select CHOOSE(0,'QUARTER-1','QUARTER-2','QUARTER-3','QUARTER-4') AS [ANNUAL QUARTER]

--QUARTER-1 
Select CHOOSE(1,'QUARTER-1','QUARTER-2','QUARTER-3','QUARTER-4') AS [ANNUAL QUARTER]

--QUARTER-2 
Select CHOOSE(2,'QUARTER-1','QUARTER-2','QUARTER-3','QUARTER-4') AS [ANNUAL QUARTER]

--QUARTER-3 
Select CHOOSE(3,'QUARTER-1','QUARTER-2','QUARTER-3','QUARTER-4') AS [ANNUAL QUARTER]

--QUARTER-4
Select CHOOSE(4,'QUARTER-1','QUARTER-2','QUARTER-3','QUARTER-4') AS [ANNUAL QUARTER]

--NULL 
Select CHOOSE(5,'QUARTER-1','QUARTER-2','QUARTER-3','QUARTER-4') AS [ANNUAL QUARTER]

--End of Examples
