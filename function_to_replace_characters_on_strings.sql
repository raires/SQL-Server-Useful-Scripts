CREATE OR ALTER FUNCTION [dbo].[fn_ReplaceCharacters] (@stringToBeChanged varchar(1000))
RETURNS varchar(1000)
AS
BEGIN
    Declare @stringChanged varchar(1000);

    SET @stringChanged = REPLACE(
	REPLACE( 
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
		LTRIM(RTRIM(@textToBeClean))
			, ' ',	'_')
			, CHAR(9), '')
			, CHAR(255), '')
			, '#',	'')
			, '@',	'')
			, ',',	'')
			, '.',	'')
			, '=',	'')
			, '/',	'')
			, '\',	'')
			, '|',	'')
			, '<',	'')
			, '>',	'')
			, '(',	'')
			, ')',	'')
			, '[',	'')
			, ']',	'')
			, '{',	'')
			, '}',	'')
			, '%',	'')
			, ':',	'')
			, ';',	'')
			, '&',	'')
			, '$',	'')
			, '?',	'') 
			, '!',	'') 
			, '`',	'') 
			, '~',	'') 
			, '^',	'') 
			, '*',	'') 
			, '''', '')
			, '"', '')
			, 'á',	'a') 
			, 'é',	'e') 
			, 'í',	'i') 
			, 'ó',	'o') 
			, 'ú',	'u') 
			, 'â',	'a') 
			, 'ê',	'e')
			, 'î',	'i') 
			, 'ô',	'o') 
			, 'û',	'u') 
			, 'ã',	'a') 
			, 'õ',	'o') 
			, 'à',	'a') 
			, 'è',	'e') 
			, 'ì',	'i') 
			, 'ò',	'o') 
			, 'ù',	'u') 
			, 'ç',	'c');

	RETURN @stringChanged;
END
GO



--How to use it: Just call the function wherever you whant the string replaced

Select dbo.fn_ReplaceCharacters('string test') as [Changed]