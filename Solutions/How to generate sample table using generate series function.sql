--Script Name: How to generate sample table using generate series function
--Script Type: Solution
--Article: https://raresql.com/2022/11/25/sql-server-2022-how-to-generate-sample-table-using-generate_series-function/
--Developed By: Muhammad Imran
--Date Created: 25 Nov 2022
--Date Modified: 3 Jan 2023

--Example
--Sample

--Use database tempdb
USE tempdb
GO
 
--Create table
CREATE TABLE [Customers]
(
 [CustomerID]         INT,
 [CustomerName]       VARCHAR(250),
 [RegistrationDate]   DATE,
 [EmailAddress]       VARCHAR(100),
 [Address]            VARCHAR(500),
 [PhoneNumber]        VARCHAR(100),
 [DiscountPercentage] NUMERIC(18,6)
);
GO

--Declare variables
DECLARE @Start INT = 1;    --Starting point of the record
DECLARE @Stop  INT = 1000; --Ending point of the record
 
--Insert records into table
INSERT INTO [Customers]
(
 [CustomerID],
 [CustomerName],
 [RegistrationDate],
 [EmailAddress],
 [Address],
 [PhoneNumber],
 [DiscountPercentage]
)

--end of sample

--Use CONCAT(), DATEADD(), CONVERT()
--Use GENERATE_SERIES()

SELECT 
  value                                           AS [CustomerID]
, CONCAT('John',' - ',value)                      AS [CustomerName]
, DATEADD(day,value,'1753-01-01')                 AS [RegistrationDate]
, CONCAT('John',value,'@raresql.com')             AS [EmailAddress]
, CONCAT(value,' N. 10th Street')                 AS [Address]
, '1 (11) '+ RIGHT(CONCAT('0000000000',value),11) AS [PhoneNumber]
, CONVERT(NUMERIC(18,6),value)/@Stop              AS [DiscountPercentage]

FROM GENERATE_SERIES(@Start,@Stop);
GO

--Browse the data 
SELECT * FROM [Customers];
GO

--End of example
