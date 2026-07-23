--Create a View to make analysis simple
CREATE VIEW clean_ecommerce_products AS 
SELECT product_name,price,discount, main_category,available_color FROM mens_clothing_data
UNION ALL
SELECT product_name,price,discount, main_category,available_color FROM womens_clothing_data
UNION ALL 
SELECT product_name,price,discount, main_category,available_color FROM baby_maternity_data
UNION ALL
SELECT product_name,price,discount, main_category,available_color FROM beauty_health
UNION ALL
SELECT product_name,price,discount, main_category,available_color FROM shoes_data;

--LET'S CHECK VIEW
SELECT * FROM clean_ecommerce_products limit 10;
--LET'S CHECK TOTAL COUNT
SELECT count(*) as total from clean_ecommerce_products;
--LET'S CHECK TOTAL CATEGORY
SELECT main_category , count(*) as total_products
from clean_ecommerce_products group by main_category;


--LET'S SEE PRICING AND DISCOUNT 

-- LET'S CHECK CATEGORY WISE PRICING & DISCOUNT SUMMARY
SELECT main_category, count(product_name) as total_products,ROUND(AVG(price),2) as avg_original_price,
ROUND(avg(discount),2) as avg_discount_percent , ROUND(AVG(price-(price*discount/100)),2) as avg_selling_price
from clean_ecommerce_products
group by main_category
order by avg_discount_percent desc;

--HIGH DISCOUNT & LOW DISCOUNT
SELECT main_category,
CASE when discount >=50 then 'Heavy Discount(50%+)'
when discount between 20 and 49 then 'Moderate Discount(20-50)'
else 'Low DISCOUNT'
END AS discount_bracket,
count(*) as product_count
from clean_ecommerce_products
group by main_category , 2
order by main_category,product_count desc;

-- HIGH VALUE vs LOW VALUE PRODUCTS
SELECT main_category,
case when price<8 then 'Budget/low price(<8$)'
when price between 8 and 20 then 'Mid range($8-$20)'
else 'Premium(>$20)'
end as price_tier,
count(*) as product_count,
round(avg(discount),2) as avg_discount
from clean_ecommerce_products
group by main_category,2
order by main_category,product_count desc;