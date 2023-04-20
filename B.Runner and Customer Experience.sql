--1.How many runners signed up for each 1 week period? (i.e. week starts 2021-01-01)
select datepart(week,registration_date) week_period,
count(*) no_of_runners
from runners
group by datepart(week,registration_date)



--2.What was the average time in minutes it took for each runner to arrive at the Pizza Runner HQ to pickup the order?
with cte as (
SELECT customer_orders.order_id,order_time,pickup_time,customer_id,
runner_id
from customer_orders
join runner_orders
on customer_orders.order_id=runner_orders.order_id
where pickup_time <>'')
select runner_id,avg(abs(DATEDIFF(minute,pickup_time,order_time)))
as avg_time_in_mins
from cte
group by runner_id



--3.Is there any relationship between the number of pizzas and how long the order takes to prepare?
with cte as (select customer_orders.order_id, datediff(minute, order_time, pickup_time) as pickup_minutes
FROM customer_orders
INNER JOIN runner_orders
ON customer_orders.order_id = runner_orders.order_id
WHERE pickup_time <> ' ')
SELECT order_id, count(order_id) as number_of_orders, pickup_minutes
FROM cte
GROUP BY order_id, pickup_minutes


--cleaning duration column


update runner_orders
set duration='32'
where order_id=1 

update runner_orders
set duration='27'
where order_id=2

update runner_orders
set duration='20' 
where order_id=3

update runner_orders
set duration='40'
where order_id=4

update runner_orders
set duration='15'
where order_id=5 or order_id=8

update runner_orders
set duration='25'
where order_id=7

update runner_orders
set duration='10'
where order_id=10



alter table runner_orders
alter column duration int

alter table runner_orders
alter column distance float



--4. What was the average distance travelled for each customer?
select customer_id,avg(cast(runner_orders.distance as numeric)) as avg_distance_travelled
from runner_orders join customer_orders
on runner_orders.order_id=customer_orders.order_id
where pickup_time!=''
group by customer_id



--5. What was the difference between the longest and shortest delivery times for all orders?
select max(runner_orders.duration)-min(runner_orders.duration) as difference
from runner_orders
where duration!=''



--6.What was the average speed for each runner for each delivery and do you notice any trend for these values?
select runner_id,order_id, round(avg(distance/duration*60.0 ),2) speed_in_kmph
from runner_orders
where cancellation =''
group by runner_id,order_id
order by runner_id



--7.What is the successful delivery percentage for each runner?
select runner_id, 
round(100 * sum
(case when duration = 0 then 0
else 1
end) / count(*),2) AS success_delivery_percentage
from runner_orders
group by runner_id
