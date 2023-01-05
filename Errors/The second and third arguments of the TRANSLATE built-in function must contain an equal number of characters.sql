--Script Name: The second and third arguments of the TRANSLATE built-in function must contain an equal number of characters.
--Script Type: Error
--Article: https://raresql.com/2022/11/14/sql-server-fix-the-second-and-third-arguments-of-the-translate-built-in-function-must-contain-an-equal-number-of-characters/
--Developed By: Muhammad Imran
--Date Created: 14 Nov 2022
--Date Modified: 5 Jan 2023

--Error message

The second and third arguments of the TRANSLATE built-in function must contain an equal number of characters.

--End of error message

--Error

--Declare variable
DECLARE @Number AS VARCHAR(15)

--Set value of variable
SET @Number='+92-3317892345'

--Browse data
SELECT @Number AS PhoneNumber
     , TRANSLATE(@Number,'+','00') AS TranslatedPhoneNumber;
 
GO

--End of error

--Solution

--Declare variable
DECLARE @Number AS VARCHAR(15)

--Set value of variable
SET @Number='+92-3317892345'

--Browse data
SELECT @Number AS PhoneNumber
     , REPLACE(@Number,'+','00') AS REPLACEDPhoneNumber;
GO

--End of solution

