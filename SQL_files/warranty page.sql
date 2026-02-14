-- store level warranty claims
select st.store_name,count(claim_id) as claims from sales s
join store st
on s.store_id=st.store_id
group by st.store_name
order by claims desc

--  How many warranty claims are in each repair_status?
select repair_status, count(claim_id) as claims_count from warranty
group by repair_status

-- Monthly Warranty Claims Trend
select d.year,d.month,count(claim_id) as claim_counts from warranty w
join dim_date d
on w.claim_date_id=d.date_id
group by d.year,d.month
order by d.month


-- Category wise claim count
select c.category_name, count(claim_id) as claim_counts from  sales s
join category c
on s.cat_id=c.cat_id
group by c.category_name
order by claim_counts desc


-- Product wise claim count
select p.product_name,count(claim_id) as Total_Claims from sales s
join products p
on p.product_id=s.product_id
group by product_name
order by total_claims desc


-- How many warranty claims occurred each year?
select d.year,count(claim_id) as total_claims from sales s
join dim_date d
on sale_date_id=d.date_id
group by d.year
order by total_claims desc