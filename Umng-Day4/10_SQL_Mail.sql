EXEC msdb.dbo.sysmail_help_configure_sp;
EXEC msdb.dbo.sysmail_help_account_sp;
EXEC msdb.dbo.sysmail_help_profile_sp;
EXEC msdb.dbo.sysmail_help_profileaccount_sp;
EXEC msdb.dbo.sysmail_help_principalprofile_sp;

EXEC msdb.dbo.sp_send_dbmail  
    @profile_name = 'SQL Mail',  
    @recipients = 'dba@ucom.com',  
    @query = 'SELECT TOP(10) BusinessEntityID, FirstName
FROM AdventureWorks2022.Person.Person' ,  
    @subject = 'Person.person',  
    @attach_query_result_as_file = 1 ;  

USE AdventureWorks2022;

SELECT TOP(10) BusinessEntityID, FirstName
FROM AdventureWorks2022.Person.Person

SELECT @@VERSION;


