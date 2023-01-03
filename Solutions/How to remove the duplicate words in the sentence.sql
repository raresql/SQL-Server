-- Script Name: How to remove the duplicate words in the sentence
-- Script Type: Solutions
-- Developed By: Muhammad Imran
-- Date Created: 05 Jan 2015
-- Date Modified: 24 Dec 2022

-- Create Sample

-- Create Sample table  
CREATE TABLE tbl_Sample
(
   [ID] INT IDENTITY(1,1)
 , [Sentence] VARCHAR(MAX)
);
GO

-- Insert values into sample table
INSERT INTO tbl_Sample
VALUES ('This is the the test test script from from raresql.com');
INSERT INTO tbl_Sample
VALUES ('This should should remove duplicates');
GO

-- End of Sample

-- Example-1
-- Function to remove duplicate words

-- Create function
CREATE FUNCTION dbo.[UDF_Remove_Duplicate_Entry]
(
   @Duplicate_Word VARCHAR(MAX)
)
RETURNS VARCHAR(MAX)
BEGIN
     DECLARE @Xml XML
     DECLARE @Removed_Duplicate_Word VARCHAR(MAX)
     SET @Xml = CAST(('<A>'+REPLACE(@Duplicate_Word,' ','</A><A>')+'</A>') AS XML);
GO

-- End of Function

-- Create a new CTE
WITH CTE AS (
           SELECT
                 ROW_NUMBER() OVER(ORDER BY A) AS [Sno]
              ,  A.value('.', 'varchar(max)') AS [Column]
           FROM @Xml.nodes('A') AS FN(A) );
GO

-- End of CTE

-- Browse data for duplicate words
SELECT 
      @Removed_Duplicate_Word = (SELECT Stuff((SELECT '' + ' ' + '' + A.[Column] 
                                 FROM CTE A
                                 LEFT JOIN CTE B ON A.[Sno]+1=B.[Sno]
                                 WHERE (A.[Column]<>B.[Column] Or B.[Sno] is NULL)
FOR XML PATH('') ),1,1,''))
 
RETURN @Removed_Duplicate_Word
END;
GO

-- Browse Data
SELECT
      [ID]
   ,  [Sentence] As [Before Duplicate removal]
   ,  dbo.[UDF_Remove_Duplicate_Entry]([Sentence]) As [After Duplicate removal]
FROM tbl_Sample;
GO

-- End of example-1


-- clean up
Drop table tbl_Sample;
GO
