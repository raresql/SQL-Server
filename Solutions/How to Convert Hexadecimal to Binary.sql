-- Script Name: Convert Hexadecimal to Binary
-- Script Type: Solutions
-- Developed By: Muhammad Imran
-- Date Created: 14th Jan 2015
-- Date Modified: 24th Dec 2022

-- Create Function for Hex to Binary Conversion

CREATE FUNCTION dbo.[UDF_Convert_Hex_to_Binary]
(
   @HEX VARBINARY(MAX)
)
RETURNS VARCHAR(MAX)
BEGIN
     DECLARE @BINARY VARCHAR(MAX);
     
     WITH N1 (n) AS (SELECT 1 UNION ALL SELECT 1)
        , N2 (n) AS (SELECT 1 FROM N1 AS X, N1 AS Y)
        , N3 (n) AS (SELECT 1 FROM N2 AS X, N2 AS Y)
        , N4 (n) AS (SELECT ROW_NUMBER() OVER(ORDER BY X.n)
     FROM N3 AS X, N3 AS Y)
 
-- Browse data

    SELECT @BINARY=ISNULL(@BINARY,'')
           + CONVERT(NVARCHAR(1), (SUBSTRING(@HEX, Nums.n, 1) / 128) % 2)
           + CONVERT(NVARCHAR(1), (SUBSTRING(@HEX, Nums.n, 1) / 64) % 2)
           + CONVERT(NVARCHAR(1), (SUBSTRING(@HEX, Nums.n, 1) / 32) % 2)
           + CONVERT(NVARCHAR(1), (SUBSTRING(@HEX, Nums.n, 1) / 16) % 2)
           + CONVERT(NVARCHAR(1), (SUBSTRING(@HEX, Nums.n, 1) / 8) % 2)
           + CONVERT(NVARCHAR(1), (SUBSTRING(@HEX, Nums.n, 1) / 4) % 2)
           + CONVERT(NVARCHAR(1), (SUBSTRING(@HEX, Nums.n, 1) / 2) % 2)
           + CONVERT(NVARCHAR(1), SUBSTRING(@HEX, Nums.n, 1) % 2)
   FROM N4 Nums
   WHERE Nums.n<=LEN(@HEX);
 
RETURN @BINARY
END;
GO
-- End of Function

--Example-1
--Use UDF Function Hex to Binary

-- Browse Data 
Select dbo.[UDF_Convert_Hex_to_Binary](0x1cFEEE) AS [Hex to Binary];
GO
Select dbo.[UDF_Convert_Hex_to_Binary](0x2efd) AS [Hex to Binary];
GO

-- End of example-1
