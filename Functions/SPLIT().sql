--Script Name: Split Function
--Script Type: Fuction
--Article: https://raresql.com/2012/02/14/split-function-in-sql-server/
--Developed By: Muhammad Imran
--Date Created: 14th Feb 2012
--Date Modified: 23rd Dec 2022

--Example-1
--Split the @variable:

--Create user deinfed function.
Create Function dbo.[UDF_Split] 
(           
      @String VARCHAR(MAX),  -- Variable for string
      @delimiter VARCHAR(50) -- Delimiter in the string 
)
RETURNS @Table TABLE(        --Return type of the function
      Splitcolumn VARCHAR(MAX)
) 
BEGIN
     Declare @Xml AS XML  
--Replace the delimiter to the opeing and closing tag to make it an xml document
     SET @Xml = cast(('<A>'+replace(@String,@delimiter,'</A><A>')+'</A>') AS XML)  
--Query this xml document via xquery to split rows and insert it into table to return.
     INSERT INTO @Table SELECT A.value('.', 'varchar(max)') as [Column] FROM @Xml.nodes('A') AS FN(A)  
RETURN
END
GO

--For Example
SELECT * FROM dbo.[UDF_Split] ('Bob,Hulda,Jacoba',',')
GO

--We can use this function to split table's column as well but the issue is, if we have 5 rows in a table
--This function will be executed 5 times.I have another solution to split table's column

--End of example-1

--Example-2

-- Create table
CREATE TABLE [dbo].[Student](
      [Student ID]   [varchar] (6) NOT NULL 
    , [Student Name] [varchar](50) NOT NULL
    , [Code] [varchar] (MAX)
);
GO

-- Insert data
INSERT into dbo.[Student] values ('STD001','Bob','E1,E2,E3');
INSERT into dbo.[Student] values ('STD002','Alexander','X1,X2,X3');
INSERT into dbo.[Student] values ('STD003','Hosanna','A1,A2,A3');
GO

-- End of Sample

-- Here is the sample query to split table's column.

-- Declare Variable
Declare @delimiter VARCHAR(50)

-- Set Variable Value
Set @delimiter=','

-- Declare Common Table Expression
WITH Cte AS 
( 
    SELECT 
        [Student ID]
      , [Student Name]  
      , CAST('<M>' + REPLACE([Code], @delimiter , '</M><M>') + '</M>' AS XML) AS [Code] -- Replace the delimiter to the opeing and closing tag to make it an xml document
    FROM  [Student]; 
);

-- Browse for records from CTE
Select 
      [Student ID] 
    , [Student Name] 
    , Split.a.value('.', 'VARCHAR(MAX)') AS [Code] --Query this xml document via xquery to split rows
FROM CTE 
CROSS APPLY [Code].nodes('/M')Split(a);
GO

-- End of example-2
