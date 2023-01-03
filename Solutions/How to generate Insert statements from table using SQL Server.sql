--Script Name: How to generate Insert statements from table using SQL Server
--Script Type: Solution
--Article: https://raresql.com/2011/12/20/how-to-generate-insert-statements-from-table-data-using-sql-server/
--Developed By: Muhammad Imran
--Date Created: 20th December 2011
--Date Modified: 28th December 2022

--Create Sample

--Create Sample
CREATE TABLE [dbo].[Student](
       [Sno] [int] NOT NULL
   ,   [Student ID] nvarchar(6) Not NULL 
   ,   [Student name] [varchar](50) NOT NULL
   ,   [Date of Birth]  datetime not null
   ,   [Weight] [int] NULL);
GO

--Insert records into table 
Insert into dbo.[Student] values (1,'STD001','Bob','2003-12-31',70)
Insert into dbo.[Student] values (2,'STD002','Alexander','2004-11-15',80)
Insert into dbo.[Student] values (3,'STD003','Hosanna','2005-10-05',82)
Insert into dbo.[Student] values (4,'STD004','William','2006-09-03',55)
Insert into dbo.[Student] values (5,'STD005','Hulda','2007-08-01',35)
Insert into dbo.[Student] values (6,'STD006','Jacoba','2008-07-18',30);
GO

--End of Sample

--Create Procedure
--Now, you need to create this procedure to generate “insert into statement” from table data.

--Create Procedure
CREATE PROCEDURE SAMPLE_DATA_PROC
@SchemaName VARCHAR(MAX),
@TableName VARCHAR(Max),
@WhereClause NVARCHAR(Max),
@TopNo INT
AS
 
--Declare Variables
DECLARE @SQL VARCHAR(max)
DECLARE @nSQL NVARCHAR(Max)
DECLARE @RecordCount INT
DECLARE @FirstColumn NVARCHAR(Max)
 
--SET @TableName=QUOTENAME(@TableName) -- Quote the table name
SET @TableName =@SchemaName + '.' + QUOTENAME(@TableName)
Print @TableName
 
/*We need to find the record count in order to remove Union ALL from the last row*/
SET @nSQL=''
SET @nSQL= N'SELECT @RecordCount=COUNT(*) FROM ' + @TableName + (CASE WHEN ISNULL(@Whereclause,'') <>'' THEN ' Where ' + @Whereclause ELSE '' END)
Print @nSQL
EXEC sp_executesql @query = @nSQL, @params = N'@RecordCount INT OUTPUT', @RecordCount = @RecordCount OUTPUT
/*****************************************************************/
 
/*Need to check either top No of record is less than record count 
in order to remove union all from the last row */
IF @TopNo IS NOT NULL And @TopNo<@RecordCount
    BEGIN
        SET @RecordCount=@TopNo
    END
/***************************************************************/
/*** Here we need to find the first column name to generate a serial number and insert an "Insert into statement" in the first row ***/
SET @nSQL=''
SET @nSQL= N'SELECT @FirstColumn=[name] FROM sys.columns WHERE [Column_id]=1 And object_ID=object_ID('''+ @TableName + ''')'
Print @nSQL
EXEC sp_executesql @query = @nSQL, @params = N'@FirstColumn nvarchar(Max) OUTPUT', @FirstColumn = @FirstColumn OUTPUT
/**************************************************************/
 
DECLARE @FieldName VARCHAR(max) 
SET @FieldName=''
 
If (Select Count(*) FROM sys.columns WHERE object_id=object_id('' + @TableName + '') And is_identity<>0)=1
 
BEGIN
    SET @FieldName = STUFF(
    (
    SELECT ',' + QUOTENAME([Name]) FROM sys.columns WHERE object_id=object_id('' + @TableName + '') Order By [column_id] 
    FOR XML PATH('')), 1, 1, '')
    Set @FieldName ='(' + @FieldName + ')'
    Print @FieldName
    Print len(@FieldName)
END
 
/*******Create list of comma seperated columns *******/
SET @SQL= (SELECT STUFF((SELECT(CASE
WHEN system_type_id In (167,175,189) THEN + ' Cast(ISNULL(LTRIM(RTRIM(''N''''''+Replace(' + QUOTENAME([Name])+ ','''''''','''''''''''')+'''''''''+ ')),''NULL'') as varchar(max)) + '' AS ' + QUOTENAME([Name]) + ''' + '' ,'''+'+ '
WHEN system_type_id In (231,239) THEN + ' Cast(ISNULL(LTRIM(RTRIM(''N''''''+Replace(' + QUOTENAME([Name])+ ','''''''','''''''''''')+'''''''''+ ')),''NULL'') as nvarchar(max)) + '' AS ' + QUOTENAME([Name]) + ''' + '' ,'''+'+ '
WHEN system_type_id In (58,61,36) THEN + ' ISNULL(LTRIM(RTRIM(''N'''''' + Cast(' + QUOTENAME([Name])+ ' as varchar(max))+''''''''' + ')),''NULL'') + '' AS ' + QUOTENAME([Name]) + '''+ '' ,'''+' + '
WHEN system_type_id In (48,52,56,59,60,62,104,106,108,122,127) THEN + ' ISNULL(Cast(' + QUOTENAME([Name])+ ' as varchar(max)),''NULL'')+ '' AS ' + QUOTENAME([Name]) + ''' + '' ,'''+'+ '
END
)
FROM
sys.columns WHERE object_ID=object_ID(''+ @TableName + '') FOR XML PATH('')),1,1,' '))
 
/*******************************************************/
 
/* Here 500 means if the record count is 500 or top no 500 then it will generate "Insert into select ..Union All "
Because more than 500 might reduce its performance. */
IF @TopNo <500 or @RecordCount<500 
    BEGIN
        IF @TopNo IS NULL
            BEGIN
                SET @SQl='SELECT (Case When ROW_NUMBER() OVER (ORDER BY ' + QUOTENAME(@FirstColumn) + ') =1 THEN '' INSERT INTO ' + @TableName + ' ' + ' '+ @FieldName + ' ''' + ' ELSE '''' END) + ''SELECT ''+' + Left(@SQL,Len(@SQL)-8) + ' + (CASE WHEN ROW_NUMBER() OVER (ORDER BY ' + QUOTENAME(@FirstColumn) + ') <>' + CONVERT(VARCHAR(10),@RecordCount) + ' THEN '' UNION ALL'' ELSE '''' END) AS [DATA] ' + ' FROM ' + @TableName +(CASE WHEN ISNULL(@Whereclause,'') <>'' THEN ' WHERE ' + @Whereclause ELSE '' END)
            END
    ELSE
            BEGIN
                SET @SQl= 'SELECT TOP ' + CONVERT(VARCHAR(10),@TopNo) + ' (CASE WHEN ROW_NUMBER() OVER (ORDER BY ' + QUOTENAME(@FirstColumn) + ') =1 THEN '' INSERT INTO ' + @TableName + ' ' + ' '+ @FieldName + '''' + ' ELSE '''' END) + ''SELECT ''+' + LEFT(@SQL,LEN(@SQL)-8) + ' + (CASE WHEN ROW_NUMBER() OVER (ORDER BY ' + QUOTENAME(@FirstColumn) + ') <>' + CONVERT(VARCHAR(10),@RecordCount) + ' THEN '' Union All'' ELSE '''' END) AS [DATA]' + ' FROM ' + @TableName + (CASE WHEN ISNULL(@Whereclause,'') <>'' THEN ' WHERE ' + @Whereclause ELSE '' END)
            END
    END
ELSE
--- Greator then 500 will generate "insert into select *" ... for each record.
    BEGIN
        IF @TopNo IS NULL
            BEGIN
                  SET @SQl='SELECT '' INSERT INTO ' + @TableName + ' ' + ' '+ @FieldName + ' '' + ''SELECT ''+' + Left(@SQL,Len(@SQL)-8) + ' AS [DATA] ' + ' FROM ' + @TableName +(CASE WHEN ISNULL(@Whereclause,'') <>'' THEN ' WHERE ' + @Whereclause ELSE '' END)
            END
    ELSE
            BEGIN
                  SET @SQl='SELECT TOP ' + CONVERT(VARCHAR(10),@TopNo) + ''' INSERT INTO ' + @TableName + ' ' + ' '+ @FieldName + ' '' + ''SELECT ''+' + Left(@SQL,Len(@SQL)-8) + ' AS [DATA] ' + ' FROM ' + @TableName +(CASE WHEN ISNULL(@Whereclause,'') <>'' THEN ' WHERE ' + @Whereclause ELSE '' END)
            END
    END
EXEC (@SQL)
GO

--End of Procedure

--Methods

--Method 1 : When you need to generate "insert into statement" from all records within a table.

SAMPLE_DATA_PROC 'dbo','Student',NULL,NULL;
GO

--End of Method-1

--Method 2 : When you need to generate "insert into statement" from top 5 records within a table.

SAMPLE_DATA_PROC 'dbo','Student',NULL,3;
GO

--End of Method-2

--Method 3 : When you need to generate "insert into statement" with a specific filter (Single filter) within a table.

SAMPLE_DATA_PROC 'dbo','Student','[SNO]=1',NULL;
GO

--End of Method-3

--Method 4 : When you need to generate "insert into statement" with a specific filter (Multiple filters) within a table.

SAMPLE_DATA_PROC 'dbo','Student','[SNO]=1  And [Student Name]=''Bob''',NULL;
GO

--End of Method-4

--End of Method

--Example-1
--Using the above methods

--Insert records into table   
SELECT 1 AS [Sno] ,N'STD001' AS [Student ID] ,N'Bob' AS [Student name] ,N'Dec 31 2003 12:00AM' AS [Date of Birth] ,70 AS [Weight] UNION ALL
SELECT 2 AS [Sno] ,N'STD002' AS [Student ID] ,N'Alexander' AS [Student name] ,N'Nov 15 2004 12:00AM' AS [Date of Birth] ,80 AS [Weight] UNION ALL
SELECT 3 AS [Sno] ,N'STD003' AS [Student ID] ,N'Hosanna' AS [Student name] ,N'Oct  5 2005 12:00AM' AS [Date of Birth] ,82 AS [Weight] UNION ALL
SELECT 4 AS [Sno] ,N'STD004' AS [Student ID] ,N'William' AS [Student name] ,N'Sep  3 2006 12:00AM' AS [Date of Birth] ,55 AS [Weight] UNION ALL
SELECT 5 AS [Sno] ,N'STD005' AS [Student ID] ,N'Hulda' AS [Student name] ,N'Aug  1 2007 12:00AM' AS [Date of Birth] ,35 AS [Weight] UNION ALL
SELECT 6 AS [Sno] ,N'STD006' AS [Student ID] ,N'Jacoba' AS [Student name] ,N'Jul 18 2008 12:00AM' AS [Date of Birth] ,30 AS [Weight]

--End of Example-1

