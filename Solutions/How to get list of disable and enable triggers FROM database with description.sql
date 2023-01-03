--Script Name: How to get list of disable and enable triggers FROM database with description
--Script Type: Solution
--Article: https://raresql.com/2012/10/11/sql-server-how-to-get-list-of-disable-and-enable-triggers-From-database-with-description/
--Developed By: Muhammad Imran
--Date Created: 11th October 2012
--Date Modified: 28th Dec 2022

--Script

--Create Procedure
Create PROCEDURE [Get_All_Details_Of_Trigger]
AS
Select A.[name] AS [Table Name]
,B.[name] AS [Trigger Name]
,(CASE WHEN OBJECTPROPERTY(B.[object_id], 'ExecIsTriggerDisabled') =1 
THEN 'DISABLED' ELSE 'ENABLED' end) AS [Trigger Status]
 
,(CASE WHEN OBJECTPROPERTY(B.[object_id], 'ExecIsInsertTrigger') =1 
THEN 'No' ELSE 'Yes' end) AS [IsInsertTrigger]
 
,(CASE WHEN OBJECTPROPERTY(B.[object_id], 'ExecIsFirstInsertTrigger') =1 
THEN 'No' ELSE 'Yes' end) AS [IsFirstInsertTrigger]
 
,(CASE WHEN OBJECTPROPERTY(B.[object_id], 'ExecIsLAStInsertTrigger') =1 
THEN 'No' ELSE 'Yes' end) AS [IsLAStInsertTrigger]
 
,(CASE WHEN OBJECTPROPERTY(B.[object_id], 'ExecIsDeleteTrigger') =1 
THEN 'No' ELSE 'Yes' end) AS [IsDeleteTrigger]
 
,(CASE WHEN OBJECTPROPERTY(B.[object_id], 'ExecIsFirstDeleteTrigger') =1 
THEN 'No' ELSE 'Yes' end) AS [IsFirstDeleteTrigger]
 
,(CASE WHEN OBJECTPROPERTY(B.[object_id], 'ExecIsLAStDeleteTrigger') =1 
THEN 'No' ELSE 'Yes' end) AS [IsLAStDeleteTrigger]
 
,(CASE WHEN OBJECTPROPERTY(B.[object_id], 'ExecIsUpdateTrigger') =1 
THEN 'No' ELSE 'Yes' end) AS [IsUpdateTrigger]
 
,(CASE WHEN OBJECTPROPERTY(B.[object_id], 'ExecIsFirstUpdateTrigger') =1 
THEN 'No' ELSE 'Yes' end) AS [IsFirstUpdateTrigger]
 
,(CASE WHEN OBJECTPROPERTY(B.[object_id], 'ExecIsLAStUpdateTrigger') =1 
THEN 'No' ELSE 'Yes' end) AS [IsLAStUpdateTrigger]
 
,(CASE WHEN OBJECTPROPERTY(B.[object_id], 'ExecIsAfterTrigger') =1 
THEN 'No' ELSE 'Yes' end) AS [IsAfterTrigger]
 
,(CASE WHEN OBJECTPROPERTY(B.[object_id], 'ExecIsInsteadOfTrigger') =1 
THEN 'No' ELSE 'Yes' end) AS [IsInsteadOfTrigger]
 
,(CASE WHEN OBJECTPROPERTY(B.[object_id], 'ExecIsTriggerNotForRepl') =1 
THEN 'No' ELSE 'Yes' end) AS [IsTriggerNotForReplication]
 
FROM sys.tables A 
INNER JOIN sys.triggers B 
On A.[object_id]=B.[parent_id]
GO

--End of Procedure

--Execute Procedure
EXEC [Get_All_Details_Of_Trigger]


--End of Script
