USE SECRET_SERVICES
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE crud_cover_specialist
	@table_name Varchar(50), 
	@name Varchar(40),
	@AgencyID int,
	@rowNumber int
AS
BEGIN
	SET NOCOUNT ON;
	--CREATE
	declare @n int = 1
	while @n <= @rowNumber begin 
		insert Cover_Specialist(name, AgencyId)
			values(@name, @AgencyID)
		set @n = @n + 1
	end

	--READ
	select * from Cover_Specialist

	--UPDATE
	update Cover_Specialist
		set name = 'Jhonny'
			where AgencyID = 1600

	--DELETE
	delete from Cover_Specialist_Hacker
		where CoverSpecialistID in
			(select ID from Cover_Specialist
				where AgencyID != 1600)
	delete from Cover_Specialist_Spy
		where CoverSpecialistID in
			(select ID from Cover_Specialist
				where AgencyID != 1600)
	
	delete from Cover_Specialist 
		where AgencyID != 1600

	print 'CRUD operations for table ' + @table_name
END
GO
