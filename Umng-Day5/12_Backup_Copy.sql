BACKUP DATABASE db01 
TO DISK='C:\Backups\db01_copy.bak'
WITH COPY_ONLY, INIT, FORMAT;

RESTORE DATABASE db01_copy
FROM DISK='C:\Backups\db01_copy.bak'

RESTORE FILELISTONLY
FROM DISK='C:\Backups\db01_copy.bak'

RESTORE DATABASE db01_copy
FROM DISK='C:\Backups\db01_copy.bak'
WITH MOVE 'db01' TO 'C:\SQLData\db01_copy.mdf',
MOVE 'db01_log' TO 'C:\SQLData\db01_copy_log.ldf';

ALTER DATABASE [db01_copy] MODIFY FILE (NAME=N'db01', NEWNAME=N'db01_copy')
ALTER DATABASE [db01_copy] MODIFY FILE (NAME=N'db01_log', NEWNAME=N'db01__copy_log')

GO
