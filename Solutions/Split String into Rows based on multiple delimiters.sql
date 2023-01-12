--Script Name: Split String into Rows based on multiple delimiters
--Script Type: Solution
--Article: https://raresql.com/2013/01/10/sql-server-split-string-into-rows-based-on-multiple-delimiters/
--Developed By: Muhammad Imran
--Date Created: 10 Jan 2013
--Date Modified: 10 Jan 2023

--Script

--Create function
--Create this user deinfed function.
CREATE FUNCTION dbo.[UDF_Split_Based_On_Multiple_Delimiters]
(
      @String VARCHAR(MAX),  -- Variable for string
      @delimiter VARCHAR(50) -- Delimiter in the string
)
RETURNS @Table TABLE(        --Return type of the function
Splitcolumn VARCHAR(MAX)
)
BEGIN
 
        DECLARE @Xml AS XML
        DECLARE @REVISED_STRING VARCHAR(MAX)
 
        ;WITH N1 (n) AS (SELECT 1 UNION ALL SELECT 1),
        N2 (n) AS (SELECT 1 FROM N1 AS X, N1 AS Y),
        N3 (n) AS (SELECT 1 FROM N2 AS X, N2 AS Y),
        N4 (n) AS (SELECT ROW_NUMBER() OVER(ORDER BY X.n)
        FROM N3 AS X, N3 AS Y)
 
        SELECT @REVISED_STRING=STUFF((SELECT '' + (Case When
                PATINDEX('%[' + @delimiter + ']%',SUBSTRING(@String,Nums.n,1)) >0
                Then ',' else LTRIM(RTRIM(SUBSTRING(@String,Nums.n,1))) end)
        FROM N4 Nums WHERE Nums.n<=LEN(@String)  FOR XML PATH('')),1,0,'')
 
        SET @Xml = cast(('<a>'+replace(@REVISED_STRING,
                ',','</a><a>')+'</a>') AS XML)
 
        INSERT INTO @Table SELECT A.value('.', 'varchar(max)')
                as [Column] FROM @Xml.nodes('a') AS FN(a)
 
RETURN
END
GO
--Syntax SELECT * FROM dbo.[UDF_Split_Based_On_Multiple_Delimiters] (String , multiple delimiter)

--Browse function
SELECT * FROM dbo.[UDF_Split_Based_On_Multiple_Delimiters]
('abc,def ; ghij ; kl',',;:')
GO

--End of script
