--Script Name: T-SQL Scripts to Find Maximum between
--Script Type: Solution
--Article: https://raresql.com/2012/10/20/sql-server-2012-t-sql-scripts-to-find-maximum-between/
--Developed By: Muhammad Imran
--Date Created: 20 Oct 2012
--Date Modified: 10 Jan 2023

--Example-1

--Declare variables
DECLARE @Value1 DECIMAL(5,2) = 9.22
DECLARE @Value2 DECIMAL(5,2) = 8.34

--Browse variable
SELECT IIF(ISNULL(@Value1,0) > ISNULL(@Value2,0) ,@Value1, @Value2) AS MaxColumn

--End of example-1

--Example-2

--Declare variables
DECLARE @Value1 DECIMAL(5,2) = 9.22
DECLARE @Value2 DECIMAL(5,2) = Null

--Browse variable
SELECT IIF(ISNULL(@Value1,0) > ISNULL(@Value2,0) ,@Value1, @Value2) AS MaxColumn

--End of example-2

--Example-3

--Declare variables
DECLARE @Value1 DECIMAL(5,2) = -9.22
DECLARE @Value2 DECIMAL(5,2) = 8.34

--Browse variable
SELECT IIF(ISNULL(@Value1,0) > ISNULL(@Value2,0) ,@Value1, @Value2) AS MaxColumn

--End of example-3
