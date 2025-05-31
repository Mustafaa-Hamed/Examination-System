--created by Mostafa Hamed
----------------------------------------------------------------------------
-----------------------Full Backup 
----------------------------------------------------------------------------
BACKUP DATABASE Examination_Sytem
TO DISK = 'E:\DB_Project\2-Backups\Examination_Sytem_Full.bak'
	WITH INIT,    
	NAME = 'Full Backup of Examination_Sytem',   
	DESCRIPTION = 'Full backup created on May 21, 2025';  --RESTORE HEADERONLY  
	                                                      --FROM DISK = 'C:\Backups\Examination_Sytem_Full.bak';

----------------------------------------------------------------------------
-----------------------DIFFERENTIAL Backup
----------------------------------------------------------------------------
BACKUP DATABASE Examination_Sytem
TO DISK = 'E:\DB_Project\2-Backups\Examination_Sytem_Diff.bak'
WITH DIFFERENTIAL, 
     INIT, 
     NAME = 'Differential Backup of Examination_Sytem',
     DESCRIPTION = 'Differential backup created on May 21, 2025';
---------------------------------------------------------------------------------
-----------------------Daily Backup 
---------------------------------------------------------------------------------
DECLARE @BackupPath NVARCHAR(200)                          --run every_day at 7 pm by sql server agent 
SET @BackupPath = 'E:\DB_Project\2-Backups\Examination_Sytem_' 
                  + CONVERT(NVARCHAR(20), GETDATE(), 112) 
                  + '.bak'

BACKUP DATABASE [Examination_Sytem]
TO DISK = @BackupPath
WITH INIT,
     NAME = 'Daily Backup of Examination_Sytem',
     DESCRIPTION = 'Daily backup at 7 PM EEST'
---------------------------------------------------------------------------------
