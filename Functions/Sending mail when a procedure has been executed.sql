--Script Name: Sending mail when a procedure has been executed
--Script Type: Solution
--Article: https://raresql.com/2014/06/28/sql-server-sending-mail-when-a-procedure-has-been-executed/
--Developed By: Muhammad Imran
--Date Created: 28 Jun 2014
--Date Modified: 5 Jan 2023

--Sample

--This script is compatible with SQL Server 2005 and above.
USE tempdb
GO
DROP TABLE tbl_sample
GO
--Create Sample table
CREATE TABLE tbl_sample
(
 [ID] INT IDENTITY(1,1),
 [Name] varchar(10)
)
GO

--End of sample 
--DROP PROCEDURE usp_test
--GO
--Create sample stored procedure
CREATE PROCEDURE usp_test
AS
BEGIN TRANSACTION;
BEGIN TRY
    DECLARE @int INT
    SET @int = 1
    WHILE (@int <=400000)
    BEGIN
        INSERT INTO tbl_sample VALUES ('Test')
        SET @int = @int + 1
    END
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
     BEGIN
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;
 
        SET @ErrorMessage = 'Dear Admin,<BR><BR>Due to some error
        , your procedure ''usp_test'' at Server ' + @@Servername +
        ' has been rollback.<BR>'
        + 'Given below is the error message.
        <BR><BR> ErrorMessage : ' +  ERROR_MESSAGE()
 
        ROLLBACK TRANSACTION;
        EXEC msdb.dbo.sp_send_dbmail @profile_name='My Profile',
        @recipients='admin@raresql.com',
        @subject='Procedure Failed & Rollback',
        @body= @ErrorMessage,
        @body_format = 'HTML',
        @execute_query_database = 'tempdb'
     END
END CATCH;
 
IF @@TRANCOUNT > 0
  BEGIN
        COMMIT TRANSACTION;
        EXEC msdb.dbo.sp_send_dbmail @profile_name='My Profile',
        @recipients='admin@raresql.com',
        @subject='Procedure Executed Successfully',
        @execute_query_database = 'tempdb'
  END
GO
 
--Execute the Stored Procedure
EXEC usp_test
GO
