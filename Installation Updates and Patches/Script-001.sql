    -- Verificar versión, actualizacion y parches del servidor
SELECT SERVERPROPERTY('ServerName')             AS ServerName
     , SERVERPROPERTY('ProductVersion')         AS ProductVersion
	 , SERVERPROPERTY('ProductLevel')           AS ProductLevel
	 , SERVERPROPERTY('Edition')                AS Edition
	 , SERVERPROPERTY('ProductUpdateLevel')     AS ProductUpdateLevel
	 , SERVERPROPERTY('ProductUpdateReference') AS ProductUpdateReference;