use Practical
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter PROCEDURE addSpeaker
	@speakerID int, 
	@conferenceID int, 
	@speechLength time
AS
BEGIN
	SET NOCOUNT ON;

	declare @exists int 
	set @exists = (select sid from SpeakersAtConferences where sid = @speakerID and cid = @conferenceID)

	if @exists is not null 
		update SpeakersAtConferences set speechLength = @speechLength 
		where sid = @speakerID and cid = @conferenceID
	else 
		insert into SpeakersAtConferences values
			(@speakerID, @conferenceID, @speechLength)
END
GO

exec addSpeaker 1,2,'00:58:31'
exec addSpeaker 3,1,'01:58:31'