--Script Name: How to create a Sub Directory in FileTable using TSQL
--Script Type: Solution
--Article: https://raresql.com/2014/05/30/sql-server-how-to-create-a-sub-directory-in-filetable-using-tsql/
--Developed By: Muhammad Imran
--Date Created: 30 May 2014
--Date Modified: 5 Jan 2023

--Step-1

--Create sequence
CREATE SEQUENCE [dbo].[NewID]
 AS [bigint]
 START WITH 100000000
 INCREMENT BY 1
 CACHE
GO

--End of step-1

--Step-2

--Create procedure
CREATE PROCEDURE dbo.GetNewPathLocator
@MainFolderID HIERARCHYID,
@SubDirectoryPath VARCHAR(MAX) OUTPUT
 
AS
BEGIN      
 
    DECLARE @FirstSeqNum sql_variant,
            @LastSeqNum  sql_variant
 
     EXEC sys.sp_sequence_get_range
     @sequence_name = N'dbo.NewID'
   , @range_size = 3
   , @range_first_value = @FirstSeqNum OUTPUT
   , @range_last_value = @LastSeqNum OUTPUT
 
    SELECT @SubDirectoryPath = CONCAT(COALESCE(@MainFolderID.ToString(),'/'),
    CONVERT(VARCHAR(20),@FirstSeqNum) ,'.',
    CONVERT(VARCHAR(20),Convert(BIGINT,@FirstSeqNum)+1) ,'.',
    CONVERT(VARCHAR(20),@LastSeqNum) ,'/')
 
END
GO

--End of step-2

--Step-3

--Declare variable
DECLARE @MainFolderPath AS HIERARCHYID
SELECT @MainFolderPath=path_locator FROM dbo.DataBank
WHERE [name]='IT'
 
DECLARE @SubDirectoryPath varchar(max)
EXEC dbo.GetNewPathLocator
  @MainFolderID=@MainFolderPath
, @SubDirectoryPath = @SubDirectoryPath OUTPUT
 
--Browse data 
INSERT INTO dbo.DataBank (name,path_locator,is_directory,is_archive)
VALUES ('sub directory', @SubDirectoryPath, 1, 0);
GO

--End of step-3
