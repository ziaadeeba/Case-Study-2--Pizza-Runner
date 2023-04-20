
--Ques.If Danny wants to expand his range of pizzas - how would this impact the existing data design? 
--Write an INSERT statement to demonstrate what would happen if a new Supreme pizza with all the toppings was added to the Pizza Runner menu?


select * from pizza_names

insert into pizza_names
VALUES(3, 'Supreme')

insert into pizza_recipes
VALUES(3, '1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12');
select * from pizza_names
select * from pizza_recipes
