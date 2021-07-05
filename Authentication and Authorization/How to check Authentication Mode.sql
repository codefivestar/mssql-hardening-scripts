----------------------------------------------------------------------------------------------------------
-- Author         : Hidequel Puga
-- Date           : 2021-07-01
-- Description    : Hardening - How to check SQL Server Authentication Mode
----------------------------------------------------------------------------------------------------------
USE [master]
GO

-- code snippet # 1

DECLARE @AuthenticationMode INT;

   EXEC master.dbo.xp_instance_regread N'HKEY_LOCAL_MACHINE'
	                                 , N'Software\Microsoft\MSSQLServer\MSSQLServer'
									 , N'LoginMode', @AuthenticationMode OUTPUT;  

 SELECT CASE @AuthenticationMode WHEN 1 THEN 'Windows Authentication'   
                                 WHEN 2 THEN 'Windows and SQL Server Authentication'   
                                 ELSE 'Unknown'  
         END AS [Authentication Mode] 

-- code snippet # 2
	SELECT CASE SERVERPROPERTY('IsIntegratedSecurityOnly') WHEN 1 THEN 'Windows Authentication'   
                                                           WHEN 0 THEN 'Windows and SQL Server Authentication'   
            END as [Authentication Mode];  

-- code snippet # 3
EXEC master.sys.xp_loginconfig 'login mode'  