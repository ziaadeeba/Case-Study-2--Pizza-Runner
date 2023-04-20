 --Cleaning the runner_orders table
        UPDATE runner_orders
        SET cancellation = ' '
        WHERE cancellation IS NULL

        UPDATE runner_orders
        SET cancellation = ' '
        WHERE cancellation = 'null'

        UPDATE runner_orders
        SET duration = ' '
        WHERE duration = 'null'

        UPDATE runner_orders
        SET distance = ' '
        WHERE distance = 'null'

        UPDATE runner_orders
        SET pickup_time = ' '
        WHERE pickup_time = 'null'
        
        update runner_orders
        set distance='20' 
        where order_id=1 or order_id=2

        update runner_orders
        set distance='13.4'
        where order_id=3

        update runner_orders
        set distance='23.4' 
        where order_id=4 or order_id=8

        update runner_orders
        set distance='10'
        where order_id=5

        update runner_orders
        set distance='25'
        where order_id=7

        update runner_orders
        set distance='10'
        where order_id=10
        



 --Cleaning the customer_orders table
        UPDATE customer_orders
        SET exclusions = ' '
        WHERE exclusions = 'null'

        UPDATE customer_orders
        SET extras = ' '
        WHERE extras = 'null'

        UPDATE customer_orders
        SET extras = ' '
        WHERE extras IS NULL
        
        
  --Cleaning the runners table
    	UPDATE runners
	SET registration_date = '2020-01-01'
	WHERE runner_id = 1

	UPDATE runners
	SET registration_date = '2020-01-03'
	WHERE runner_id = 2

	UPDATE runners
	SET registration_date = '2020-01-08'
	WHERE runner_id = 3

	UPDATE runners
	SET registration_date = '2020-01-15'
	WHERE runner_id = 4
    
    
    


