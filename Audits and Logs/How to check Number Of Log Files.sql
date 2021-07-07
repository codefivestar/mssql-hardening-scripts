----------------------------------------------------------------------------------------------------------
--Autor          : Hidequel Puga
--Fecha          : 2021-07-07
--Descripción    : Hardening - Retrieve Configured value SQL Error Log
----------------------------------------------------------------------------------------------------------

USE [master]
GO

DECLARE @HkeyLocal          NVARCHAR(18);
DECLARE @MSSqlServerRegPath NVARCHAR(31);
DECLARE @InstanceRegPath    SYSNAME;
DECLARE @NumErrorLogs       INT;

    SET @HkeyLocal          = N'HKEY_LOCAL_MACHINE';
    SET @MSSqlServerRegPath = N'SOFTWARE\Microsoft\MSSQLServer';
    SET @InstanceRegPath    = @MSSqlServerRegPath + N'\MSSQLServer';
    
   EXEC master.dbo.xp_instance_regread @HkeyLocal
	                                 , @InstanceRegPath
									 , N'NumErrorLogs'
									 , @NumErrorLogs OUTPUT;
    
	SELECT ISNULL(@NumErrorLogs, -1) AS [NumberOfLogFiles];