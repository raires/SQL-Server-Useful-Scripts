--Create a linked server object
EXEC sp_addlinkedserver
@server='LINKED_SERVER_NAME',
@srvproduct='',
@provider='sqlncli',
@datasrc='SERVERNAME.database.windows.net',
@location='',
@provstr='',
@catalog='DATABASE_CATALOG_NAME'
GO

--Add a login to the created linked server
EXEC sp_addlinkedsrvlogin
@rmtsrvname = 'LINKED_SERVER_NAME',
@useself = 'false',
@rmtuser = 'USER_NAME',
@rmtpassword = 'PASSWORD'
GO


--Enables RPC to the given server.
--https://docs.microsoft.com/en-us/sql/relational-databases/system-stored-procedures/sp-serveroption-transact-sql?view=sql-server-ver15
EXEC sp_serveroption 'LINKED_SERVER_NAME', 'rpc out', true