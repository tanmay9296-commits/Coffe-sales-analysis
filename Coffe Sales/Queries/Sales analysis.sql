select * from shop_sales;


 -- sales
select round(sum(unit_price * transaction_qty)) as total_sales
from shop_sales
where 
month(transaction_date) = 5;

-- MOM Growth
 select 
	month(transaction_date) as month,
    round(sum(unit_price * transaction_qty)) as total_sales,
    (sum(unit_price * transaction_qty) - lag(sum(unit_price * transaction_qty),1)
    over (order by month(transaction_date))) / lag(sum(unit_price * transaction_qty),1)
    over (order by month(transaction_date)) * 100 as mom_increase_percentage
from shop_sales
where
	month(transaction_date) in (4,5)
group by 
	month(transaction_date)
order by 
	month(transaction_date);
    



-- Orders
select count(transaction_id) as total_orders
from shop_sales
where 
month(transaction_date) = 5;

 -- MOM Growth
 select 
	month(transaction_date) as month,
    round(count(transaction_id)) as total_orders,
    (count(transaction_id) - lag(count(transaction_id),1)
    over (order by month(transaction_date))) / lag(count(transaction_id),1)
    over (order by month(transaction_date)) * 100 as mom_increase_percentage
from 
	shop_sales
where
	month(transaction_date) in (4,5)
group by 
	month(transaction_date)
order by 
	month(transaction_date);
    
    
    
    
-- Quantity
select SUM(transaction_qty) as total_orders
from shop_sales
where 
month(transaction_date) = 5;

-- MOM Growth
select
month(transaction_date) as month,
round(SUM(transaction_qty)) as total_orders,
(SUM(transaction_qty) - lag(SUM(transaction_qty) ,1)
over (order by month (transaction_date))) / lag(SUM(transaction_qty) ,1)
over (order by month(transaction_date)) * 100 as increase_percentage
from 
	shop_sales
where 
	month(transaction_date) IN (4,5)
group by
	month(transaction_date)
order by
	month(transaction_date);
