--Script Name: How to create Bulk SQL Users
--Script Type: Solution
--Article: https://raresql.com/2012/04/24/how-to-create-bulk-sql-users/
--Developed By: Muhammad Imran
--Date Created: 24th April 2012
--Date Modified: 28th Dec 2022

--Script

--Create Procedure
CREATE PROCEDURE CREATE_MULTIPLE_LOGIN_PROC
@Excel_File_Name_Path VARCHAR(MAX), 
@Excel_Sheet_Name VARCHAR(MAX),
@Authentication_Type VARCHAR(MAX)
AS
 
DECLARE @SQL VARCHAR(MAX)
 
SET @SQL=''
SET @Excel_Sheet_Name =QUOTENAME (@Excel_Sheet_Name + '$' )--Add "$" to the excel sheet name to make it accessable.
SET @Excel_File_Name_Path='''Excel 4.0;Database=' + @Excel_File_Name_Path + ''

--Create table 
CREATE TABLE #temp_Data
(
    [SNO]    INT,
    [SCRIPT] NVARCHAR(MAX)
)
IF @Authentication_Type ='SQL' -- If Authentication Type is SQL
Begin
        SET @SQL = 'INSERT INTO #temp_Data ' + 'SELECT  [SNO],'+ '''CREATE LOGIN '' 
        + QUOTENAME([LOGIN NAME]) 
        + '' WITH PASSWORD=N''''''+ [PASSWORD] + '''''' 
        ,CHECK_EXPIRATION=''+[CHECK_EXPIRATION]+ ''
        ,CHECK_POLICY=''+[CHECK_POLICY]+ ''
        ,DEFAULT_DATABASE=''+QUOTENAME([DEFAULT_DATABASE])+ ''
        ,DEFAULT_LANGUAGE=''+QUOTENAME([DEFAULT_LANGUAGE])+ '''''
        + ' AS [DATA] FROM OPENROWSET(''Microsoft.Jet.OLEDB.4.0'', ' + @Excel_File_Name_Path + ''', ' +
                      '''SELECT * FROM '+@Excel_Sheet_Name + ''')'
        Print @SQL
        EXEC(@SQL)
 
        SET @SQL = ''
        SET @SQL = 'INSERT INTO #temp_Data Select [SNO]
        ,''EXEC sys.sp_addsrvrolemember @loginame =N''''''+ [LOGIN NAME] + ''''''
        , @rolename =N''''''+[FieldValue] + ''''''''
        FROM (
        Select [SNO],
        [LOGIN NAME], 
        CONVERT(NVARCHAR(Max),[SERVER ROLE 1]) as [SERVER ROLE 1]  ,
        CONVERT(NVARCHAR(Max),[SERVER ROLE 2]) as [SERVER ROLE 2]  ,
        CONVERT(NVARCHAR(Max),[SERVER ROLE 3]) as [SERVER ROLE 3]  ,
        CONVERT(NVARCHAR(Max),[SERVER ROLE 4]) as [SERVER ROLE 4]  ,
        CONVERT(NVARCHAR(Max),[SERVER ROLE 5]) as [SERVER ROLE 5]  ,
        CONVERT(NVARCHAR(Max),[SERVER ROLE 6]) as [SERVER ROLE 6]  ,
        CONVERT(NVARCHAR(Max),[SERVER ROLE 7]) as [SERVER ROLE 7]  ,
        CONVERT(NVARCHAR(Max),[SERVER ROLE 8]) as [SERVER ROLE 8]  ,
        CONVERT(NVARCHAR(Max),[SERVER ROLE 9]) as [SERVER ROLE 9]  ,
        CONVERT(NVARCHAR(Max),[SERVER ROLE 10]) as [SERVER ROLE 10]
        FROM OPENROWSET(''Microsoft.Jet.OLEDB.4.0'', ' + @Excel_File_Name_Path + ''', ' +
                      '''SELECT * FROM '+@Excel_Sheet_Name + '''))Main 
        UNPIVOT(FieldValue  FOR FieldName IN (
        [SERVER ROLE 1] ,
        [SERVER ROLE 2] ,
        [SERVER ROLE 3] ,
        [SERVER ROLE 4] , 
        [SERVER ROLE 5] , 
        [SERVER ROLE 6] , 
        [SERVER ROLE 7] ,
        [SERVER ROLE 8] , 
        [SERVER ROLE 9] , 
        [SERVER ROLE 10] 
        )
        )Sup'
        Print @SQL
        EXEC(@SQL);
END
ELSE IF @Authentication_Type ='Windows'
BEGIN
    ---Create 
        SET @SQL = 'INSERT INTO #temp_Data ' + 'SELECT  [SNO],'+ '''CREATE LOGIN '' 
        + QUOTENAME([LOGIN NAME]) + ''
        FROM WINDOWS WITH DEFAULT_DATABASE=''+QUOTENAME([DEFAULT_DATABASE])+ ''
        , DEFAULT_LANGUAGE=''+QUOTENAME([DEFAULT_LANGUAGE])+ '''''
        + ' AS [DATA] FROM OPENROWSET(''Microsoft.Jet.OLEDB.4.0'', 
       ' + @Excel_File_Name_Path + ''', ' +
       '''SELECT * FROM '+@Excel_Sheet_Name + ''')'
        Print @SQL
        EXEC(@SQL)
        SET @SQL = '';
END
 
Select [SCRIPT] from #temp_Data Order By [SNO],[SCRIPT];
GO

--End of Script

--Syntax 
--CREATE_MULTIPLE_LOGIN_PROC 'Excel Sheet Path','Sheet Name (By Default it is sheet1)','Authentication Type'



--Example-1

CREATE_MULTIPLE_LOGIN_PROC 'E:\login_list-for-sql.xls','Sheet1','SQL'; -- To Create SQL users
GO

--End of Example-1

--Example-2

CREATE_MULTIPLE_LOGIN_PROC 'E:\login_list-for-Windows.xls','Sheet1','Windows'; -- To Create Windows users
GO

--End of example-2
