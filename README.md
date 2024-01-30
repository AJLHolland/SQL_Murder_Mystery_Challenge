#### *Mystery Knight Lab SQL Challenge*
# Murder Mystery 🕵

This repository contains a SQL solution to the Mystery Knight Lab challenge. 

## Problem Description
![image](https://github.com/Millie169/SQL_Murder_Mystery_Challenge/assets/69691735/7e46ee17-6d2f-4944-a242-29fd6d1db7ac)

There's been a Murder in SQL City! The SQL Murder Mystery is designed to be both a self-directed lesson to learn SQL concepts and commands and a fun game for experienced SQL users to solve an intriguing crime.

**[Try the challenge](https://mystery.knightlab.com/)**

## Solution

### Crime Scene Report

We want to select all reports from January 15 2018, that happened in SQL City:

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
1. Morty Schapiro, ID = 14887
2. Annabel Miller, ID = 16371

```SQL
SELECT * 
FROM interview
WHERE person_id in (14887,16371)
```

### Suspects
The witness statements reveal that the murderer is a gold status member at Get Fit Now gym, with a gym ID starting 48Z. His car number plate includes H42W

```SQL
SELECT * 
FROM get_fit_now_member AS G
INNER JOIN person AS P ON G.person_id = P.id
INNER JOIN drivers_license AS D ON P.license_id = D.id
WHERE G.id LIKE '48Z%'
AND membership_status ='gold'
AND plate_number like '%H42W%'
```

### KILLER
JEREMY BOWERS

