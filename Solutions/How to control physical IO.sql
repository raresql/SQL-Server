--Script Name: How to control physical IO
--Script Type: Solution
--Article: https://raresql.com/2015/08/29/sql-server-resource-governor-how-to-control-physical-io/
--Developed By: Muhammad Imran
--Date Created: 29 Aug 2015
--Date Modified: 10 Jan 2023

--Solution

--Step-1
--Use database master
USE master 
 GO
--DROP RESOURCE POOL Sample_Pool_Restrict_IO;
--GO

--Create function
CREATE RESOURCE POOL Sample_Pool_Restrict_IO WITH
(
       MAX_IOPS_PER_VOLUME = 50,
       MIN_IOPS_PER_VOLUME = 1
);
GO

-End of step-1

--Step-2

--Use database master
USE master 
GO
--DROP WORKLOAD GROUP Sample_Workload_Group_Restrict_IO
--GO

CREATE WORKLOAD GROUP Sample_Workload_Group_Restrict_IO 
USING Sample_Pool_Restrict_IO;
GO

--End of step-2

--Step-3

--Use database master
USE master
GO
CREATE LOGIN dba WITH PASSWORD = 'imran.1234@';
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [dba]
GO

--End of step-3


--Step-4

--Use database master
USE MASTER;
GO
--DROP FUNCTION dbo.fnIOClassifier
GO

--Create function
CREATE FUNCTION dbo.fnIOClassifier()
RETURNS SYSNAME WITH SCHEMABINDING
AS
BEGIN
       DECLARE @GroupName SYSNAME
          IF SUSER_NAME() = 'dba'
            BEGIN
              SET @GroupName = 'Sample_Workload_Group_Restrict_IO'
           END
       ELSE
       BEGIN
              SET @GroupName = 'default'
       END
       RETURN @GroupName;
END
GO
--End of step-4


--Step-5

--Use database master
USE master; 
GO
ALTER RESOURCE GOVERNOR WITH (CLASSIFIER_FUNCTION = dbo.fnIOClassifier);
ALTER RESOURCE GOVERNOR RECONFIGURE;
GO

--End of step-5


--Step-6

--No query

--End of step-6


--Step-7

--Use database AdventureWorks2014
USE AdventureWorks2014
GO

DBCC DROPCLEANBUFFERS
GO
EXEC sp_MSforeachtable 'SELECT * FROM ?'
GO
--End of step-7

--Step-8

--Use database AdventureWorks2014
USE AdventureWorks2014
GO
DBCC DROPCLEANBUFFERS
GO
EXEC sp_MSforeachtable 'SELECT * FROM ?'
GO

--End of step-8
--End of solution

