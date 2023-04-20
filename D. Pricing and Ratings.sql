--Ques1.If a Meat Lovers pizza costs $12 and Vegetarian costs $10 and there were no charges for changes - 
--how much money has Pizza Runner made so far if there are no delivery fees?

select sum(case when cast(pizza_name as varchar)='Meatlovers' then 12 else 10 end) as total_money
from customer_orders 
join runner_orders on runner_orders.order_id=customer_orders.order_id
join pizza_names on pizza_names.pizza_id=customer_orders.pizza_id
where cancellation=''




Ques3.The Pizza Runner team now wants to add an additional ratings system that allows customers to rate their runner,
--how would you design an additional table for this new dataset - generate a schema for this new table and insert your own 
--data for ratings for each successful customer order between 1 to 5.

create table pizza_runner_ratings (
  "order_id" INTEGER,
  "rating" INTEGER,
  "comments" VARCHAR(50)
);

insert into pizza_runner_ratings
values (1, 4, 'Good Service');
insert into pizza_runner_ratings
values (3, 5, 'Excellent Service');
insert into pizza_runner_ratings
values (5, 3, 'Delivery Delayed');
insert into pizza_runner_ratings
values (2, 1, 'Unsatisfied');
insert into pizza_runner_ratings
values (4, 5, 'Excellent Service');



Ques5.If a Meat Lovers pizza was $12 and Vegetarian $10 fixed prices with no cost for extras and each runner is 
--paid $0.30 per kilometre traveled - how much money does Pizza Runner have left over after these deliveries?

with cte as (
select sum(case when cast(pizza_name as varchar)='Meatlovers' then 12 else 10 end) total_pizza_cost,
(select sum(distance) from runner_orders)*0.30 as total_distance_cost
from customer_orders join runner_orders on 
customer_orders.order_id=runner_orders.order_id
join pizza_names on pizza_names.pizza_id=customer_orders.pizza_id
where cancellation='')
select total_pizza_cost-total_distance_cost as money_left from cte







