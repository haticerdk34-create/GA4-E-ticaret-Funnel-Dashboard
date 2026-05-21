WITH base AS (
  SELECT
    user_pseudo_id,
    event_name
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
)

SELECT 'Session Start' AS step, COUNT(*) AS users, 1 AS step_order
FROM base
WHERE event_name = 'session_start'

UNION ALL

SELECT 'Product View', COUNT(*), 2
FROM base
WHERE event_name = 'view_item'

UNION ALL

SELECT 'Add To Cart', COUNT(*), 3
FROM base
WHERE event_name = 'add_to_cart'

UNION ALL

SELECT 'Begin Checkout', COUNT(*), 4
FROM base
WHERE event_name = 'begin_checkout'

UNION ALL

SELECT 'Add Shipping Info', COUNT(*), 5
FROM base
WHERE event_name = 'add_shipping_info'

UNION ALL

SELECT 'Add Payment Info', COUNT(*), 6
FROM base
WHERE event_name = 'add_payment_info'

UNION ALL

SELECT 'Purchase', COUNT(*), 7
FROM base
WHERE event_name = 'purchase'
ORDER BY step_order
