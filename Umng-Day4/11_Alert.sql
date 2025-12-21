USE [msdb]
GO
EXEC msdb.dbo.sp_add_operator @name=N'dba', 
		@enabled=1, 
		@pager_days=0, 
		@email_address=N'dba@ucom.com'
GO
USE [msdb]
GO
EXEC msdb.dbo.sp_add_alert @name=N'File Too Big', 
		@message_id=1105, 
		@severity=0, 
		@enabled=1, 
		@delay_between_responses=0, 
		@include_event_description_in=1, 
		@database_name=N'db01', 
		@notification_message=N'File Too Big', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'File Too Big', @operator_name=N'dba', @notification_method = 1
GO
