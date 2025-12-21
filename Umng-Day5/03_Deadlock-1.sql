USE master;

IF EXISTS(SELECT * FROM sys.databases WHERE name = 'db01')
BEGIN
	ALTER DATABASE db01 SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE db01;
END
GO
CREATE DATABASE db01;
GO

USE db01;

CREATE TABLE dbo.Test(id int PRIMARY KEY)
GO
------------------------------------------------
BEGIN TRAN;
INSERT INTO dbo.Test(id) VALUES(1)

WAITFOR DELAY '0:0:10';

INSERT INTO dbo.Test(id) VALUES(10)
ROLLBACK TRAN;

/*
EXEC master.sys.sp_altermessage 1205, 'WITH_LOG', TRUE;
*/