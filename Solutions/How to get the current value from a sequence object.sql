--Script Name: How to get the current value from a sequence object
--Script Type: Solution
--Article: https://raresql.com/2013/11/06/sql-server-2012-how-to-get-the-current-value-from-a-sequence-object/
--Developed By: Muhammad Imran
--Date Created: 6 Nov 2013
--Date Modified: 27 Dec 2022

--Method-2

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Use WHERE clause
SELECT current_value FROM sys.sequences
WHERE [name]='Seq_sample';
GO

--End of method-2
