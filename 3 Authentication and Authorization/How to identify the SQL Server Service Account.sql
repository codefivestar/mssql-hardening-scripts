----------------------------------------------------------------------------------------------------------
-- Author         : Hidequel Puga
-- Date           : 2021-07-05
-- Description    : Hardening - How to identify the SQL Server Service Account
----------------------------------------------------------------------------------------------------------

SELECT DSS.servicename
	 , DSS.startup_type_desc
	 , DSS.status_desc
	 , DSS.last_startup_time
	 , DSS.service_account
	 , DSS.is_clustered
	 , DSS.cluster_nodename
	 , DSS.filename
	 , DSS.startup_type
	 , DSS.STATUS
	 , DSS.process_id
  FROM sys.dm_server_services AS DSS;