--Script Name: Function to parse alphanumeric characters from string
--Script Type: Function
--Article: https://raresql.com/2013/03/11/sql-server-function-to-parse-alphanumeric-characters-from-string/
--Developed By: Muhammad Imran
--Date Created: 11 Mar 2013
--Date Modified: 11 Jan 2023

--Solution

--Create function
CREATE FUNCTION dbo.[UDF_Extract_Alphanumeric_From_String]
(
@String VARCHAR(MAX) -- Variable for string
)
RETURNS VARCHAR(MAX)
BEGIN
DECLARE @RETURN_STRING VARCHAR(MAX)
 
; WITH  N1 (n) AS (SELECT 1 UNION ALL SELECT 1),
N2(n) AS (SELECT 1 FROM N1 AS X, N1 AS Y),
N3(n) AS (SELECT 1 FROM N2 AS X, N2 AS Y),
N4(n) AS (SELECT ROW_NUMBER() OVER(ORDER BY X.n)
FROM N3 AS X, N3 AS Y)
 
SELECT @RETURN_STRING=ISNULL(@RETURN_STRING,'')+ SUBSTRING(@String,Nums.n,1)
FROM N4 Nums
WHERE Nums.n&amp;lt;=LEN(@String) AND PATINDEX('%[0-9A-Za-z ]%',SUBSTRING(@String,Nums.n,1))&amp;gt;0
 
RETURN @RETURN_STRING
END
 
GO
SELECT dbo.[UDF_Extract_Alphanumeric_From_String] ('This! is a t_est s/tring a_t ra.re:s;ql') as [Result]

--End of solution
