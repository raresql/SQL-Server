--Script Name: List of all sequences available in the Database
--Script Type: Solution
--Article: https://raresql.com/2012/10/24/sql-server-2012-list-of-all-sequences-available-in-the-database/
--Developed By: Muhammad Imran
--Date Created: 24 Oct 2012
--Date Modified: 7 Jan 2023

--Script
SELECT
seq.name AS [Sequence Name],
seq.object_id AS [Object ID],
seq.create_date AS [Creation Date],
seq.modify_date AS [Last Modified Date],
SCHEMA_NAME(seq.schema_id) AS [Schema],
CAST(seq.precision AS int) AS [Numeric Precision],
CAST(seq.scale AS int) AS [Numeric Scale],
ISNULL(seq.start_value,N'''') AS [Start Value],
ISNULL(seq.increment,N'''') AS [Increment Value],
ISNULL(seq.minimum_value,N'''') AS [Min Value],
ISNULL(seq.maximum_value,N'''') AS [Max Value],
CAST(seq.is_cycling AS bit) AS [Is Cycle Enabled],
ISNULL(seq.cache_size,0) AS [Cache Size],
ISNULL(seq.current_value,N'''') AS [Current Value]
FROM
sys.sequences AS seq

--End of script
