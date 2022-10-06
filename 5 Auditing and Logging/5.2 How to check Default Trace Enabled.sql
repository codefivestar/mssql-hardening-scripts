----------------------------------------------------------------------------------------------------------
--Autor          : Hidequel Puga
--Fecha          : 2022-10-06
--Descripción    : Default trace provides valuable audit information regarding security-related activities on the server.
----------------------------------------------------------------------------------------------------------

SELECT name                      as [name]
     , CAST(value as int)        as [value_configured]
     , CAST(value_in_use as int) as [value_in_use]
  FROM sys.configurations
 WHERE name = 'default trace enabled';