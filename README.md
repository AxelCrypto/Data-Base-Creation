# Data-Base-Creation 📋

Objective : build a database from several csv files and extract valuable informations.

3 steps implied : 
 - CSV cleaning
 - Database generation
 - Queries


docs:
    - CSV cleaning : data cleaning in Python
    - formulas : Python formulas used to clean data
    - SQL requests : EER and Queries performed in My SQL 



## 1. Automated cleaning 🧹
I created a formula which I applied to the 7 csv files which uniformised the data, the caracters, highlight nulls or duplicates. 


## 2. EER SQL
With all column's names from every csv files I created the database visualisation in MySQL.
Thanks to it I could visualise the current structure and what was missing to make it functional. As well as what was not usefull.


###  2.1 Actors to Film 
I used a 'Name + Surname' key, as well as the ones already available to :
- from category, export the genre of the movie to film table. 
- from actors, export the actor_id to old_HDD
- from film, export the film_id to old_ HDD


I then deleted all unusefull columns as now have old_HDD serves as a connection btwn Actors and Films. This intermediary is necessary as their can be many actors in one movie or many movies for one actor.  
The Categories.csv has been deleted after exporting the genre to film.csv. 

Result: 


![1](https://github.com/AxelCrypto/Data-Base-Creation/blob/main/images/1.png)



###  2.2 Film to Rental

2 facts: 
- inventory is the link between film and rental. The other columns are unusefull.
- the link towards rental is not complete. The table inventory which links the inventory_id to the film_id, its inventory_id stops at 1k when it stops at 4.5k in rental's table.

2 conclusions:
- There can be many rentals for one movie but only one movie per rental. Therefore we don't need intermediate between rental and intermediary. From the table inventory I exported the film_id to the table rental and removed the inventory table.
- The only link of rental to the rest was through inventory which is not complete as it stops at 1k. Therefore, I removed all inventory_id >1k from the rental's table as we could not link those to anything.



I then created the database designed and exported the data.  

Final result:


![2](https://github.com/AxelCrypto/Data-Base-Creation/blob/main/images/2.png)


## 3. Data extraction 🎬

Query 1: What movie has the most number of actors?
Result: "Boondock Saints" with 6 actors.

Query 2: Which actor has made the most movies?
Result: Sandra Bullock with 37 movies.

Query 3: What was the most rented movie?
Result: "Amelie" with 4 rentals.

Query 4: Who are the actors in this movie?
Result: Kevin Bacon.

Query 5: What genre is this movie?
Result: Drama.

Query 6: What is the genre with the most movies?
Result: Drama.

Query 7: What is the most rented genre?
Result: Documentary.

Query 8: Who is the most prolific actor in the documentary genre?
Result: Ed Asner with 6 documentaries.

Query 9: Has Ed participated in other types of movies?
Result: Yes, he has acted in dramas, sports movies, action movies, foreign films, and news. What a versatile actor!
