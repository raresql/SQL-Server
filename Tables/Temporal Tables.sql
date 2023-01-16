--Script Name: Temporal Tables
--Script Type: Table
--Article: https://raresql.com/2015/06/29/sql-server-2016-temporal-tables/
--Developed By: Muhammad Imran
--Date Created: 17 Mar 2015
--Date Modified: 12 Jan 2023


--Script
--Create Temporal tables/

--Create database
CREATE DATABASE SampleDB
GO

--Use database SampleDB
USE SampleDB
GO

--Create table
CREATE TABLE tbl_Product
(
Product_ID int NOT NULL PRIMARY KEY CLUSTERED,
Product_Name varchar(50) NOT NULL,
Rate numeric(18,2),
 
/*Temporal Specific Fields - Period Definition */
[Valid From] datetime2 GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
[Valid Till] datetime2 GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
PERIOD FOR SYSTEM_TIME ([Valid From] ,[Valid Till])
)
WITH
/* Temporal Specific - System-Versioning Configuration*/
(SYSTEM_VERSIONING = ON
    (HISTORY_TABLE = dbo.tbl_Product_History, DATA_CONSISTENCY_CHECK = ON)
);
GO

--Insert statement

--Use database SampleDB
USE SampleDB
GO

--Insert records into table
INSERT INTO dbo.tbl_Product VALUES
 (1,'Product A', 300)
,(2,'Product B', 400)
GO
 
--Browse table
SELECT * FROM tbl_Product
GO
SELECT * FROM dbo.tbl_Product_History
GO

--Update statement

--Use database SampleDB
USE SampleDB
GO

--Update records in table
UPDATE tbl_Product SET Rate =Rate/2
WHERE Product_ID IN (1,2)
GO

--Browse table
SELECT * FROM tbl_Product
GO
SELECT * FROM dbo.tbl_Product_History
GO


--Delete statement

--Use database SampleDB
USE SampleDB
GO

--Delete records from table
DELETE FROM tbl_Product WHERE Product_ID = 2
GO

--Browse table
SELECT * FROM tbl_Product
GO
SELECT * FROM dbo.tbl_Product_History
GO

--Use database SampleDB
USE SampleDB
GO

--Browse table
SELECT * FROM tbl_Product

--End of script
