	-- Parametro TrustWorthy, se exceptua la bd msdb
	SELECT CONVERT(VARCHAR(50), SERVERPROPERTY('ServerName')) AS ServerName
		 , [Name] AS DbName
		 , TrustWorthySetting = CASE is_trustworthy_on WHEN 1 THEN 'ON'
													   ELSE 'OFF'
								 END
	  FROM sys.databases;