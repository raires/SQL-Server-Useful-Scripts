--Create table if not exist
if not exists (select * from sysobjects where name='TABLENAME' and xtype='U')
--other way without the if statetment:
--drop table if exists test2
	CREATE TABLE [dbo].[TABLENAME](
		[ID] [int] IDENTITY(1,1) NOT NULL,
		[Name] [varchar](50) NULL,
	PRIMARY KEY CLUSTERED 
	(
		[ID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
go


--Create procedure if not exist
if exists (select * from sysobjects where name='ProcedureName' and xtype='P')
begin
	DROP PROCEDURE [dbo].[ProcedureName]
end
--Create the procedure outside the if statetment because the procedure script can be too complex and cause issues on the procedure creation
--CREATE PROCEDURE [dbo].[ProcedureName]
