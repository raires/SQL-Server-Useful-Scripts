/*
This is an example of how to add/call dynamic data in a view
*/

select * from sys.servers

-- Add a data access to the server (self) - in order to do this process we need to add a the DB server we are targeting to the Linked Servers
-- I'm not adding the Linked Server here. I'm assuming that is already in place

-------------------------------------------------------------------------------

--First task is to enable the distributed query access to the linked server 
--'data access' Enables and disables a linked server for distributed query access. 
--Can be used only for sys.servers entries added through sp_addlinkedserver.
--you can read more here:
--https://docs.microsoft.com/en-us/sql/relational-databases/system-stored-procedures/sp-serveroption-transact-sql?view=sql-server-ver15

EXEC sp_serveroption 'NAME-OF-THE-LINKED-SERVER-ON-sys.servers', 'DATA ACCESS', TRUE;
GO

-------------------------------------------------------------------------------

--Create a Procedure that will do the ETL
CREATE PROCEDURE dbo.pr_CalculatedField
AS
BEGIN
	SELECT 2 * 2 + 3
END

-------------------------------------------------------------------------------

--Create the Function that will execute the Procedure above
CREATE FUNCTION dbo.[fn_CalculatedField]()
RETURNS TABLE
AS
RETURN
(
	SELECT * FROM OPENQUERY([NAME-OF-THE-LINKED-SERVER-ON-sys.servers], 'EXEC DB_NAME.dbo.pr_CalculatedField')
)

-------------------------------------------------------------------------------

--Finally, create the view that will call the dynamic calculated field 
CREATE VIEW [dbo].[v_CalculatedField]
AS
	SELECT tb.*
	FROM dbo.fn_CalculatedField() AS tb
GO

-------------------------------------------------------------------------------

--Check the results
select * from dbo.[v_CalculatedField]