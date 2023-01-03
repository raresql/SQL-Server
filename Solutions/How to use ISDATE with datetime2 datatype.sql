--Script Name: How to use ISDATE with datetime2 datatype
--Script Type: Solution
--Article: https://raresql.com/2013/11/18/sql-server-how-to-use-isdate-with-datetime2-datatype/
--Developed By: Muhammad Imran
--Date Created: 18 Nov 2013
--Date Modified: 27 Dec 2022

--Error

--Declare variable
DECLARE @Datetime2 AS DATETIME2;

--Set value of variable
SET @Datetime2=GETDATE();

--Use ISDATE() function
SELECT ISDATE(@Datetime2)  AS [Validate_Date];
GO

--End of error

--Solution

--Declare variables
DECLARE @Datetime2 AS DATETIME2;
DECLARE @Varchar AS VARCHAR(10);

--Set values of variables
SET @Datetime2=GETDATE();
SET @Varchar='raresql';

--USE IIF() function
--Use TRY_CONVERT() function
SELECT
IIF(TRY_CONVERT(DATETIME,@Datetime2) is null ,0,1) AS [Validate_Date]
,IIF(TRY_CONVERT(DATETIME,@Varchar) is null ,0,1) AS [Validate_Date];
GO

--End of solution
