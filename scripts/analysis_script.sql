/* =========================================================
   Sample Data Preview
   ========================================================= */
SELECT
    *
FROM `linen-age-439914-j1.e_commerce_data_analysis.user_events`
LIMIT 1000;

/* =========================================================
   View: vw_user_events_last_30_days
   Purpose: Centralized rolling 30-day snapshot to eliminate 
   repeated date filters across analytical queries.
   ========================================================= */

CREATE OR REPLACE VIEW 
`linen-age-439914-j1.e_commerce_data_analysis.vw_user_events_last_30_days`
AS
SELECT
    *
FROM `linen-age-439914-j1.e_commerce_data_analysis.user_events`
WHERE event_date >= TIMESTAMP(DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY))
;


/* =========================================================
   1️⃣ Sales Funnel – User Count at Each Stage (Last 30 Days)
   ========================================================= */
WITH funnel_stages AS (
    SELECT
        COUNT(DISTINCT CASE WHEN event_type = 'page_view'      THEN user_id END) AS views,
        COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart'    THEN user_id END) AS cart,
        COUNT(DISTINCT CASE WHEN event_type = 'checkout_start' THEN user_id END) AS checkout,
        COUNT(DISTINCT CASE WHEN event_type = 'payment_info'   THEN user_id END) AS payment,
        COUNT(DISTINCT CASE WHEN event_type = 'purchase'       THEN user_id END) AS purchases
    FROM e_commerce_data_analysis.vw_user_events_last_30_days
)

SELECT *
FROM funnel_stages;



/* =========================================================
   2️⃣ Funnel Conversion Rates (Step-to-Step + Overall)
   - Uses SAFE_DIVIDE to prevent division-by-zero errors
   ========================================================= */
WITH funnel_stages AS (
    SELECT
        COUNT(DISTINCT CASE WHEN event_type = 'page_view'      THEN user_id END) AS views,
        COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart'    THEN user_id END) AS cart,
        COUNT(DISTINCT CASE WHEN event_type = 'checkout_start' THEN user_id END) AS checkout,
        COUNT(DISTINCT CASE WHEN event_type = 'payment_info'   THEN user_id END) AS payment,
        COUNT(DISTINCT CASE WHEN event_type = 'purchase'       THEN user_id END) AS purchases
    FROM e_commerce_data_analysis.vw_user_events_last_30_days
)

SELECT
    views,
    cart,
    ROUND(SAFE_DIVIDE(cart, views) * 100, 2)        AS view_to_cart_rate,
    checkout,
    ROUND(SAFE_DIVIDE(checkout, cart) * 100, 2)     AS cart_to_checkout_rate,
    payment,
    ROUND(SAFE_DIVIDE(payment, checkout) * 100, 2)  AS checkout_to_payment_rate,
    purchases,
    ROUND(SAFE_DIVIDE(purchases, payment) * 100, 2) AS payment_to_purchase_rate,
    ROUND(SAFE_DIVIDE(purchases, views) * 100, 2)   AS overall_conversion_rate
FROM funnel_stages;



/* =========================================================
   3️⃣ Funnel Conversion by Traffic Source
   - Identifies high-performing acquisition channels
   ========================================================= */
WITH funnel_by_source AS (
    SELECT
        traffic_source,
        COUNT(DISTINCT CASE WHEN event_type = 'page_view'   THEN user_id END) AS views,
        COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' THEN user_id END) AS cart,
        COUNT(DISTINCT CASE WHEN event_type = 'purchase'    THEN user_id END) AS purchases
    FROM e_commerce_data_analysis.vw_user_events_last_30_days
    GROUP BY traffic_source
)

SELECT
    traffic_source,
    views,
    cart,
    purchases,
    ROUND(SAFE_DIVIDE(cart, views) * 100, 2)        AS view_to_cart_rate,
    ROUND(SAFE_DIVIDE(purchases, views) * 100, 2)   AS purchase_conversion_rate,
    ROUND(SAFE_DIVIDE(purchases, cart) * 100, 2)    AS cart_to_purchase_rate
FROM funnel_by_source
ORDER BY purchases DESC;



/* =========================================================
   4️⃣ Time-to-Conversion Analysis
   - Measures average time between funnel stages
   - Includes only users who completed purchase
   ========================================================= */
WITH user_journey AS (
    SELECT
        user_id,
        MIN(CASE WHEN event_type = 'page_view'   THEN event_date END) AS view_time,
        MIN(CASE WHEN event_type = 'add_to_cart' THEN event_date END) AS cart_time,
        MIN(CASE WHEN event_type = 'purchase'    THEN event_date END) AS purchase_time
    FROM e_commerce_data_analysis.vw_user_events_last_30_days
    GROUP BY user_id
    HAVING purchase_time IS NOT NULL
)

SELECT
    COUNT(*) AS converted_users,
    ROUND(AVG(TIMESTAMP_DIFF(cart_time, view_time, MINUTE)), 2)       AS avg_view_to_cart_minutes,
    ROUND(AVG(TIMESTAMP_DIFF(purchase_time, cart_time, MINUTE)), 2)   AS avg_cart_to_purchase_minutes,
    ROUND(AVG(TIMESTAMP_DIFF(purchase_time, view_time, MINUTE)), 2)   AS avg_total_conversion_minutes
FROM user_journey;


/* =========================================================
   5️⃣ Revenue & Monetization Metrics
   - Calculates AOV and revenue efficiency metrics
   ========================================================= */
WITH revenue_metrics AS (
    SELECT
        COUNT(DISTINCT CASE WHEN event_type = 'page_view' THEN user_id END) AS total_visitors,
        COUNT(DISTINCT CASE WHEN event_type = 'purchase'  THEN user_id END) AS total_buyers,
        SUM(CASE WHEN event_type = 'purchase' THEN amount ELSE 0 END)       AS total_revenue,
        COUNTIF(event_type = 'purchase')                                    AS total_orders
    FROM e_commerce_data_analysis.vw_user_events_last_30_days
)

SELECT
    total_visitors,
    total_buyers,
    total_orders,
    ROUND(total_revenue, 2)                                AS total_revenue,
    ROUND(SAFE_DIVIDE(total_revenue, total_orders), 2)     AS avg_order_value,
    ROUND(SAFE_DIVIDE(total_revenue, total_buyers), 2)     AS revenue_per_buyer,
    ROUND(SAFE_DIVIDE(total_revenue, total_visitors), 2)   AS revenue_per_visitor
FROM revenue_metrics;

