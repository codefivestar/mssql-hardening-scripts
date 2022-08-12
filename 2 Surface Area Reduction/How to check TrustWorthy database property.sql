----------------------------------------------------------------------------------------------------------
-- Author         : Hidequel Puga
-- Date           : 2021-07-01
-- Description    : Hardening - How to check TrustWorthy database property
----------------------------------------------------------------------------------------------------------
	-- Parametro TrustWorthy, se exceptua la bd msdb
	SELECT CONVERT(VARCHAR(50), SERVERPROPERTY('ServerName')) AS ServerName
		 , [Name] AS DbName
		 , TrustWorthySetting = CASE is_trustworthy_on WHEN 1 THEN 'ON'
													   ELSE 'OFF'
								 END
	  FROM sys.databases;