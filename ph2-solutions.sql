/* SQL "Sakila" database query exercises - phase 1 */

-- Database context
USE sakila;

-- Your solutions...
1a.select first_name,last_name from actor;

1b.select upper(concat(first_name,' ', last_name)) from actor;

2a.select actor_id , first_name,last_name from actor where first_name ="Joe";

2b.select actor_id , first_name,last_name from actor where last_name like "%GEN%";

2c. select actor_id , first_name,last_name from actor where last_name like "%LI%" order by last_name ,first_name;

2d.select country_id,country from country where country in ('Afghanistan','Bangladesh','China');

3a.alter table actor add middlename varchar(45) after first_name;

3b.alter table actor modify middlename BLOB;

3c.alter table actor drop middlename;

4a.select last_name, count(last_name) from actor group by last_name;

4b.select last_name, count(last_name) from actor group by last_name having count(last_name) >1;

4c. update actor set first_name = "HARPO" where first_name = "GROUCHO" and last_name="WILLIAMS";

4d.update actor set first_name = "MUCHO GROUCHO" where first_name = "HARPO" and last_name="WILLIAMS";

5.show create table address;

6a.select s.first_name,s.last_name,a.address,a.address2,a.district,a.location from staff as s join address as a on a.address_id = s.address_id;

6b.select s.first_name,s.staff_id,sum(p.amount) from staff as s join payment as p on p.staff_id = s.staff_id where payment_date like "2005%" group by s.staff_id;

6c.select f.title,fa.film_id,count(fa.actor_id) from film_actor as fa join film as f on fa.film_id = f.film_id group by f.film_id;

6d.select f.title,count(i.inventory_id) from film as f join inventory as i on i.film_id = f.film_id where f.title = "Hunchback Impossible" group by i.film_id;

6e.select c.first_name, c.last_name , sum(p.amount) from payment as p join customer as c on p.customer_id = c.customer_id group by p.customer_id order by last_name;

7a.select * from film where language_id in ( select language_id from language where name = 'ENGLISH' ) and ( title like 'K%' or title like 'Q%' ) ;

7b.select first_name,last_name from actor where actor_id in (select fa.actor_id from film as f join film_actor as fa on fa.film_id = f.film_id where title = 'Alone Trip');

7c.select c.first_name,c.last_name,c.email from customer as c join customer_list as cl on c.customer_id = cl.ID where cl.country = 'Canada';

7d.select f.title from film as f join film_list as fl on f.film_id =fl.FID where fl.category = "Family";

7e.select count(i.film_id),f.title from rental as r join inventory as i on r.inventory_id = i.inventory_id join film as f on f.film_id = i.film_id group by f.film_id order by count(i.film_id) desc;

7f.select store,concat(total_sales ,'$') as Total_dollar from sales_by_store;

7g.select s.store_id,ct.city,c.country from store as s join address as a on s.address_id = a.address_id join city as ct on a.city_id = ct.city_id join country as c on ct.country_id = c.country_id;

7h. select sum(b.amount) as total_amount, e.name from rental as a inner join payment as b on a.rental_id = b.rental_id inner join inventory as c on c.inventory_id = a.inventory_id Join film_category
as d on c.film_id = d.film_id Join category as e on d.category_id = e.category_id Group by e.name order by total_amount desc limit 5;

8a.create view V as ( select sum(b.amount) as total_amount, e.name from rental as a inner join payment as b on a.rental_id = b.rental_id inner join inventory as c on c.inventory_id = a.inventory_id Join film_category
   as d on c.film_id = d.film_id Join category as e on d.category_id = e.category_id Group by e.name order by total_amount desc limit 5);

8b.select * from V;

8c.drop view V;