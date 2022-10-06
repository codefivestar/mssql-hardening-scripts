----------------------------------------------------------------------------------------------------------
--Author        : Hidequel Puga
--Date          : 2022-10-06
--Description   : SQL Server error log files must be protected from loss. The log files must be backed up
--                before they are overwritten. Retaining more error logs helps prevent loss from frequent
--                recycling before backups can occur
----------------------------------------------------------------------------------------------------------

-- >> AUDITS <<

USE [master]
GO

DECLARE @NumErrorLogs INT

EXEC master.sys.xp_instance_regread N'HKEY_LOCAL_MACHINE'
                                  , N'Software\Microsoft\MSSQLServer\MSSQLServer'
								  , N'NumErrorLogs'
								  , @NumErrorLogs OUTPUT

SELECT ISNULL(@NumErrorLogs, -1) AS [NumberOfLogFiles]





-- >> REMEDIATION <<

EXEC master.sys.xp_instance_regwrite N'HKEY_LOCAL_MACHINE'
                                   , N'Software\Microsoft\MSSQLServer\MSSQLServer'
								   , N'NumErrorLogs'
								   , REG_DWORD
								   , 12





-- Default value : 6