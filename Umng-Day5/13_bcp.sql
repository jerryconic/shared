USE AdventureWorks2022;

/*
EXEC sp_configure;

EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;
EXEC sp_configure 'xp_cmdshell', 1;
RECONFIGURE;
*/
EXEC xp_cmdshell 'dir';

EXEC xp_cmdshell 'bcp AdventureWorks2022.Person.PersonPhone out "C:\Temp\phone.txt" -c -t -T'

EXEC xp_cmdshell 'bcp AdventureWorks2022.Person.PersonPhone format nul -T -n -f "C:\Temp\phone.fmt"'


DROP TABLE IF EXISTS db01.dbo.PersonPhone

SELECT *
INTO db01.dbo.PersonPhone
FROM Person.PersonPhone
WHERE 1<>1;

EXEC xp_cmdshell 'bcp db01.dbo.PersonPhone in "C:\Temp\phone.txt" -f "C:\Temp\phone.fmt" -T -c -t'

SELECT * FROM db01.dbo.PersonPhone;

EXEC xp_cmdshell 'bcp "SELECT BusinessEntityID, FirstName, LastName FROM AdventureWorks2022.Person.Person" queryout "C:\Temp\query.txt" -c -t -T'
