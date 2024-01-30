#Problem 1
#creating a database
create database shopify;
use shopify;

select * from product_data;
select * from category_data;
#making foreign keys to link 2 tables
alter table product_data add primary key (product_id);

alter table category_data add primary key (category_id);
alter table product_data add constraint category_id foreign key(category_id) references category_data(category_id);

#producing the result
select * from product_data left join category_data on product_data.category_id = category_data.category_id where product_data.category_id = 8;

#Problem 2

alter table user_data add primary key (user_id);
alter table order_data add primary key (order_id);

alter table order_data add constraint user_id foreign key(user_id) references user_data(user_id);

select * from order_data left join user_data on order_data.user_id = user_data.user_id;

SELECT user_data.*, order_data.*, COUNT(*) OVER (PARTITION BY order_data.order_id) AS total_count
FROM order_data
LEFT JOIN user_data ON order_data.user_id = user_data.user_id;

#Problem 4
SELECT order_data.*, user_data.*
FROM order_data
LEFT JOIN user_data ON order_data.user_id = user_data.user_id
ORDER BY order_data.total_amount DESC
LIMIT 5;
