----------------------------------------------------------------------------------------------------------
--Autor          : Hidequel Puga
--Fecha          : 2021-07-07
--Descripción    : Hardening - Retrieve Configured value for Audit Level
----------------------------------------------------------------------------------------------------------

DECLARE @AuditLevel INT;

EXEC master.dbo.xp_instance_regread N'HKEY_LOCAL_MACHINE'
                                  , N'Software\Microsoft\MSSQLServer\MSSQLServer'
								  , N'AuditLevel'
								  , @AuditLevel OUTPUT;

SELECT CASE WHEN @AuditLevel = 0 THEN 'None'
			WHEN @AuditLevel = 1 THEN 'Successful logins only'
			WHEN @AuditLevel = 2 THEN 'Failed logins only'
			WHEN @AuditLevel = 3 THEN 'Both failed and successful logins' 
	    END AS [AuditLevel];