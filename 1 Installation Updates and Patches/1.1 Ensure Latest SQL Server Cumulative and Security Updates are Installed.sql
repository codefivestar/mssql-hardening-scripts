----------------------------------------------------------------------------------------------------------
-- Author         : Hidequel Puga
-- Date           : 2021-07-01
-- Description    : Hardening - Determine version, edition and update level
----------------------------------------------------------------------------------------------------------
USE [master]
GO

-- Audit :

SELECT SERVERPROPERTY('ServerName')             AS ServerName
     , SERVERPROPERTY('ProductVersion')         AS ProductVersion
	 , SERVERPROPERTY('ProductLevel')           AS ProductLevel
	 , SERVERPROPERTY('Edition')                AS [Edition]
	 , SERVERPROPERTY('ProductUpdateLevel')     AS ProductUpdateLevel
	 , SERVERPROPERTY('ProductUpdateReference') AS ProductUpdateReference;

-- Remediation : 

-- https://docs.microsoft.com/en-us/sql/database-engine/install-windows/latest-updates-for-microsoft-sql-server?view=sql-server-ver15