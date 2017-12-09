use SECRET_SERVICES
go

/* Someone just inflitrated into our agency and forgot a tool inside. 
I want to find out immediatly what agency owns this tool!
Contains: 
	2 join
	1 where
*/
SELECT t.name as 'Tool Name', 
		s.real_name 'Infiltrator Name', 
		a.name 'Responsible Agency'
FROM Tool t JOIN Spy s ON t.SpyID = s.ID
			JOIN Agency a ON s.AgencyID = a.ID
					WHERE t.name = 'SpyPen';

/* 
A spy infiltrated into our database and managed to steal 50GB of data before his access was cut.
Our luck is that he left his codename in the terminal log. We are going to use it ti identify the missions of this spy and 
find out what he was after and who he is working for.
Contains:
	2 join 
	1 where 
*/
SELECT s.real_name as 'Spy real name', 
	   a.name as 'Responsible Agency', 
	   m.name as 'Mission'
FROM Mission m JOIN Spy s on m.SpyID = s.ID
			   JOIN Agency a on s.AgencyID = a.ID
WHERE s.code_name = '007';

/* I want to find the specialist in charge of Ionel
Contains:
	2 join
	1 where
*/

SELECT cs.name as 'specialist', 
	   s.real_name as 'Spy'
FROM Spy s JOIN Cover_Specialist_Spy csp ON s.ID = csp.spyID
		   JOIN Cover_Specialist cs ON csp.CoverSpecialistID = cs.id
WHERE cs.name = 'Ionel';


/*
I want to find how many ranged weapons each agency has.
Contains:
	2 JOIN 
	1 GROUP BY */
SELECT 
	COUNT(w.type) as 'ranged weapons' ,
	a.id as 'Agency'
FROM Weapon w JOIN Spy s ON w.SpyID	 = s.ID
	          JOIN Agency a ON s.AgencyID = a.ID 
GROUP BY a.ID

/*
I want to see the agencies with more than one ranged weapon.
Contains:
	2 JOIN 
	1 HAVING
	1 GROUP BY */
SELECT a.name as 'agency'
FROM Agency a JOIN (
	SELECT 
		a.id as 'Agency',
		COUNT(w.type) as 'ranged_weapons' 
	
	FROM Weapon w JOIN Spy s ON w.SpyID	 = s.ID
				  JOIN Agency a ON s.AgencyID = a.ID 

	GROUP BY a.ID
	HAVING COUNT(w.type) > 1
	) aux ON aux.Agency = a.ID;

/* 
I want the weapons that have a range above 1km from a certain agency.
Contains:
	1 WHERE
	1 DISTINCT
*/

SELECT DISTINCT w.name
FROM Weapon w JOIN Spy s ON w.SpyID = s.ID
	          JOIN Agency a ON a.ID = s.ID
			  where w.range >= 1000 AND a.name = 'KGB'

/*

ISIS strikes again!
Only this time they went way too far. 
Due to this unfortunate event, leaders of the United Nations 
all band together to elaborate a plan to get rid of the terrorist group once and for all.
They need the help of all capable intelligene agencies to achive this goal, and so reach out to all the 
agencies that have at least 2 spies trained to handle at least 2 ranged weapons and 3 meele ones.
It's up to you to make a list of the requierd agencies, and fast, for the world demands vengence.
*/

SELECT 
	a.name, 
	COUNT(*) AS 'nr_of_capable_spies'
FROM Agency a JOIN (
	SELECT s.ID, s.real_name, s.AgencyID, r.ranged_weapons, m.meele_weapons
	FROM Spy s 
		JOIN (
			SELECT s.ID AS 'spy_id', 
					COUNT(*) AS 'ranged_weapons'
			FROM Weapon w JOIN Spy s ON w.SpyID = s.ID
			WHERE w.type = 'Ranged'
			GROUP BY s.Id
			HAVING COUNT(*) >= 2
		) AS r ON s.ID = r.spy_id
		JOIN (
			SELECT s.ID AS 'spy_id', 
			   COUNT(*) AS 'meele_weapons'
			FROM Weapon w JOIN Spy s ON w.SpyID = s.ID
			WHERE w.type = 'Meele'
			GROUP BY s.Id
			HAVING COUNT(*) >= 3
		) AS m ON s.ID = m.spy_id
	) s ON s.AgencyID = a.ID
	GROUP BY a.name
	HAVING COUNT(*) >= 2

/* ce arme are Emi 
*/

SELECT w.*
FROM Weapon w JOIN Spy s ON w.SpyID = s.ID
WHERE s.code_name = 'Emi'

	   
