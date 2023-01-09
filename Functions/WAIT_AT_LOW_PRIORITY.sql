--Script Name: WAIT_AT_LOW_PRIORITY
--Script Type: Function
--Article: https://raresql.com/2013/07/07/sql-server-hekaton-wait_at_low_priority/
--Developed By: Muhammad Imran
--Date Created: 7 July 2013
--Date Modified: 7 Jan 2023

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
ALTER INDEX ALL ON Production.Product
REBUILD WITH (FILLFACTOR = 80, SORT_IN_TEMPDB = ON,
              STATISTICS_NORECOMPUTE = ON);
			  
--WAIT_AT_LOW_PRIORITY

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
ALTER INDEX ALL ON Production.Product
REBUILD WITH
(
    FILLFACTOR = 80,
    SORT_IN_TEMPDB = ON,
    STATISTICS_NORECOMPUTE = ON,
    ONLINE = ON ( WAIT_AT_LOW_PRIORITY
   ( MAX_DURATION = 4 MINUTES, ABORT_AFTER_WAIT = BLOCKERS ) ),
    DATA_COMPRESSION = ROW
)
;

--ABORT_AFTER_WAIT

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
ALTER INDEX ALL ON Production.Product
REBUILD WITH
(
    FILLFACTOR = 80,
    SORT_IN_TEMPDB = ON,
    STATISTICS_NORECOMPUTE = ON,
    ONLINE = ON ( WAIT_AT_LOW_PRIORITY
   ( MAX_DURATION = 0 MINUTES, ABORT_AFTER_WAIT = NONE ) ),
    DATA_COMPRESSION = ROW
)
;

--Self

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
ALTER INDEX ALL ON Production.Product
REBUILD WITH
(
    FILLFACTOR = 80,
    SORT_IN_TEMPDB = ON,
    STATISTICS_NORECOMPUTE = ON,
    ONLINE = ON ( WAIT_AT_LOW_PRIORITY
    ( MAX_DURATION = 4 MINUTES, ABORT_AFTER_WAIT = SELF) ),
    DATA_COMPRESSION = ROW
)
;

--BLOCKERS

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
ALTER INDEX ALL ON Production.Product
REBUILD WITH
(
    FILLFACTOR = 80,
    SORT_IN_TEMPDB = ON,
    STATISTICS_NORECOMPUTE = ON,
    ONLINE = ON ( WAIT_AT_LOW_PRIORITY
   ( MAX_DURATION = 4 MINUTES, ABORT_AFTER_WAIT = BLOCKERS) ),
    DATA_COMPRESSION = ROW
)
;
