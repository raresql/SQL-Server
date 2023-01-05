--Script Name: Full-Text Search – Custom proximity search with NEAR
--Script Type: Solution
--Article: https://raresql.com/2014/03/22/sql-server-2012-full-text-search-custom-proximity-search-with-near/
--Developed By: Muhammad Imran
--Date Created: 22 Mar 2014
--Date Modified: 5 Jan 2023

--Sample

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--DROP TABLE [dbo].[tbl_Comments]
--GO

--Create table
CREATE TABLE [dbo].[tbl_Comments]
(
    [ID] [int] NOT NULL CONSTRAINT [PK_tbl_comments] PRIMARY KEY CLUSTERED ,
    [Comments] [varchar](1000) NULL
)
GO

--Insert records into table
INSERT INTO [dbo].[tbl_Comments]
VALUES (1,'This is a demonstration of custom proximity term in Full-Text Search at raresql.com')
GO

--End of sample

--Example-1
--Put distance 6
--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Browse table
SELECT * FROM [tbl_Comments]
WHERE CONTAINS([Comments], 'NEAR((proximity, raresql), 6)')

--Reduce distance from 6 to 5

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Browse table
SELECT * FROM [tbl_Comments]
WHERE CONTAINS([Comments], 'NEAR((proximity, raresql), 5)')

--End of example-1

--Example-2
--Put the distance 6 and reverse the search word

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Browse table
SELECT * FROM [tbl_Comments]
WHERE CONTAINS([Comments], 'NEAR((raresql,proximity), 6,FALSE)')

--Put the distance between the word is 6

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Browse table
SELECT * FROM [tbl_Comments]
WHERE CONTAINS([Comments], 'NEAR((raresql,Search), 6,TRUE)')

--End of example-2

--Example-3
--Use AND operator

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Browse table
SELECT * FROM [tbl_Comments]
WHERE CONTAINS([Comments], 'NEAR((raresql,proximity), 6) And Full-Text')
GO

--Use OR operator

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Browse table
SELECT * FROM [tbl_Comments]
WHERE CONTAINS([Comments], 'NEAR((raresql,proximity), 5) OR Full-Text')
GO

--Use AND NOT operator

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Browse table
SELECT * FROM [tbl_Comments]
WHERE CONTAINS([Comments], 'NEAR((raresql,proximity), 6) AND NOT sample')
GO

--End of example-3
