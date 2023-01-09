--Script Name: Enhance word count function
--Script Type: Solution
--Article: https://raresql.com/2013/02/11/sql-server-enhance-word-count-function/
--Developed By: Muhammad Imran
--Date Created: 11 Feb 2013
--Date Modified: 7 Jan 2023

--Create function
CREATE FUNCTION dbo.[UDF_Word_Count_From_String]
(
 @STRING VARCHAR(MAX) -- Variable for string
)
RETURNS VARCHAR(MAX)
BEGIN
 
    DECLARE @RETURNSTRING AS VARCHAR(MAX)
 
    Set @STRING=REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(@STRING
    ,CHAR(9),CHAR(32))
    ,CHAR(13),CHAR(32))
    ,CHAR(10),CHAR(32))
    ,CHAR(32),'øù')
    ,'ùø','')
    ,'øù',CHAR(32))
    SELECT @RETURNSTRING =LEN(@String) - LEN(REPLACE(@String,' ', '')) + 1
RETURN @RETURNSTRING
END
GO
Select dbo.[UDF_Word_Count_From_String]('How many
word        do   you
have in this sentence?') as [Word Count]
