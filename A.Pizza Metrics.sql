--1.How many pizzas were ordered?
select count(order_id) number_of_pizzas_ordered
from customer_orders



--2.How many unique customer orders were made?
SELECT customer_id, COUNT (Distinct order_id) AS unique_orders
FROM customer_orders
GROUP BY customer_id
  
  
  
--3.How many successful orders were delivered by each runner?
select runners.runner_id,count(*) as successfull_orders
from runner_orders 
left join runners on runner_orders.runner_id=runners.runner_id
where cancellation=''
group by runners.runner_id



--4.How many of each type of pizza was delivered?
select cast(pizza_name as varchar) type_of_pizza,count(*) quantity
from customer_orders join runner_orders 
on customer_orders.order_id=runner_orders.order_id
join pizza_names on pizza_names.pizza_id=customer_orders.pizza_id
where cancellation=''
group by cast(pizza_name as varchar)




--5.How many Vegetarian and Meatlovers were ordered by each customer?

select customer_id,cast (pizza_name as varchar) type_of_pizza,
count(*) count_of_pizza
from pizza_names
join customer_orders on 
pizza_names.pizza_id=customer_orders.pizza_id
group by customer_id,cast (pizza_name as varchar)
order by customer_id



--6. What was the maximum number of pizzas delivered in a single order?
with cte as (
select runner_orders.order_id,
row_number() over (partition by runner_orders.order_id order by runner_orders.order_id) as rn
from customer_orders join runner_orders
on customer_orders.order_id=runner_orders.order_id
where cancellation='')
select rn as max_pizza_delivered 
from cte where rn=(select max(rn) from cte)



--7.For each customer, how many delivered pizzas had at least 1 change and how many had no changes?
with cte as (
select customer_orders.order_id,customer_id,extras,exclusions
from customer_orders
join runner_orders on 
customer_orders.order_id=runner_orders.order_id
where cancellation='')
select customer_id,
sum(case when exclusions!='' or extras!='' then 1 else 0 end) atleast_one_change,
sum(case when exclusions='' and extras ='' then 1 else 0 end) no_change
from cte
group by customer_id



--8.How many pizzas were delivered that had both exclusions and extras?
select customer_id,count(*) no_of_pizzas 
from customer_orders join runner_orders
on customer_orders.order_id=runner_orders.order_id
where exclusions<>'' and extras<>'' and cancellation=''
group by customer_id



--9.What was the total volume of pizzas ordered for each hour of the day?
select DATEPART(hour,order_time) as hour_of_day,count(*) total_vol_of_pizza
from customer_orders
join runner_orders on 
customer_orders.order_id=runner_orders.order_id
where cancellation=''
group by DATEPART(hour,order_time)



--10.What was the volume of orders for each day of the week?
select DATENAME(weekday,order_time) day_of_the_week,count(*) as volume_of_orders
from customer_orders
join runner_orders on customer_orders.order_id=runner_orders.order_id
where cancellation=''
group by DATENAME(weekday,order_time)
