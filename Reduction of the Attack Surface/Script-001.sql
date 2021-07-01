-- Configuración del servidor, los valores se sugieren estar en 0 (Off) 
SELECT CONVERT(VARCHAR(50), SERVERPROPERTY('ServerName')) AS ServerName
	 , [name] AS [ConfigName]
	 , CASE [value] WHEN 1 THEN 'ON'
		            ELSE 'OFF'
		END AS [ConfigValue]
  FROM sys.configurations
 WHERE [name] IN (  'Ad Hoc Distributed Queries'
		          , 'cross db ownership chaining'
		          , 'Ole Automation Procedures'
		          , 'remote admin connections'
		          , 'xp_cmdshell'
		          );
