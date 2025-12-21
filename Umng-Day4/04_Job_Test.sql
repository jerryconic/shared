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

DROP TABLE IF EXISTS dbo.Test;

CREATE TABLE dbo.Test
(
id int PRIMARY KEY IDENTITY(1, 1),
data nvarchar(20),
add_time datetime DEFAULT GETDATE()
);

INSERT INTO dbo.Test(data)
VALUES('Test');

SELECT * FROM dbo.Test;

TRUNCATE TABLE dbo.Test;

GO
USE [msdb]
GO
DECLARE @jobId BINARY(16)
EXEC  msdb.dbo.sp_add_job @job_name=N'TestJob', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_page=2, 
		@delete_level=0, 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'UCOM\Student', @job_id = @jobId OUTPUT
select @jobId
GO
EXEC msdb.dbo.sp_add_jobserver @job_name=N'TestJob', @server_name = N'UCOM-SQL1'
GO
EXEC msdb.dbo.sp_add_jobstep @job_name=N'TestJob', @step_name=N'Insert_Data', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_fail_action=2, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'INSERT INTO dbo.Test(data)
VALUES(''Test'');', 
		@database_name=N'db01', 
		@flags=0
GO
USE [msdb]
GO
EXEC msdb.dbo.sp_update_job @job_name=N'TestJob', 
		@enabled=1, 
		@start_step_id=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_page=2, 
		@delete_level=0, 
		@description=N'', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'UCOM\Student', 
		@notify_email_operator_name=N'', 
		@notify_page_operator_name=N''
GO
----------------------------------------------------
USE [msdb]
GO
DECLARE @schedule_id int
EXEC msdb.dbo.sp_add_jobschedule @job_id=N'a0fb564e-32c7-4851-8885-aa17df60dd65', @name=N'Every 10 Seconds', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=2, 
		@freq_subday_interval=10, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=1, 
		@active_start_date=20250323, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, @schedule_id = @schedule_id OUTPUT
select @schedule_id
GO
