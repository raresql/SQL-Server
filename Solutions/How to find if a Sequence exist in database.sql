--Script Name: How to find if a Sequence exist in database
--Script Type: Solution
--Article: https://raresql.com/2013/10/26/sql-server-2012-how-to-find-if-a-sequence-exist-in-database/
--Developed By: Muhammad Imran
--Date Created: 26 Oct 2013
--Date Modified: 27 Dec 2022

--Method-1

--This script is compatible with SQL Server 2012 and above.
--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Do not forget to change you sequence object name
--in the below query.

SELECT * FROM sys.sequences
WHERE object_id=object_id('Seq_sample')
GO

--End of method-1

--Method-2

--This script is compatible with SQL Server 2012 and above.
--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Do not forget to change you sequence object name
--in the below query.
SELECT * FROM sys.objects
WHERE object_id=object_id('Seq_sample')
AND [TYPE]='SO'

--End of method-2
