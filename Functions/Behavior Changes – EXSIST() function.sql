--Script Name: Behavior Changes – EXSIST() function
--Script Type: Function
--Article: https://raresql.com/2013/03/20/sql-server-2012-behavior-changes-exist-function/
--Developed By: Muhammad Imran
--Date Created: 20 Mar 2013
--Date Modified: 11 Jan 2023

--Example-1

--Declare variable
DECLARE @xmltest XML;

--Set value of variable
SET @xmltest = null;
SELECT COUNT(*) as [T_Count] WHERE @xmltest.exist('/raresql') = 0;
--End of example-1

--Example-2

--Declare variable
DECLARE @xmltest XML;

--Set value of variable
SET @xmltest = null;
SELECT COUNT(*) as [T_Count] WHERE @xmltest.exist('/raresql') = 0;

--End of example-2

