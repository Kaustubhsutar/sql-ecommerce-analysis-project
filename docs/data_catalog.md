# 📘 Data Catalog

## Table: `user_events`

### 🎯 Purpose
The `user_events` table stores user interaction data for an e-commerce platform.  
It captures user activity such as product interactions, purchase behavior, traffic sources, and transaction amounts.  

This table is primarily used for:
- Funnel analysis
- User behavior analytics
- Revenue tracking
- Marketing performance analysis

---

## 🧱 Column Definitions

| Column Name      | Data Type | Description |
|------------------|----------|-------------|
| `event_id`       | INT64    | Unique identifier for each event record. |
| `user_id`        | INT64    | Unique identifier representing a user. |
| `event_type`     | STRING   | Type of event performed by the user (e.g., `view`, `add_to_cart`, `purchase`). |
| `event_date`     | STRING   | Date when the event occurred. Recommended to cast to `DATE` or `TIMESTAMP` during analysis. |
| `product_id`     | INT64    | Unique identifier of the product involved in the event. |
| `amount`         | FLOAT64  | Monetary value associated with the event. Typically populated for purchase events. |
| `traffic_source` | STRING   | Source from which the user arrived (e.g., `organic`, `paid_ads`, `referral`, `direct`). |

---

## 📊 Data Usage Notes

- `event_date` should be converted to `DATE` or `TIMESTAMP` in transformation layers.
- `amount` may contain `NULL` or `0` values for non-purchase events.
- Funnel stages can be derived from `event_type`:
  - `view`
  - `add_to_cart`
  - `checkout`
  - `purchase`
  
