use Practical
go 
alter function showHiddenSpeakers ()
returns table
as 
return
select c.name as companyName, j.name as speakerName, j.email from Companies c 
	join (
		select s.name, s.email, s.companyID from Speakers s 
		where s.id not in (
			select distinct id from Speakers 
				join SpeakersAtConferences on id = sid 
			)
	) as j on j.companyID = c.id

go
select * from showHiddenSpeakers()
