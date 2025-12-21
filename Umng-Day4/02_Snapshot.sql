USE [master]
RESTORE DATABASE [AdventureWorks2022] 
FROM  DISK = N'C:\Backups\AdventureWorks2022.bak' 
WITH  FILE = 1,  
MOVE N'AdventureWorks2022' TO N'C:\SQLData\AdventureWorks2022.mdf',  
MOVE N'AdventureWorks2022_log' TO N'C:\SQLData\AdventureWorks2022_log.ldf',  
REPLACE,
NOUNLOAD,  STATS = 5

GO


-- Create the database snapshot
CREATE DATABASE AdventureWorks2022_Snapshot0935 ON
( NAME = AdventureWorks2022, FILENAME = 'C:\SQLData\AdventureWorks2022_Snapshot0935.ss' )
AS SNAPSHOT OF AdventureWorks2022;
GO

--ReadOnly
SELECT * FROM AdventureWorks2022_Snapshot0935.Person.Person;
UPDATE AdventureWorks2022_Snapshot0935.Person.Person SET FirstName = 'XXX';
--ReadOnly


SELECT * FROM AdventureWorks2022.Person.Person;
UPDATE AdventureWorks2022.Person.Person SET FirstName = 'XXX';
SELECT * FROM AdventureWorks2022.Person.Person;

SELECT * FROM AdventureWorks2022_Snapshot0935.Person.Person;


USE master;  
-- Reverting AdventureWorks to AdventureWorks_dbss1800  
RESTORE DATABASE AdventureWorks2022 from   
DATABASE_SNAPSHOT = 'AdventureWorks2022_Snapshot0935';  
GO  

DROP DATABASE AdventureWorks2022_Snapshot0935

DROP DATABASE AdventureWorks2022