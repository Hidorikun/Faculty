USE SECRET_SERVICES
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE crud_tool
	@table_name Varchar(50), 
	@name Varchar(20), 
	@type Varchar(20), 
	@tech Varchar(40), 
	@description Varchar(400),
	@rowNumber int
AS
BEGIN
	SET NOCOUNT ON;
	--CREATE
	declare @n int = 1
	while @n <= @rowNumber begin 
		insert into Tool(name, type, technology, description)
		values (@name, @type, @tech, @description)
		set @n = @n + 1
	end

	--READ
	select * from Tool

	--UPDATE
	update Tool 
		set technology = 'Steampunk'
		where type = 'ranged'

	--DELETE
	delete from Tool 
		where type = 'ranged'

	print 'CRUD operations for table ' + @table_name
END
GO
