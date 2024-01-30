--Jan.15.2018
--SQL City
select * 
from crime_scene_report
where type='murder' and date='20180115' and city='SQL City';

--last house 'Northwestern Dr'
--Annabel, 'Franklin Ave'

select * 
from person
where address_street_name = 'Northwestern Dr'
order by address_number desc
limit 1

select * 
from person
where address_street_name = 'Franklin Ave' and 
name like 'Annabel%'
order by address_number desc
limit 1

--ID 14887, Morty Schapiro
--ID 16371 Annabel Miller, ssn=318771143

select * 
from interview
where person_id in (14887,16371)
              
--GFN Gym, member number:48Z, car plate included H42W
--Gym Jan9th

select * 
from get_fit_now_member
where id like '48Z%'
and membership_status='gold'

--ID 48Z7A, Joe Germuska
--ID 48Z55, Jeremy Bowers

select * 
from get_fit_now_member as G
inner join person as P on G.person_id=P.id
inner join drivers_license as D on P.license_id=D.id
where G.id like '48Z%'
and membership_status='gold'
and plate_number like '%H42W%'


--ID 67318, Jeremy Bowers

select * 
from interview 

where person_id=67318

--5'5" (65")/5'7"(67")
--red hair
--Tesla Model S
--SQL Symphont 3 times in dec 2017

select 
P.name,
P.id,
F.event_name,
count(person_id) as number_of_visits
from drivers_license as D
inner join person as P on D.id=P.license_id
inner join facebook_event_checkin as F on F.person_id=P.id
where hair_color='red'
and D.gender='female'
and D.car_make='Tesla'
and D.car_model='Model S'
and D.height between 65 and 67
and F.event_name= 'SQL Symphony Concert'
and date like '201712%'
group by 
P.name,
P.id,
F.event_name

              


              
               