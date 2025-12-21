SELECT 1;
SELECT 2;
SELECT 3/0;
SELECT 4;
SELECT 5;


SELECT * FROM sys.syslanguages
SET LANGUAGE N'Traditional Chinese';
SET LANGUAGE N'English';

SELECT * FROM sys.messages
WHERE message_id = 8134

USE master;

IF EXISTS(SELECT * FROM sys.databases WHERE name = 'db01')
BEGIN
	ALTER DATABASE db01 SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE db01;
END
GO
CREATE DATABASE [db01]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db01', FILENAME = N'C:\SQLData\db01.mdf' , SIZE = 8192KB , FILEGROWTH = 0)
 LOG ON 
( NAME = N'db01_log', FILENAME = N'C:\SQLData\db01_log.ldf' , SIZE = 8192KB , FILEGROWTH = 65536KB )
GO
USE db01;

CREATE TABLE dbo.BigOrder
(id int IDENTITY(1, 1),
big_data nchar(4000)
);
GO

INSERT INTO dbo.BigOrder DEFAULT VALUES;
GO 576

INSERT INTO dbo.BigOrder DEFAULT VALUES;

GO

SELECT * FROM sys.messages
WHERE message_id = 8134

SELECT * FROM sys.messages
WHERE message_id = 1105


EXEC sp_cycle_errorlog


EXEC master.sys.sp_altermessage 8134, 'WITH_LOG', TRUE;

EXEC master.sys.sp_altermessage 8134, 'WITH_LOG', FALSE;
/*

EXEC master.sys.sp_altermessage 1205, 'WITH_LOG', TRUE;
GO
EXEC master.sys.sp_altermessage 3928, 'WITH_LOG', TRUE;
GO
*/