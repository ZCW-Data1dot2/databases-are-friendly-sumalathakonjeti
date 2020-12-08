/* SQL "Sakila" database query exercises - phase 1 */

-- Database context
USE sakila;

-- Your solutions...
1 .select * from actor where first_name = "Scarlett";

2.select * from actor where last_name = "Johansson";

3.select count(distinct(last_name)) from actor;

4.select last_name from actor  group by last_name having count(last_name) = 1;

5.select last_name from actor  group by last_name having count(last_name) > 1;

6.select a.first_name,a.last_name,count(f.actor_id) as count_films from actor as a join film_actor as f on a.actor_id = f.actor_id group by f.actor_id order by count_films desc limit 1;

7.select f.film_id,f.title,i.store_id from inventory as i join store as s on i.store_id = s.store_id join film as f on f.film_id = i.film_id  where s.store_id =1 and f.title='Academy Dinosaur';

8.

9.

10.select avg(length) from film;

11.select fc.category_id,f.film_id,avg(f.length) from film as f join film_category as fc on fc.film_id = f.film_id group by fc.category_id;