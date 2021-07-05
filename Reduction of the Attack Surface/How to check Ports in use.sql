----------------------------------------------------------------------------------------------------------
-- Author         : Hidequel Puga
-- Date           : 2021-07-01
-- Description    : Hardening - How to check Ports in use
----------------------------------------------------------------------------------------------------------

-- Script # 1 : Get SQL Server Port from the registry using xp_instance_regread
DECLARE @portNumber NVARCHAR(10);
   
   EXEC xp_instance_regread @rootkey    = 'HKEY_LOCAL_MACHINE'
                          , @key        = 'Software\Microsoft\Microsoft SQL Server\MSSQLServer\SuperSocketNetLib\Tcp\IpAll'
						  , @value_name = 'TcpDynamicPorts'
						  , @value      = @portNumber OUTPUT;

 SELECT [Port Number] = @portNumber
 GO

DECLARE @portNumber NVARCHAR(10);
   
   EXEC xp_instance_regread @rootkey    = 'HKEY_LOCAL_MACHINE'
                          , @key        = 'Software\Microsoft\Microsoft SQL Server\MSSQLServer\SuperSocketNetLib\Tcp\IpAll'
					      , @value_name = 'TcpPorts'
						  , @value      = @portNumber OUTPUT;

 SELECT [Port Number] = @portNumber
 GO

 -- Script # 2 : Get SQL Server Port from using sys.dm_exec_connections DMV:
 SELECT local_tcp_port
   FROM sys.dm_exec_connections
  WHERE session_id = @@SPID
 GO