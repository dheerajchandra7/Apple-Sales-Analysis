-- Products Page
-- Top 10 Products by Revenue
select p.product_name,sum(p.price*s.quantity) as Revenue from sales s
join products p
on s.product_id=p.product_id
group by p.product_name
order by Revenue desc
limit 10


-- Products Priced Above Category Average
select p.product_name,p.price,c.category_name from products p
join category c
on p.cat_id=c.cat_id
where p.price>(select avg(price) from products where cat_id=p.cat_id)

-- new products launched in the year of 2023
SELECT DISTINCT
    p.product_name,
    p.launch_date
FROM sales s
JOIN products p ON s.product_id = p.product_id
WHERE p.launch_date >= '2023-01-01';


-- Category-wise Product Count
select c.category_name,count(p.product_id) as product_count from products p
join category c 
on p.cat_id=c.cat_id
group by c.category_name
order by product_count desc