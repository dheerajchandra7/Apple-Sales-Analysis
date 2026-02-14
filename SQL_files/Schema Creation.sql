-- STAR SCHEMA
-- create date dimension
create table dim_date (
date_id int auto_increment primary key,
full_date date not null,
month int,
month_name varchar(50),
year int,
quarter int);



-- create dimension warratny 
create table warranty_new
(claim_id varchar(50) primary key,
claim_date date,
sale_id varchar(50),
repair_status varchar(200))


-- create store dimension
create table store (
store_id varchar(50) primary key,
store_name varchar(100),
city varchar(100),
country varchar(100)
)


-- create products dimension
create table products
(
product_id varchar(50) primary key,
product_name varchar(75),
cat_id varchar(50),
launch_date date,
price int
)


-- create category dimension
create table category
(cat_id varchar(50) primary key,
category_name varchar(75)
)


-- sales fact table
create table sales
(sale_id varchar(50) primary key,
sale_date date,
sale_date_id INT
store_id varchar(50),
product_id varchar(75),
claim_id varchar(50),
cat_id varchar(50),
quantity int,

foreign key (store_id) references store(store_id),
foreign key (product_id) references products(product_id),
foreign key (claim_id) references warranty(claim_id),
foreign key (cat_id) references category(cat_id)
foreign key (sale_date_id) references dim_date(date_id)
);