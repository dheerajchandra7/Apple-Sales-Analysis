-- Stores Information
 SELECT 
    st.store_id,
    store_name,
    city,
    country
FROM store st

left join sales s
on s.store_id=st.store_id
where s.sale_id is null

-- count of stores in each country
select country, count(store_id) as total_stores from store
group by country
order by total_stores desc


-- Stores With No Sales
select sl.store_id,s.store_name from sales sl
join store s
on sl.store_id=s.store_id
where sl.store_id is null

-- Store-wise Sales Volume
select st.store_name,sum(s.quantity)as quantity from sales s
join store st
on s.store_id=st.store_id
group by st.store_name
order by quantity desc

-- Which cities contribute most to sales?
select st.city, sum(s.quantity) as total_units from sales s
join store st
on s.store_id=st.store_id
group by st.city
order by total_units desc

-- What is the top product per store?
SELECT 
    store_name,
    product_name,
    total_units
FROM (
    SELECT 
        st.store_name,
        p.product_name,
        SUM(s.quantity) AS total_units,
        ROW_NUMBER() OVER (
            PARTITION BY st.store_name
            ORDER BY SUM(s.quantity) DESC
        ) AS rn
    FROM sales s
    JOIN store st ON s.store_id = st.store_id
    JOIN products p ON s.product_id = p.product_id
    GROUP BY st.store_name, p.product_name
) t
WHERE rn = 1;

-- Average Store Revenue
SELECT 
    AVG(store_revenue) AS avg_store_revenue
FROM (
    SELECT 
        st.store_id,
        SUM(p.price * s.quantity) AS store_revenue
    FROM sales s
    JOIN products p ON p.product_id = s.product_id
    JOIN store st ON st.store_id = s.store_id
    GROUP BY st.store_id
) t;
