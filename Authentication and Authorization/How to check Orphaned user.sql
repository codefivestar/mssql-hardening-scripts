----------------------------------------------------------------------------------------------------------
-- Author         : Hidequel Puga
-- Date           : 2021-07-01
-- Description    : Hardening - How to check Orphaned user
----------------------------------------------------------------------------------------------------------
-- Fix orphaned user : https://docs.microsoft.com/es-es/sql/sql-server/failover-clusters/troubleshoot-orphaned-users-sql-server?view=sql-server-ver15#resolve-an-orphaned-user
----------------------------------------------------------------------------------------------------------

USE [master]
GO

DECLARE @TSQL              AS VARCHAR(1000);
DECLARE @TSQLoop           AS VARCHAR(1000);
DECLARE @TargetDbs         AS TABLE (DbName VARCHAR(128));
DECLARE @DbName            AS VARCHAR(128);
DECLARE @Debug             AS BIT;
DECLARE @Temp_OrphanedUser AS TABLE (  ServerName   NVARCHAR(50)
                                     , DatabaseName NVARCHAR(128)
									 , TypeDesc     NVARCHAR(60)
									 , [SID]        VARBINARY(85)
									 , UserName     SYSNAME
									 );
    
	SET @Debug = 'False';
	SET @TSQL = 'SELECT CONVERT(NVARCHAR(50), SERVERPROPERTY(''ServerName'')) AS ServerName
	                  , DB_NAME()    AS DatabaseName
					  , dp.type_desc AS TypeDesc
					  , dp.SID       AS [SID]
					  , dp.name      AS UserName  
				   FROM sys.database_principals AS dp  
			  LEFT JOIN sys.server_principals AS sp  
					 ON dp.SID = sp.SID  
				  WHERE sp.SID IS NULL  
					AND dp.authentication_type_desc = ''INSTANCE''';

	INSERT INTO @TargetDbs 
	     SELECT [name] 
	       FROM sys.databases;

	WHILE EXISTS (SELECT * FROM @TargetDbs)
		BEGIN

			SET @DbName  = (SELECT TOP 1 DbName FROM @TargetDbs);
			SET @TSQLoop = ('USE ' + @DBName + '; ') + @TSQL;

			IF(@Debug = 'True')
				BEGIN
					PRINT @TSQLoop;
				END

			INSERT INTO @Temp_OrphanedUser (ServerName, DatabaseName, TypeDesc, SID, UserName)
			       EXEC (@TSQLoop);

			DELETE FROM @TargetDBs 
			      WHERE DBName = @DBName;

		END

	SELECT * 
	  FROM @Temp_OrphanedUser;