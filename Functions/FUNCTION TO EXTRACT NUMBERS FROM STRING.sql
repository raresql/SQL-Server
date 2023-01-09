--Script Name: Function to Extract Numbers From String
--Script Type: Function
--Article: https://raresql.com/2012/12/19/sql-server-function-to-extract-numbers-from-string/
--Developed By: Muhammad Imran
--Date Created: 19 Dec 2012
--Date Modified: 7 Jan 2023

--Solution

--Create function
CREATE FUNCTION dbo.[UDF_Extract_Numbers_From_String]
(
      @String VARCHAR(MAX)  -- Variable for string
)
RETURNS VARCHAR(MAX)
BEGIN
DECLARE @RETURN_STRING VARCHAR(MAX)
 
;WITH N1 (n) AS (SELECT 1 UNION ALL SELECT 1),
N2 (n) AS (SELECT 1 FROM N1 AS X, N1 AS Y),
N3 (n) AS (SELECT 1 FROM N2 AS X, N2 AS Y),
N4 (n) AS (SELECT ROW_NUMBER() OVER(ORDER BY X.n)
FROM N3 AS X, N3 AS Y)
 
SELECT @RETURN_STRING=ISNULL(@RETURN_STRING,'')+ SUBSTRING(@String,Nums.n,1)
FROM N4 Nums
WHERE Nums.n<=LEN(@String) AND  PATINDEX('%[0-9.+-]%',SUBSTRING(@String,Nums.n,1))>0
 
RETURN @RETURN_STRING
END
GO
 
SELECT dbo.UDF_Extract_Numbers_From_String
('Mobile No +49 4879 17835 is activated') as [Numbers]
GO
SELECT dbo.UDF_Extract_Numbers_From_String
('New Fax No is +2-213-8764243') as [Numbers]
 
--End of solution
