----------------------------------------------------------------------------------------------------------
-- Author         : Hidequel Puga
-- Date           : 2021-12-21
-- Description    : Hardening - Determine SQL Services and Account Name
----------------------------------------------------------------------------------------------------------

SELECT SERVERPROPERTY('ServerName') AS ServerName
     , dss.servicename              AS ServiceName
	 , dss.startup_type_desc        AS StartupTypeDesc
	 , dss.status_desc              AS StatusDesc
	 , dss.last_startup_time        AS LastStartupTime
	 , dss.service_account          AS ServiceAccount
	 , dss.is_clustered             AS IsClustered
	 , dss.[filename]               AS Path_Service_Executable
	 , dss.startup_type             AS StartupType
	 , dss.status                   AS [ServiceStatus]
	 , dss.process_id               AS ProcessId
  FROM sys.dm_server_services AS dss;