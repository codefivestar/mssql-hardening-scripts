----------------------------------------------------------------------------------------------------------
-- Author         : Hidequel Puga
-- Date           : 2021-07-01
-- Description    : Hardening - How to check HideInstance database engine
----------------------------------------------------------------------------------------------------------

	-- Propiedad Hide Instance, se sugiere valor en 1 (On)
	DECLARE @getValue INT;

       EXEC master..xp_instance_regread @rootkey    = N'HKEY_LOCAL_MACHINE'
	                                  , @key        = N'SOFTWARE\Microsoft\Microsoft SQL Server\MSSQLServer\SuperSocketNetLib'
	                                  , @value_name = N'HideInstance'
	                                  , @value      = @getValue OUTPUT

     SELECT CONVERT(VARCHAR(50), SERVERPROPERTY('ServerName')) AS ServerName
          , CASE @getValue WHEN 1 THEN 'ON'
                           ELSE 'OFF'
             END AS HideInstanceSetting;