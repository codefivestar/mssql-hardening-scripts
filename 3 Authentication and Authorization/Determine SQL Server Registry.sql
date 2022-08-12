----------------------------------------------------------------------------------------------------------
-- Author         : Hidequel Puga
-- Date           : 2021-12-21
-- Description    : Hardening - Determine SQL Server Registry
----------------------------------------------------------------------------------------------------------

-- Display the SQL Server services
SELECT registry_key, value_name, value_data  
  FROM sys.dm_server_registry  
 WHERE registry_key LIKE N'%ControlSet%';

-- Display the SQL Server Agent registry key values
SELECT registry_key, value_name, value_data  
  FROM sys.dm_server_registry  
 WHERE registry_key LIKE N'%SQLAgent%';  

-- Display the current version of the instance of SQL Server
SELECT registry_key, value_name, value_data  
  FROM sys.dm_server_registry  
 WHERE value_name = N'CurrentVersion'; 

-- Display the parameters passed to the instance of SQL Server during startup
SELECT registry_key, value_name, value_data  
  FROM sys.dm_server_registry  
 WHERE registry_key LIKE N'%Parameters';  

-- Return network configuration information for the instance of SQL Server
SELECT registry_key, value_name, value_data  
  FROM sys.dm_server_registry  
 WHERE registry_key LIKE N'%SuperSocketNetLib%';  