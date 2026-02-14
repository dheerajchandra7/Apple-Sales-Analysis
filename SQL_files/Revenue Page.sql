-- Total Revenue
select sum(s.quantity*p.price) as Total_Revenue from sales s
join products p
on s.product_id=p.product_id

-- revenue by product category
select c.category_name,sum(s.quantity*p.price) as Total_Revenue from sales s
join products p
on s.product_id=p.product_id
join category c
on s.cat_id=c.cat_id
group by c.category_name
order by total_revenue desc


-- City-level Product Demand
select st.city,p.product_name,sum(s.quantity*p.price) as Total_Revenue from sales s
join products p
on s.product_id=p.product_id
join store st
on s.store_id=st.store_id
group by st.city,p.product_name
order by total_revenue desc

-- Total Revenue by Year
select d.year,sum(s.quantity*p.price) as Total_Revenue from sales s
join products p
on s.product_id=p.product_id
join dim_date d
on s.sale_date_id=d.date_id
group by d.year
order by total_revenue desc


-- Find sales with bulk quantity (assuming bulk quantity is >=3)
select s.product_id,p.product_name,s.quantity from sales s
join products p
on s.product_id=p.product_id
where s.quantity>=3
order by s.quantity desc


-- Revenue without warranty claims
select sum(s.quantity*p.price) as Total_Revenue from sales s
join products p
on s.product_id=p.product_id
where s.claim_id is null