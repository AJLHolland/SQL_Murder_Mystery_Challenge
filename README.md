#### *Mystery Knight Lab SQL Challenge*
# Murder Mystery 🕵

This repository contains a SQL solution to the Mystery Knight Lab challenge. 

## Problem Description
![image](https://github.com/Millie169/SQL_Murder_Mystery_Challenge/assets/69691735/7e46ee17-6d2f-4944-a242-29fd6d1db7ac)

There's been a Murder in SQL City! The SQL Murder Mystery is designed to be both a self-directed lesson to learn SQL concepts and commands and a fun game for experienced SQL users to solve an intriguing crime.

**[Try the challenge](https://mystery.knightlab.com/)**

## Solution: Part 1 - Find the Killer

### Crime Scene Report

We want to select all reports from *15/01/2017*, that happened in *SQL City*:

```SQL
SELECT * 
FROM crime_scene_report
WHERE type='murder' and date='20180115' and city='SQL City';
```

### Witness IDs
We want to find the ID of two wittnesses:
1. Lives in the last house on *Northwestern Dr.*
2. Has the first name *Annabel*, that lives on *Franklin Ave.*

```SQL
--1.

SELECT *
FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number desc
LIMIT 1;
```
```SQL
--2.

SELECT * 
FROM person
WHERE address_street_name = 'Franklin Ave' AND
name like 'Annabel%'
ORDER BY address_number desc
LIMIT 1;
```

### Witness Statements
We need to find our statements from the witnesses:
1. *Morty Schapiro*, ID = *14887*
2. *Annabel Miller*, ID = *16371*

```SQL
SELECT * 
FROM interview
WHERE person_id in (14887,16371);
```

### Suspects
The witness statements reveal that the murderer is a *gold* status member at Get Fit Now gym, with a gym ID starting *48Z*. His car number plate includes *H42W*

```SQL
SELECT * 
FROM get_fit_now_member AS G
INNER JOIN person AS P ON G.person_id = P.id
INNER JOIN drivers_license AS D ON P.license_id = D.id
WHERE G.id LIKE '48Z%'
AND membership_status ='gold'
AND plate_number like '%H42W%';
```

### KILLER
<details>
  <summary>Answer</summary> 
  
  **Jeremy Bowers**

</details>

## Solution: Part 2 - Find the Mastermind

### Killer's Statement
Turns out the killer was hired by someone else. We need to find his statement to see who the mastermind behind the murder is. Jeremy's ID is *67318*

```SQL
SELECT * 
FROM interview 
WHERE person_id = 67318;
```


### Suspects
Jeremy was hired by a woman, who was *65-67"* in height, with *red hair* and drove a *Tesla Model S* car. The person had also been to see the *SQL Symphony concert* 3 times in December.

```SQL
SELECT
P.name,
P.id,
F.event_name,
COUNT(person_id) AS number_of_visits
FROM drivers_license AS D
INNER JOIN person AS P ON D.id = P.license_id
INNER JOIN facebook_event_checkin AS F ON F.person_id = P.id
WHERE hair_color = 'red'
AND D.gender = 'female'
AND D.car_make = 'Tesla'
AND D.car_model='Model S'
AND D.height between 65 and 67
AND F.event_name= 'SQL Symphony Concert'
AND date LIKE '201712%'
GROUP BY 
P.name,
P.id,
F.event_name;
```
### MASTERMIND
<details>
  <summary>Answer</summary> 
  
**Miranda Priestly**

</details>


