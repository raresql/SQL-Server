--Script Name: Error Handling – Using THROW
--Script Type: Error
--Article: https://raresql.com/2012/07/03/sql-server-2012-error-handling-using-throw/
--Developed By: Muhammad Imran
--Date Created: 3 July 2012
--Date Modified: 30 Dec 2022


--Error HANDLING in SQL Server 2005/2008

--Use TRY() function
BEGIN TRY
    DECLARE @VALUE INT
    SET @VALUE = 1 / 0
END TRY

--Use CATCH() function
BEGIN CATCH
    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;
 
    Print ERROR_NUMBER() --Actuall Error Number
    Print ERROR_LINE()   --Actuall ErrorLine
 
    SELECT
        @ErrorMessage = ERROR_MESSAGE(),
        @ErrorSeverity = ERROR_SEVERITY(),
        @ErrorState = ERROR_STATE();
--Use RAISERROR()
    RAISERROR (@ErrorMessage, -- Message.
               @ErrorSeverity, -- Severity.
               @ErrorState -- State.
               );
END CATCH;

--End of error handling in SQL Server 2005/2008

--Error HANDLING in SQL Server 2012

--Use TRY() function
BEGIN TRY
DECLARE @VALUE INT
SET @VALUE = 1 / 0
END TRY

--Use CATCH() function
BEGIN CATCH
        THROW
END CATCH;

--End of error handling in SQL Server 2012
