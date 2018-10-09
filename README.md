# README

This project will consume data from `SWAPI: The Star Wars API` and build a navigable web-site from it`. The data will be used to model characters/roles and movie appearances as well as planets and species.

The models/tables will be as follows

Character |
--------- |
name |
homeworld |
films |
    
Appearances |
----------- |
character_id |
film_id |
  
Film |
----- |
title |
episode_id |
opening_crawl |
characters |
poster_uri |
  
Planet |
------ |
name |
rotation_period |
orbital_period |
climate |
terrain |
population |
residents (characters) |

Species |
------- |
name |
classification |
designation |
language |
homeworld |