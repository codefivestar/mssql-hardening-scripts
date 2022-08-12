----------------------------------------------------------------------------------------------------------
-- Author         : Hidequel Puga
-- Date           : 2021-07-01
-- Description    : Hardening - How to check SQL Server System Configuration
----------------------------------------------------------------------------------------------------------

SELECT CONVERT(VARCHAR(50), SERVERPROPERTY('ServerName')) AS ServerName
	 , [name] AS [ConfigName]
	 , CASE [value] WHEN 1 THEN 'On'
		            ELSE 'Off'
		END AS [ConfigValue]
  FROM sys.configurations
 WHERE [name] IN (  'Ad Hoc Distributed Queries'
		          , 'cross db ownership chaining'
		          , 'Ole Automation Procedures'
		          , 'remote admin connections'
		          , 'xp_cmdshell'
		          );
