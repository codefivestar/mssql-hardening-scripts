-- Login de base de datos con la cuenta SA
DECLARE @TSQL          AS VARCHAR(1000);
DECLARE @TSQLoop       AS VARCHAR(1000);
DECLARE @TargetDbs     AS TABLE (DbName VARCHAR(128));
DECLARE @DbName        AS VARCHAR(128);
DECLARE @Temp_ListUser AS TABLE (  DatabaseName NVARCHAR(50)
	                             , UserName     SYSNAME
	                             , TypeDesc     NVARCHAR(60)
	                             );

    SET @TSQL = 'SELECT DB_NAME() AS DatabaseName
	                  , [name] AS UserName
					  , type_desc AS TypeDesc
				   FROM sys.database_principals
				  WHERE type = ''S''
					AND sid IS NOT NULL
					AND name = ''sa''
			   ORDER BY username';

	INSERT INTO @TargetDbs
		 SELECT [name]
		   FROM sys.databases;

	WHILE EXISTS (SELECT * FROM @TargetDbs)
		BEGIN
		
			SET @DbName  = (SELECT TOP 1 DbName FROM @TargetDbs);
			SET @TSQLoop = ('USE [' + @DBName + ']; ') + @TSQL;

			--PRINT @TSQLoop;
			
			INSERT INTO @Temp_ListUser ( DatabaseName
				                        , UserName
				                        , TypeDesc
				                        )
			       EXEC (@TSQLoop);

			DELETE FROM @TargetDBs WHERE DBName = @DBName;
	
		END

	IF EXISTS (SELECT * FROM @Temp_ListUser)
		BEGIN
		
			SELECT TypeDesc     AS Scope
				 , UserName     AS [ConfigName]
				 , DatabaseName AS [ConfigValue]
			  FROM @Temp_ListUser;
			  
		END
	ELSE
		BEGIN
		
			SELECT 'SQL_USER' AS Scope
				 , 'sa'       AS [ConfigName]
				 , 'Coinsidencias no encontradas' AS [ConfigValue];
		END
