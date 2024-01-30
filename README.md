#### Mystery Knight Lab SQL Challenge
# Murder Mystery 🕵️



This repository contains a SQL solution to the Mystery Knight Lab challenge. The challenge involves analyzing crime scene reports and related data to solve a mystery.

## Problem Description

The challenge is to investigate a murder case that occurred on January 15, 2018, in SQL City. The solution involves querying various tables to gather information about the crime and individuals associated with it.

## SQL Queries

### Crime Scene Report




### Solutions

```
--Jan.15.2018
--SQL City
select * 
from crime_scene_report
where type='murder' and date='20180115' and city='SQL City';

```
