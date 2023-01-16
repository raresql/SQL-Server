--Script Name: Row Level Security (RLS)
--Script Type: Security
--Article: https://raresql.com/2015/06/20/sql-server-2016-row-level-security-rls/
--Developed By: Muhammad Imran
--Date Created: 20 Jun 2015
--Date Modified: 7 Jan 2023

--Sample

--Create database
CREATE DATABASE Sample_DB
GO

--Use database Sample_DB
USE Sample_DB
GO

--CREATE table
CREATE TABLE tbl_Sample
(
[ID] int,
[Name] varchar(50),
[BranchName] varchar(50)
)
GO

--Insert records into table
INSERT INTO tbl_Sample VALUES (1,'Ken','Branch A')
INSERT INTO tbl_Sample VALUES (2,'Selena','Branch A')
INSERT INTO tbl_Sample VALUES (3,'Mae','Branch B')
INSERT INTO tbl_Sample VALUES (4,'Tom','Branch B')
INSERT INTO tbl_Sample VALUES (5,'Thomas','Branch B')
GO

--Browse table
SELECT * FROM tbl_Sample
GO

--End of sample

--Solution

--Step-1

--Use database Sample_DB
USE Sample_DB
GO
EXEC sp_addrole 'Branch A Admin'
GO
EXEC sp_addrole 'Branch B Admin'
GO

--End of step-1

--Step-2
--Use database Sample_DB
USE Sample_DB
GO
CREATE USER USER_A WITHOUT LOGIN; -- Branch A Admin
GO
CREATE USER USER_B WITHOUT LOGIN; -- Branch B Admin
GO

--End of step-2

--Step-3

--Use database Sample_DB
USE Sample_DB
GO
EXEC sp_addrolemember 'Branch A Admin', 'USER_A'
GO
EXEC sp_addrolemember 'Branch B Admin', 'USER_B'
GO

--End of step-3

--Step-4

--Use database Sample_DB
USE Sample_DB
GO
GRANT SELECT ON tbl_Sample TO USER_A;
GO
GRANT SELECT ON tbl_Sample TO USER_B;
GO

--End of step-4

--Step-5

--Use database Sample_DB
USE Sample_DB
GO
SELECT role_principal_id,
USER_NAME(role_principal_id) As [Role],
member_principal_id,
USER_NAME(member_principal_id) As [Member]
FROM sys.database_role_members
WHERE USER_NAME(role_principal_id)
IN ('Branch A Admin','Branch B Admin')
GO

--End of step-5

--Step-6

--Use database Sample_DB
USE Sample_DB
GO
DROP TABLE dbo.tbl_user
GO

--Create table
CREATE TABLE dbo.tbl_user
(
[ID] int,
[Name] varchar(50),
[BranchName] varchar(50),
[DatabasePrincipalID] int
)
GO

--Insert records into table
INSERT INTO dbo.tbl_user VALUES (1,'USER A','Branch A',7)
INSERT INTO dbo.tbl_user VALUES (2,'USER B','Branch B',8)
GO
 
--Browse table
SELECT * FROM dbo.tbl_user
GO

--End of step-6

--Step-7

--Use database Sample_DB
USE Sample_DB
GO

--Create schema
CREATE SCHEMA Security;
GO

--End of step-7


--Step-8

--Use database Sample_DB
USE Sample_DB
GO
--DROP FUNCTION [Security].fn_securitypredicate
--GO

--Create function
CREATE FUNCTION [Security].fn_securitypredicate(@BranchName varchar(50))
RETURNS TABLE
WITH SCHEMABINDING
AS
RETURN SELECT 1 AS fn_securitypredicate_result
FROM dbo.tbl_user a Where  (a.DatabasePrincipalID = DATABASE_PRINCIPAL_ID()
And a.BranchName = @BranchName) OR IS_MEMBER('db_owner')=1
GO

--End of step-8


--Step-9

--Use database Sample_DB
USE Sample_DB
GO

--DROP SECURITY POLICY [Security].[BranchSecurityPolicy]
--GO

--Create security policy
CREATE SECURITY POLICY [Security].[BranchSecurityPolicy]
ADD FILTER PREDICATE [Security].fn_securitypredicate([BranchName])
ON [dbo].[tbl_Sample]
WITH (STATE= ON);
GO

--End of step-9


--Step-10

--Use database Sample_DB
USE Sample_DB
GO

--USER_A can view only Branch A data
EXECUTE('Select * from tbl_Sample;') AS USER ='USER_A'
GO

USE Sample_DB
GO

--USER_B can view only Branch B data
EXECUTE('Select * from tbl_Sample;') AS USER ='USER_B'
GO


USE Sample_DB
GO

--Admin can view Entire Table
EXECUTE('Select * from tbl_Sample;') AS USER ='Admin'
GO

--End of step-10


--End of solution
