# Data-Base-Creation

Objective : build a database from several csv files and extract valuable informations.

3 steps implied : 
 - CSV cleaning
 - Database generation
 - Queries


docs:
    - CSV cleaning : data cleaning in Python
    - formulas : Python formulas used to clean data
    - EER SQL : database structure using EER in My SQL
    - Queries : Queries performed in My SQL



# I. CSV Cleaning
## 1. Automated cleaning
I created a formula which I applied to the 7 csv files which uniformised the data, the caracters, highlight nulls or duplicates. 


## 2. EER SQL
With all column's names from every csv files I created the database visualisation in MySQL.
Thanks to it I could visualise the current structure and what was missing to make it functional. As well as what was not usefull.


###  2.1 Actors to Film 
I used a 'Name + Surname' key, as well as the ones already available to :
- from category I exported the genre of the movie to film table. 
- from actors I exported the actor_id to old_HDD
- from film I exported the film_id to old_ HDD

After deleting all unusefull columns I now have old_HDD which serves as a connection btwn Actors and Films. This intermediary was necessary as their can be many actors in one movie or many movies for one actor.  
The Categories.csv has been deleted after exporting the genre to film.csv. 


image.png

###  2.2 Film to Rental

2 facts: 
- inventory is the link between film and rental. The other columns are unusefull.
- the link towards rental is not complete as in the table inventory which linkes the inventory_id to the film_id, the inventory_id stops at 1k when it stops at 4.5k in rental's table.

2 conclusions:
- There can be many rentals for one movie but only one movie per rental. Therefore we don't need intermediate between rental and intermediary. From the table inventory I exported the film_id to the table rental and removed the inventory table.
- The only link of rental to the rest was through inventory which was not complete as it stoped at 1k. Therefore, I removed all inventory_id >1k from the rental's table as we could not link those to anything.


Final result : 
image.png

I then created the database designed and exported the data.  


## 3. Valuable information

-- Query 1 : which movie has the most number of actors ?
-- Result: boondock ballroom with 6 actors

-- Query 2 -- Which actor made most movies ? 
-- Result is : Sandra kilmer with 37 movies

-- Query 3 : Which movie was the most rented
-- Result is : boogie amelie with 4 rents

-- Query 4 -- who are the actors of this movie ? 
-- Result is : Kevin Bloom.

-- Query 5 -- Which genre is this movie ? 
-- Result : music

-- Query 6 -- Which genre has the most movies ? 
-- Result is : Documentaries.

-- Query 6 -- which genre is the most rented ?
-- result: documentaries

-- Query 7 What's least rented genre ? 
-- result: children and horror movies

-- Query 8: Who's the most prolific actor in the documentary genre ? 
-- result : Ed Chase with 6 documentaries

-- Query 9: Did Ed participated in other types of movies ?
-- Result: drama, sports, action, foreign, new
-- what an actor !

