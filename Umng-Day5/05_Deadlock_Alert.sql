USE [msdb]
GO

/****** Object:  Alert [Deadlock Alert]    Script Date: 3/29/2025 11:51:45 AM ******/
EXEC msdb.dbo.sp_add_alert @name=N'Deadlock Alert', 
		@message_id=1205, 
		@severity=0, 
		@enabled=1, 
		@delay_between_responses=0, 
		@include_event_description_in=1, 
		@notification_message=N'Deadlock Encountered!!!', 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO


EXEC master.sys.sp_altermessage 1205, 'WITH_LOG', TRUE;
