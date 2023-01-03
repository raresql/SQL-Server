-- Script Name: How to convert yyyymm to Mon-yyyy
-- Script Type: Solution
-- Developed By: Muhammad Imran
-- Date Created: 14th July 2014
-- Date Modified: 24th Dec 2022

-- Create Sample

-- Use temporary database
USE tempdb
GO

-- Create Sample table
CREATE TABLE tbl_Sample
(
    [ID] INT
  , [Date] varchar(6)
);
GO

-- Insert values into sample table
INSERT INTO tbl_Sample VALUES (1,'201401');
INSERT INTO tbl_Sample VALUES (2,'201402');
INSERT INTO tbl_Sample VALUES (3,'201403');
INSERT INTO tbl_Sample VALUES (4,'201404');
INSERT INTO tbl_Sample VALUES (5,'201405');
INSERT INTO tbl_Sample VALUES (6,'201406');
INSERT INTO tbl_Sample VALUES (7,'201407');
INSERT INTO tbl_Sample VALUES (8,'201408');
INSERT INTO tbl_Sample VALUES (9,'201409');
INSERT INTO tbl_Sample VALUES (10,'201410');
INSERT INTO tbl_Sample VALUES (11,'201411');
INSERT INTO tbl_Sample VALUES (12,'201412');
GO

-- Browse data
SELECT * FROM tbl_Sample;
GO

-- End of Sample

-- Old Approach
-- Example-1
-- Using functions LEFT, DATENAME, CONVERT, YEAR

-- Use temporary database
USE tempdb
GO

-- Browse & convert dates
SELECT 
      LEFT(DATENAME(MM,CONVERT(DATE,[Date]+'01')),3)
      + '-'
      + CONVERT(VARCHAR(4),YEAR(CONVERT(DATE,[Date]+'01'))) As [Mon-Year]
FROM tbl_Sample;
GO

-- End of example-1
-- End of Old Approach

-- New Approach
-- Example-2

-- Use temporary database
USE tempdb
GO

-- Browse & convertdates using FORMAT function
SELECT FORMAT(CONVERT(DATE,[Date]+'01'),'MMM-yyyy') As [Mon-Year]
FROM tbl_Sample;
GO
-- End of example-2
-- End of New Approach

--clean up 
DROP table tbl_Sample;
GO
