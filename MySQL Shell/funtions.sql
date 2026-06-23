show databases;
use northwind;

show tables;

select * from orders;
select count(distinct shipper_id) from orders where shipper_id is not null;


# count the no of customers from new york city

select count(distinct customer_id)  from orders where ship_city='Chicago'; 





