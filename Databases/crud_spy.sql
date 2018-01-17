USE SECRET_SERVICES
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE crud_spy
	@table_name Varchar(50), 
	@real_name Varchar(60),
	@code_name Varchar(60),
	@agencyID int,
	@rowNumber int
AS
BEGIN
	SET NOCOUNT ON;
	--CREATE
	declare @n int = 1
	while @n <= @rowNumber begin 
		insert into Spy(ID, real_name, code_name, AgencyID)
			values(@n, @real_name, @code_name, @agencyID)
		set @n = @n + 1
	end

	--READ
	select * from Spy

	--UPDATE
	update Spy 
		set code_name = 'Chimpy'
		where real_name = 'Helmeppo'

	--DELETE
	delete from Mission 
		where SpyId in 
			(select ID from Spy
				where code_name = 'Bruno') 
	delete from Tool 
		where SpyId in 
			(select ID from Spy
				where code_name = 'Bruno') 
	delete from Weapon 
		where SpyId in 
			(select ID from Spy
				where code_name = 'Bruno') 

	delete from Armor 
		where SpyId in 
			(select ID from Spy
				where code_name = 'Bruno') 
	
	delete from Spy 
		where ID in 
			(select ID from Spy
				where code_name = 'Bruno') 

	print 'CRUD operations for table ' + @table_name
END
GO
