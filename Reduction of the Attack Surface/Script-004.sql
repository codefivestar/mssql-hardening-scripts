	-- Login de servidor con la cuenta SA
	SELECT CONVERT(VARCHAR(50), SERVERPROPERTY('ServerName')) AS ServerName
	     , sp.name        AS [Login]
		 , sp.type_desc   AS [LoginType]
		 , sp.create_date AS CreateDate
		 , sp.modify_date AS ModifyDate
		 , CASE WHEN sp.is_disabled = 1 THEN 'Disabled'
				ELSE 'Enabled' 
			END AS [Status]
	  FROM sys.server_principals AS sp
 LEFT JOIN sys.sql_logins AS sl
        ON sp.principal_id = sl.principal_id
     WHERE sp.type NOT IN ('G', 'R')
       AND sp.name LIKE '%sa%'
  ORDER BY sp.name;