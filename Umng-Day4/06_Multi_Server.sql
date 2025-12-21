--Create db01
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

--Create Table dbo.Test
CREATE TABLE dbo.Test
(
id int PRIMARY KEY IDENTITY(1, 1),
data nvarchar(50),
add_time datetime DEFAULT GETDATE()
);

--Insert Data
INSERT INTO dbo.Test(data)
VALUES('aaa'), ('bbb'), ('ccc'), ('ddd');

INSERT INTO dbo.Test(data)
VALUES('Test')
--Select Data
SELECT * FROm dbo.Test;

--Delete Data
TRUNCATE TABLE dbo.Test;


