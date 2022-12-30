--Script Name: TRIM()
--Script Type: Function
--Article: https://raresql.com/2022/11/07/sql-server-2022-tsql-enhancements-trim-function/
--Developed By: Muhammad Imran
--Date Created: 07 Nov 2022
--Date Modified: 22 Dec 2022

--Trim in earlier versions
--Example

--Declare variable
DECLARE @EMAIL VARCHAR(100) 

--Set value of variable
SET @EMAIL = '     KenSanchez@gmail.com      ';

--Use TRIM() function
SELECT  @EMAIL   AS [OriginalEmail]
      , TRIM (@EMAIL)  AS [TrimEmail];
GO

--End of example

--Enhancement

--Leading
--Declare variable
DECLARE @EMAIL VARCHAR(100) 

--Set value of variable
SET @EMAIL = '  ;KenSanchez@gmail.com';

--Use TRIM(Leading) function 
SELECT @EMAIL  AS [OriginalEmail]
     , TRIM(LEADING' ; ' FROM @EMAIL) AS  [AfterTrimEmail];
GO

--End of leading

--Trailing
--Declare variable
DECLARE @EMAIL VARCHAR(100) 

--Set value of variable
SET @EMAIL = 'KenSanchez@gmail.com;   ';

--Use TRIM(Trailing) function
SELECT @EMAIL  AS [OriginalEmail]
     , TRIM(TRAILING' ; ' FROM @EMAIL) AS  [AfterTrimEmail];
GO

--End of trailing

--Both
--Declare variable
DECLARE @EMAIL VARCHAR(100) 

--Set value of variable
SET @EMAIL = '   ;KenSanchez@gmail.com;   ';

--Use TRIM(Both) function
SELECT @EMAIL  AS [OriginalEmail]
     , TRIM(BOTH' ; ' FROM @EMAIL) AS  [AfterTrimEmail];
GO

--End of both

--Without giving leading,trailing,both
--Declare variable
DECLARE @EMAIL VARCHAR(100) 

--Set value of variable
SET @EMAIL = '   ;KenSanchez@gmail.com;   ';

--Use TRIM() function
SELECT @EMAIL  AS [OriginalEmail]
     , TRIM(' ; ' FROM @EMAIL) AS  [AfterTrimEmail];
GO

--End of enhancement
