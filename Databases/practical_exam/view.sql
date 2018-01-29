use Practical
go 
alter view coolConferences
as
select c.name, c.location from Conferences c
	join(
		select id as confID, count(*) as speakersParticipating from Conferences 
			join SpeakersAtConferences on id = cid
		group by id
	) as t on c.id = t.confID
where speakersParticipating >= 3

go
select * from coolConferences