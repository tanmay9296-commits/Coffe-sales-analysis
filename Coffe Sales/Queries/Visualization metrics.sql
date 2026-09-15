select * from shop_sales;
use coffe_db
-- calender heatmap metrics

select
	concat(round(sum(transaction_qty * unit_price)/1000,1),'k') as total_sales,
    concat(round(count(transaction_id)/1000,1),'k') as total_orders,
    concat(round(sum(transaction_qty)/1000,1),'k') as total_qty_sold
from shop_sales
where
	transaction_date = '2023-04-01';
    
    
-- weekdays and weekend 

select 
	case when weekday(transaction_date) in (1,7) then 'weekend'
    else 'weekdays'
    end as day_type,
    concat(round(sum(transaction_qty * unit_price)/1000,1),'k') as total_sales
from shop_sales
where month(transaction_date) = 5
group by
	case when weekday(transaction_date) in (1,7) then 'weekend'
    else 'weekdays'
    end;
    
    
-- Sales by store location

select 
	store_location,
    concat(round(sum(transaction_qty * unit_price)/1000,1),'k') as total_sales
    from shop_sales
where month(transaction_date) = 5
group by store_location
order by sum(transaction_qty * unit_price) DESC;
    
    
-- daily sales analysis

select
	transaction_date,
    concat(round(sum(transaction_qty * unit_price)/1000,1),'k') as total_sales
from shop_sales
where
	month(transaction_date) = 5
group by transaction_date
order by transaction_date;


-- avg daily
select
	concat(round(avg(total_sales)/1000,1),'k') as Avg_Sales
from
	(
		select
        sum(transaction_qty * unit_price) as total_sales
        from shop_sales
        where
		month(transaction_date) = 5
		group by transaction_date
		order by transaction_date
    ) as internal_query;
   
   
    
-- daily    
select
	day(transaction_date),
    concat(round(sum(transaction_qty * unit_price)/1000,1),'k') as total_sales
from shop_sales
where
	month(transaction_date) = 5
group by transaction_date
order by transaction_date;



-- avg metric
select
	day_of_month,
    case
		when total_sales > avg_sales then 'Above Average'
        when total_sales < avg_sales then 'Below Average'
        else 'equal to average'
        end as sales_status,
        total_sales
	from 
		( select
        day(transaction_date) as day_of_month,	
		sum(transaction_qty * unit_price) as total_sales,
        avg(sum(transaction_qty * unit_price)) over() as avg_sales
        from 
			shop_sales
		where month(transaction_date) = 5
        group by day(transaction_date)
        ) as sales_data
        order by day_of_month;
        
        
	-- sales By product category
    select 
		product_category,
        concat(round(sum(transaction_qty * unit_price)/1000,1),'k') as total_sales
	from shop_sales
    where 
    month(transaction_date) = 5 
    group by product_category
    order by sum(transaction_qty * unit_price) desc;
    
    -- top 10 product
     select 
		product_type,
        concat(round(sum(transaction_qty * unit_price)/1000,1),'k') as total_sales
	from shop_sales
    where 
    month(transaction_date) = 5 and product_category ='Coffee'
    group by product_type
    order by sum(transaction_qty * unit_price) desc
    limit 10;
    
    
-- sale by day and hour

 select 
        concat(round(sum(transaction_qty * unit_price)/1000,1),'k') as total_sales,
        sum(transaction_qty) as total_qty,
        count(*)
	from shop_sales
    where 
    month(transaction_date) = 5 
    and dayofweek(transaction_date) = 1
    and hour(transaction_time) = 14;
    
    
-- day
select
	case 
    when dayofweek(transaction_date) = 2 then 'Monday'
    when dayofweek(transaction_date) = 3 then 'Tuesday'
    when dayofweek(transaction_date) = 4 then 'Wednesday'
    when dayofweek(transaction_date) = 5 then 'Thursday'
    when dayofweek(transaction_date) = 6 then 'Friday'
    when dayofweek(transaction_date) = 7 then 'Saturday'
    else 'Sunday'
    end as Day_of_week,
    concat(round(sum(transaction_qty * unit_price)/1000,1),'k') as total_sales
from shop_sales
where month(transaction_date) = 5
group by case 
    when dayofweek(transaction_date) = 2 then 'Monday'
    when dayofweek(transaction_date) = 3 then 'Tuesday'
    when dayofweek(transaction_date) = 4 then 'Wednesday'
    when dayofweek(transaction_date) = 5 then 'Thursday'
    when dayofweek(transaction_date) = 6 then 'Friday'
    when dayofweek(transaction_date) = 7 then 'Saturday'
    else 'Sunday'
    end ;


    