--Script Name: Audit Enhancements – Part II
--Script Type: Audit
--Article: https://raresql.com/2013/06/20/sql-server-2012-audit-enhancements-part-ii/https://raresql.com/2013/07/07/sql-server-hekaton-wait_at_low_priority/
--Developed By: Muhammad Imran
--Date Created: 20 Jun 2013
--Date Modified: 12 Jan 2023

--Step-1
--Use Transact-SQL

--Use database master
USE [master]
GO
 
--Create audit
CREATE SERVER AUDIT [Audit_Sample]
TO FILE
( FILEPATH = N'C:\Audit\'
)

--Alter audit 
ALTER SERVER AUDIT [Audit_Sample] WITH (STATE = ON)
GO

--End of step-1

--Step-2
--Use Transact-SQL

--Use database AdventureWorks2012
USE [AdventureWorks2012]
GO
 
--Create database
CREATE DATABASE AUDIT SPECIFICATION [FilterFor_HumanResource_Data]
FOR SERVER AUDIT [Audit_Sample]
ADD (SELECT ON SCHEMA::[HumanResources] BY [public])
WITH (STATE = ON)
GO

--End of step-2

--Step-3
--Use Transact-SQL

--Use database AdventureWorks2012
USE [AdventureWorks2012]
GO

--Browse table
SELECT * FROM HumanResources.Department
GO

--End of step-3

--Step-4
--Use Transact-SQL

--Use database AdventureWorks2012
USE [AdventureWorks2012]
GO

--Browse table
SELECT * FROM fn_get_audit_file
('C:\Audit\Audit_Sample_*.sqlaudit',default,default);
GO

--End of step-4
