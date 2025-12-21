-- Module 9 - Demo 1

-- Task 1
SELECT * FROM AdminDB.dbo.IdentityLog;
GO


-- Task 2
USE AdminDB;
GO
EXEC [dbo].[RecordIdentity]
GO
SELECT * FROM AdminDB.dbo.IdentityLog;

--Agent=> Jobs => [Record Execution Identity] => Start Job at Step

SELECT * FROM AdminDB.dbo.IdentityLog;

--Change Job Owner => ITSupportLogin
USE [msdb]
GO
EXEC msdb.dbo.sp_update_job @job_id=N'68813b82-0d0b-417f-8a6b-05628348e96c', 
		@owner_login_name=N'ITSupportLogin'
GO

--Agent=> Jobs => [Record Execution Identity] => Start Job at Step
-->Error: View History
USE AdminDB
GRANT EXECUTE ON dbo.RecordIdentity TO ITSupport;
GO

--Agent=> Jobs => [Record Execution Identity] => Start Job at Step
--View History


SELECT * FROM AdminDB.dbo.IdentityLog;
