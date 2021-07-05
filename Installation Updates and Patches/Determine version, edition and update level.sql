----------------------------------------------------------------------------------------------------------
-- Author         : Hidequel Puga
-- Date           : 2021-07-01
-- Description    : Hardening - Determine version, edition and update level
----------------------------------------------------------------------------------------------------------
USE [master]
GO

-- Code # 1: 
SELECT CONVERT(VARCHAR(300), @@VERSION) AS [Version];

-- Code # 2:
SELECT SERVERPROPERTY('ServerName')             AS ServerName
     , SERVERPROPERTY('ProductVersion')         AS ProductVersion
	 , SERVERPROPERTY('ProductLevel')           AS ProductLevel
	 , SERVERPROPERTY('Edition')                AS [Edition]
	 , SERVERPROPERTY('ProductUpdateLevel')     AS ProductUpdateLevel
	 , SERVERPROPERTY('ProductUpdateReference') AS ProductUpdateReference;