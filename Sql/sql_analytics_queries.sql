--confirm that the tables exist after the import
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_type = 'BASE TABLE'
ORDER BY table_name;

--preview the records
SELECT *
FROM sales
LIMIT 10;

SELECT *
FROM calendar
LIMIT 10;

SELECT *
FROM customer_features 
LIMIT 10;

SELECT *
FROM customers 
LIMIT 10;

SELECT *
FROM products 
LIMIT 10;

SELECT *
FROM stores 
LIMIT 10;

SELECT *
FROM targets 
LIMIT 10;

--SQL Analytics
--Query total sales and profit
SELECT
    SUM("Total_Sales") AS net_sales,
    SUM("Profit") AS total_profit,
    COUNT(DISTINCT "Invoice_No") AS total_orders,
    ROUND(
        (SUM("Profit") * 100.0
        / NULLIF(SUM("Total_Sales"), 0))::numeric,
        2
    ) AS profit_margin_percentage
FROM sales;

--Finding the highest perfoming prodct categories
SELECT
    p."Category",
    SUM(s."Total_Sales") AS net_sales,
    SUM(s."Profit") AS total_profit,
    SUM(s."Quantity") AS units_sold
FROM sales s
JOIN products p
    ON s."Product_ID" = p."Product_ID"
GROUP BY p."Category"
ORDER BY net_sales DESC;



--rank stores by revenue
SELECT
    st."Store_Name",
    st."City",
    SUM(s."Total_Sales") AS net_sales,

    RANK() OVER (
        ORDER BY SUM(s."Total_Sales") DESC
    ) AS sales_rank

FROM sales s

JOIN stores st
    ON s."Store_ID" = st."Store_ID"

GROUP BY
    st."Store_Name",
    st."City"

ORDER BY sales_rank;

--Compare actual sales with targets
WITH monthly_actuals AS (
    SELECT
        "Store_ID",
        EXTRACT(
            YEAR FROM "Invoice_Date"::date
        )::int AS year,

        EXTRACT(
            MONTH FROM "Invoice_Date"::date
        )::int AS month_number,

        SUM("Total_Sales") AS actual_sales

    FROM sales

    GROUP BY 1, 2, 3
)

SELECT
    st."Store_Name",
    a.year,
    a.month_number,
    a.actual_sales,
    t."Monthly_Sales_Target",

    ROUND(
        100.0 * a.actual_sales
        / NULLIF(t."Monthly_Sales_Target", 0),
        2
    ) AS target_attainment_pct

FROM monthly_actuals a

JOIN targets t
    ON a."Store_ID" = t."Store_ID"
    AND a.year = t."Year"
    AND a.month_number = t."Month_Number"

JOIN stores st
    ON a."Store_ID" = st."Store_ID"

ORDER BY
    a.month_number,
    st."Store_Name";

--perform RFM analysis
WITH customer_metrics AS (
    SELECT
        "Customer_ID",
        MAX("Invoice_Date"::date) AS last_purchase_date,
        COUNT(DISTINCT "Invoice_No") AS frequency,
        SUM("Total_Sales") AS monetary_value

    FROM sales

    GROUP BY "Customer_ID"
)

SELECT
    "Customer_ID",

    DATE '2025-12-31'
        - last_purchase_date AS recency_days,

    frequency,

    monetary_value

FROM customer_metrics

ORDER BY monetary_value DESC;

/*
observations

1.After qerying the total sales and profits ;
 -snacks is the product with the highest sales across the store
 -snacks is the product with the hihest profitability
 -Meat and sea food has the lowest sales and profitability
2.Finding the highest performing product categories which;
 - snacks
3.Ranking stores by revenue
 -Freshchoice CBD Nairobi is the one with the highest revenue
 -Freshchoice Yala nakuru is the one with the lowest revenue

*/


















