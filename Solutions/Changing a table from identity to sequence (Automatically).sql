--Script Name: Changing a table from identity to sequence (Automatically)
--Script Type: Solution
--Article: https://raresql.com/2013/02/16/sql-server-2012-changing-a-table-from-identity-to-sequence-automatically/
--Developed By: Muhammad Imran
--Date Created: 16 Feb 2013
--Date Modified: 5 Jan 2023

--Sample

--Create table
Create table dbo.[Student]
(
[StudentID] int identity(1,1),
[StudentName] varchar(50)
CONSTRAINT PK_Student_StudentID PRIMARY KEY CLUSTERED
([StudentID] ASC)
)
GO

--Insert records into table
Insert into dbo.Student values ('Imran'),('Bob'),('Sandra')
GO

--Browse table
Select * from dbo.Student

--End of sample

--Create procedure
CREATE PROCEDURE Convert_Identity_To_Sequence_Proc
@Scheme_And_TableName nvarchar(Max)
AS
 
DECLARE @SQL AS NVARCHAR(MAX)
DECLARE @OBJECTID AS BIGINT
DECLARE @IDENTITY_COLUMN_NAME AS NVARCHAR(MAX)
DECLARE @DATA_TYPE_NAME AS SYSNAME
DECLARE @CONSTRAINT_NAME AS NVARCHAR(MAX)
DECLARE @Max_identity_ID AS BIGINT
DECLARE @ParmDefinition AS NVARCHAR(MAX)
DECLARE @TABLE_NAME AS NVARCHAR(MAX)
 
--Pick up object ID of the table
SELECT @OBJECTID=OBJECT_ID(@Scheme_And_TableName)
--Seperate Table name from the schema
SET @TABLE_NAME =SUBSTRING(@Scheme_And_TableName,CHARINDEX('.',@Scheme_And_TableName)+1,LEN(@Scheme_And_TableName))
Print @TABLE_NAME
 
--Check if the table has an identity table
If (Select Count(*) from sys.identity_columns where object_id =@OBJECTID)=0
BEGIN
RAISERROR('Could not found the identity column in this table',16,1)
RETURN
END
Print @OBJECTID
 
-- Pick identity column name , contraint name and data type name from the table.
SELECT @IDENTITY_COLUMN_NAME=A.name,@CONSTRAINT_NAME=B.name, @DATA_TYPE_NAME=D.name FROM sys.columns A
INNER JOIN sys.types D ON A.system_type_id =D.system_type_id
LEFT JOIN sys.indexes B ON A.object_id =B.object_id
LEFT JOIN sys.index_columns C ON B.object_id =C.object_id
AND B.index_id =C.index_id
AND A.column_id =C.column_id
WHERE A.is_identity =1 And A.object_id =@OBJECTID
 
Print @IDENTITY_COLUMN_NAME
Print @CONSTRAINT_NAME
Print @DATA_TYPE_NAME
 
-- Add a new column in the table that does not have the IDENTITY property with the same data type
SET @SQL ='ALTER TABLE ' + @Scheme_And_TableName +' ADD ' +@IDENTITY_COLUMN_NAME + 'New ' + @DATA_TYPE_NAME + ' NULL'
Print @SQL
EXEC (@SQL)
 
-- Copy values from the old column and update into the new column
SET @SQL ='UPDATE ' + @Scheme_And_TableName +' SET ' + @IDENTITY_COLUMN_NAME + 'New' + ' =' + @IDENTITY_COLUMN_NAME
Print @SQL
EXEC (@SQL)
 
-- Drop the primary key constraint from the old identity column
SET @SQL ='ALTER TABLE ' + @Scheme_And_TableName + ' DROP CONSTRAINT ' + @CONSTRAINT_NAME
Print @SQL
EXEC (@SQL)
 
-- Drop the old identity column
SET @SQL =' ALTER TABLE ' + @Scheme_And_TableName + ' DROP COLUMN ' + @IDENTITY_COLUMN_NAME
Print @SQL
EXEC (@SQL)
 
-- Rename the new column to the old columns name
SET @SQL ='EXEC sp_rename ' + ''''+ @Scheme_And_TableName + '.'+ @IDENTITY_COLUMN_NAME+'New' + '''' + ',' + ''''+ @IDENTITY_COLUMN_NAME + '''' + ',' + '''COLUMN'''
Print @SQL
EXEC (@SQL)
 
-- Change the new column to NOT NULL
SET @SQL ='ALTER TABLE ' + @Scheme_And_TableName + ' ALTER COLUMN ' + @IDENTITY_COLUMN_NAME + ' ' + @DATA_TYPE_NAME + +' NOT NULL'
Print @SQL
EXEC (@SQL)
 
-- Add the unique primary key constraint again with the same name
IF @CONSTRAINT_NAME IS NOT NULL
BEGIN
SET @SQL ='ALTER TABLE ' + @Scheme_And_TableName + ' ADD CONSTRAINT ' + @CONSTRAINT_NAME +' PRIMARY KEY CLUSTERED (' + @IDENTITY_COLUMN_NAME +' ASC)'
Print @SQL
EXEC (@SQL)
END
ELSE
BEGIN
PRINT 'NO CONSTRAINT'
END
-- Get the highest current value from the column
-- to use it for sequence creation.
SET @SQL ='SELECT @Max_ID=MAX(' + @IDENTITY_COLUMN_NAME + ') FROM ' + @Scheme_And_TableName
SET @ParmDefinition = N'@Max_ID ' + @DATA_TYPE_NAME + ' OUTPUT'
Print @SQL
Print @ParmDefinition
EXECUTE sp_executesql @SQL, @ParmDefinition,@Max_ID=@Max_identity_ID OUTPUT;
Print @Max_identity_ID
 
-- Use the next Identity value as the START WITH VALUE;
SET @SQL ='CREATE SEQUENCE ' + @Scheme_And_TableName + 'Seq' +
' AS ' + @DATA_TYPE_NAME +
' START WITH ' + try_Convert(varchar(max),@Max_identity_ID+1) +
' INCREMENT BY 1 ' ;
Print @SQL
EXEC (@SQL)
 
-- Add a default value of sequence to the column
SET @SQL ='ALTER TABLE ' + @Scheme_And_TableName + ' ADD CONSTRAINT Def' + @TABLE_NAME + ' DEFAULT (NEXT VALUE FOR ' + @Scheme_And_TableName + 'Seq)
FOR ' + @IDENTITY_COLUMN_NAME;
Print @SQL
EXEC (@SQL)
 
GO
--Execute the stored procedure and provide schema and table name as a parameter.
EXEC Convert_Identity_To_Sequence_Proc 'dbo.Student'

--Insert records into table
Insert into Student (StudentName) Values ('Mark')
Insert into Student (StudentName) Values ('Peter')
Select * from dbo.Student
