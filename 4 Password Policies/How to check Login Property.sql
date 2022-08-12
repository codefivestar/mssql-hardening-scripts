----------------------------------------------------------------------------------------------------------
-- Author         : Hidequel Puga
-- Date           : 2021-07-06
-- Description    : Hardening - How to check Login properties
----------------------------------------------------------------------------------------------------------

SELECT [name] AS LoginName
     , CASE LOGINPROPERTY([name], N'IsMustChange') WHEN 1 THEN 'On' ELSE 'Off' END AS IsMustChange
     , CASE CAST(is_policy_checked AS BIT)         WHEN 1 THEN 'On' ELSE 'Off' END AS PasswordPolicyEnforced
	 , CASE CAST(is_expiration_checked AS BIT)     WHEN 1 THEN 'On' ELSE 'Off' END AS PasswordExpirationEnabled
  FROM sys.sql_logins;