use Practical
go 
if object_id('SpeakersAtConferences', 'U') is not null 
	drop table SpeakersAtConferences
if object_id('Speakers', 'U') is not null 
	drop table Speakers
if object_id('Companies', 'U') is not null 
	drop table Companies
if object_id('Conferences', 'U') is not null 
	drop table Conferences
if object_id('ConferenceTypes', 'U') is not null 
	drop table ConferenceTypes
if object_id('SpeakersAtConferences', 'U') is not null 
	drop table SpeakersAtConferences

create table Companies(
	id int primary key, 
	name varchar(50), 
	description varchar(500), 
	website varchar(100), 
	nrOfEmployees int
)

insert into Companies values
	(1, 'Yardi', 'Properties of the future', 'www.yardi-romania.com', 1008), 
	(2, 'Emag', 'Delivering all over the country in a single day', 'www.emag.com', 250), 
	(3, 'Amazon', 'Prices you can"t find anywhere else, globally', 'www.amazon.com', 3400), 
	(4, 'Acer', 'Innovating the laptop indusry since 1989', 'www.acer.com', 1200),
	(5, 'Tesla', 'Building the future', 'www.tesla.com', 2000), 
	(6, 'Linux Foundation', 'Free software for everyone', 'www.linux.com', 1873)

create table Speakers(
	id int primary key,
	name varchar(50), 
	email varchar(100), 
	dob datetime, 
	companyID int foreign key references Companies(id)
)

insert into Speakers values 
	(1, 'Elon Musk', 'elon_musk@tesla.com', '1973-02-02', 5), 
	(2, 'Anant Yardi', 'anantYardi@yardi.com', '1962-05-17', 1), 
	(3, 'Alexandru Neacu', 'nea_alex@gmail.com', '1980-07-07', 2), 
	(4, 'Linus Torvalds', 'linus_torvalds@linux.com', '1969-12-12', 6)

create table ConferenceTypes(
	id int primary key, 
	name varchar(50), 
	populatiry int
)

insert into ConferenceTypes values 
	(1, 'Training', 8), 
	(2, 'General Overview', 9), 
	(3, 'Open Discussions', 9), 
	(4, 'Magazine release', 10)

create table Conferences(
	id int primary key, 
	name varchar(50), 
	location varchar(100), 
	startDate datetime,
	endDate datetime, 
	conferenceTypeID int foreign key references ConferenceTypes(id)
)

insert into Conferences values 
	(1, 'Git gud in git', 'Linux Foundation', '2018-02-02', '2018-02-03', 1), 
	(2, 'AI and the terror of the machines', 'Santa Barbara', '2018-04-05', '2018-04-07', 2), 
	(3, 'Making money as a data scientist', 'The Office, Cluj', '2018-07-08', '2018-07-10', 3), 
	(4, 'TSM - Today Software Magazine release 72', 'Ve Labs', '2018-08-09', '2018-08-10', 4)

create table SpeakersAtConferences(
	sid int foreign key references Speakers(id), 
	cid int foreign key references Conferences(id),
	speechLength Time, 
	constraint pk_speakerConference primary key (sid, cid)
)

insert into SpeakersAtConferences values
	(1, 1, '02:00:00'), 
	(1, 2, '00:45:00'), 
	(1, 3, '00:00:00'),
	(2, 1, '00:30:00'), 
	(2, 2, '00:40:45'), 
	(2, 3, '00:05:00'), 
	(3, 4, '00:20:00'),
	(3, 3, '00:25:00')
