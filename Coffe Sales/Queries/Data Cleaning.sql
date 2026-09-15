use coffe_db;
desc shop_sales;

SET SQL_SAFE_UPDATES = 0;

UPDATE shop_sales
set transaction_date = STR_TO_DATE(transaction_date, '%d/%m/%Y');

alter table shop_sales
modify transaction_date DATE;


UPDATE shop_sales
set transaction_time = STR_TO_DATE(transaction_time, '%H:%i:%s');

alter table shop_sales
modify transaction_time TIME;

alter table shop_sales
change column ï»¿transaction_id transaction_id INT;
