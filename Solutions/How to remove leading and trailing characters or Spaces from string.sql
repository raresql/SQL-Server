--Script Name: TRIM – How to remove leading and trailing characters or Spaces from string
--Script Type: Solution
--Article: https://raresql.com/2013/05/20/sql-server-trim-how-to-remove-leading-and-trailing-charactersspaces-from-string/
--Developed By: Muhammad Imran
--Date Created: 20 May 2013
--Date Modified: 28 Dec 2022

--Left Trim

--Create function
CREATE FUNCTION dbo.L_TRIM(@String VARCHAR(MAX), @Char varchar(5))
RETURNS VARCHAR(MAX)
BEGIN
   RETURN SUBSTRING(@String,PATINDEX('%[^' + @Char + ' ]%'
                    ,@String),DATALENGTH(@String))
END
GO

--In this example, the user defined function will remove spaces and select all from the left side of the string
SELECT '  **  THIS IS A TEST STRING  ***  '
AS [String before Left trim]
, dbo.L_TRIM('  **  THIS IS A TEST STRING  ***  ','*')
AS [String After Left trim]
GO

--In this example, the user defined function will remove spaces and 0 from the left side of the string

SELECT ' 0001234' AS [String before Left trim]
, dbo.L_TRIM(' 0001234','0')  [String After Left trim]
GO

--End of left trim

--Right Trim

--Create function
CREATE FUNCTION dbo.R_TRIM(@String VARCHAR(MAX), @Char varchar(5))
RETURNS VARCHAR(MAX)
BEGIN
  RETURN REVERSE(SUBSTRING(REVERSE(@String)
        ,PATINDEX('%[^' + @Char + ' ]%'
        ,REVERSE(@String)),DATALENGTH(@String)))
END
GO
SELECT '  **  THIS IS A TEST STRING  ***'
AS [String before Right trim]
, dbo.R_TRIM('  **  THIS IS A TEST STRING  ***  ','*') 
AS [String after Right trim]
GO
SELECT '12340000 ' AS [String before Right trim]
, dbo.R_TRIM('12340000 ','0') AS [String after Right trim]
GO

--End of right trim

--Trim

--Create function
CREATE FUNCTION dbo.TRIM(@String VARCHAR(MAX), @Char varchar(5))
RETURNS VARCHAR(MAX)
BEGIN
  RETURN SUBSTRING(@String,PATINDEX('%[^' + @Char + ' ]%',@String)
        ,(DATALENGTH(@String)+2 - (PATINDEX('%[^' + @Char + ' ]%'
        ,REVERSE(@String)) + PATINDEX('%[^' + @Char + ' ]%',@String)
        )))
END
GO
SELECT '  **  THIS IS A TEST STRING  ***  '
 AS [String before trim]
, dbo.TRIM('  **  THIS IS A TEST STRING  ***  ','*') 
 AS [String after trim]
GO
SELECT ' 000012340000 ' AS [String before trim]
, dbo.TRIM(' 000012340000 ','0') AS [String after trim]
GO

--End of trim
