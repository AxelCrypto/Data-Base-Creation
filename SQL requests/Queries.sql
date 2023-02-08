-- Query 1 : which movie has the most number of actors ?
SELECT title, film_id, count(actor_id) as tot_actors
FROM actors

left join actors_film
on actors.actor_id = actors_film.actors_actor_id 

left join film
on film.film_id = actors_film.film_film_id

group by title, film_id

order by tot_actors desc

limit 5
;
-- Result: boondock ballroom with 6 actors

-- Query 2 -- Which actor made most movies ? 
SELECT first_name, last_name,actor_id, count(actor_id)
FROM actors

left join actors_film
on actors.actor_id = actors_film.actors_actor_id 

group by first_name, last_name,actor_id	
order by count(actor_id) desc
limit 5
;

-- Result is : Sandra kilmer with 37 movies

-- Query 3 : Which movie was the most rented

select title, film.film_id, count(rental.film_id)

from rental

left join film
on film.film_id = rental.film_id

group by title, film.film_id
order by count(rental.film_id) desc

limit 5 
;
-- Result is : boogie amelie with 4 rents



-- Query 4 -- who are the actors of this movie ? 

SELECT first_name, last_name, actor_id
FROM actors

left join actors_film
on actors.actor_id = actors_film.actors_actor_id 

WHERE film_film_id = 86

;

-- Result is : Kevin Bloom.


-- Query 5 -- Which genre is this movie ? 
select title, genre

from film

where title = 'boogie amelie'

;
-- Result : music



-- Query 6 -- Which genre has the most movies ? 

select genre, count(title)
from film

group by genre
order by count(title) desc

limit 5
;

-- Result is : Documentaries.


-- Query 6 -- which genre is the most rented ?

select genre, count(rental.film_id)

from rental

left join film
on film.film_id = rental.film_id

group by genre
order by count(rental.film_id) desc

limit 5 

-- result: documentaries
;
-- Query 7 What's least rented genre ? 
select genre, count(rental.film_id)

from rental

left join film
on film.film_id = rental.film_id

group by genre
order by count(rental.film_id) asc

limit 5 

-- result: children and horror movies
;

-- Query 8: Who's the most prolific actor in the documentary genre ? 

select genre, first_name, last_name, count(actor_id)

from film

left join actors_film
on actors_film.film_film_id = film.film_id

left join actors
on actors_film.actors_actor_id = actors.actor_id

where genre = 'documentary'

group by first_name, last_name, genre

order by count(actor_id) desc


limit 5 
;

-- result : Ed Chase with 6 documentaries

-- Query 9: Did Ed participated in other types of movies ?

select genre, first_name, last_name, count(actor_id)

from film

left join actors_film
on actors_film.film_film_id = film.film_id

left join actors
on actors_film.actors_actor_id = actors.actor_id

where first_name = 'ed' and not genre = 'documentary'

group by first_name, last_name, genre

order by count(actor_id) desc


limit 5 
;
-- Result: drama, sports, action, foreign, new
-- what an actor !