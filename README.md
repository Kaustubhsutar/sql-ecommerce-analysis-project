<div align="center">

# 🛒 E-Commerce Funnel Optimization & Revenue Intelligence  
### SQL Case Study | Funnel Analytics | Conversion Intelligence | Revenue Optimization

<p align="center">

  <!-- Language & Platform -->

  <img src="https://img.shields.io/badge/SQL-BigQuery-blue?style=for-the-badge&logo=googlebigquery&logoColor=white"/>

  <br>

  <!-- Analytics Performed -->

  <img src="https://img.shields.io/badge/Analytics-Funnel_Analysis-7B61FF?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Analytics-Conversion_Analysis-5B5EA6?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Analytics-Revenue_Intelligence-FF8C00?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Analytics-Customer_Journey_Analytics-00A86B?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Analytics-Traffic_Source_Analysis-008080?style=for-the-badge"/>

  <br>

  <!-- Domain -->

  <img src="https://img.shields.io/badge/Domain-E--Commerce-success?style=for-the-badge"/>

  <br>

  <!-- Project Status & License -->

  <img src="https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge"/>

</p>

### Transforming Customer Journey Data into Revenue Growth Opportunities

A production-style analytics case study focused on uncovering funnel leakage, optimizing acquisition efficiency, improving conversion performance, and generating actionable business intelligence using SQL & BigQuery.

⭐ **If you found this project valuable, consider starring the repository!**

</div>

---

## 📖 Executive Summary

This project analyzes a 30-day e-commerce customer funnel using **SQL in Google BigQuery** to identify:

- Funnel leakage points
- Conversion bottlenecks
- High-performing acquisition channels
- Revenue optimization opportunities
- Customer purchase behavior patterns

The analysis reveals that the **checkout and payment flow are highly optimized**, while the largest business opportunity lies in improving **top-of-funnel engagement** and **cart initiation rates**.

From an acquisition perspective:

- **Email marketing** generates the highest-intent traffic
- **Social traffic** drives volume but underperforms in conversion quality
- Revenue growth can be achieved through **conversion optimization rather than additional traffic acquisition**

This project demonstrates practical business analytics capabilities commonly required in modern **Data Analyst**, **Business Analyst**, and **Analytics Engineering** roles.

---

## 🎯 Business Problem

Modern e-commerce businesses often struggle with:

- High customer drop-off during funnel progression
- Inefficient acquisition spending
- Poor visibility into conversion performance
- Revenue leakage across customer journeys
- Difficulty identifying high-intent traffic sources

Without structured funnel analytics, businesses risk:

- Wasted marketing spend
- Lower customer acquisition efficiency
- Reduced revenue scalability
- Inaccurate performance attribution

This case study addresses these challenges through end-to-end SQL-driven analytics.

---

## 🚀 Objectives

The project was designed to answer the following business-critical questions:

| Business Question | Objective |
|---|---|
| Where are users dropping off in the funnel? | Identify funnel leakage |
| Which traffic sources convert best? | Optimize acquisition strategy |
| How quickly do users convert? | Understand buying behavior |
| What drives revenue efficiency? | Improve monetization |
| Which funnel stages require optimization? | Prioritize business improvements |

---

## 🗂 Dataset Overview

📄 **Dataset Documentation:** [Click Here](docs/data_catalog.md)

---

## 🛠️ Important Links & Tools

Everything used in this project is cloud-based and beginner-friendly 🚀
- **[Datasets](datasets/)**: Access to the project dataset (csv files).
- **[Google BigQuery](https://cloud.google.com/bigquery)**: Fully managed, serverless data warehouse used for performing SQL-based analytics.
- **[GitHub](https://github.com/)**: Version control and project hosting platform.
- **Markdown**: Professional project documentation

---

## 🏗 Architecture / Workflow

```text
Raw User Event Data
        │
        ▼
Data Cleaning & Standardization
        │
        ▼
Centralized Rolling 30-Day SQL View
        │
        ├── Funnel Analysis
        ├── Conversion Analysis
        ├── Revenue Intelligence
        ├── Traffic Source Analysis
        └── Time-to-Conversion Metrics
        │
        ▼
Business Insights & Recommendations
```

---

## 📁 Repository Structure

```bash
sql-ecommerce-analysis-project/
│
├── datasets/                             
│   └── user_events.csv                    # Raw user event-level data (fact table)
│
├── scripts/
│   └── funnel_analysis.sql                # SQL script 
│
├── docs/
│   ├── data_catalog.md                    # Detailed data dictionary (tables, columns, data types)
│   └── business_questions.md              # Business objectives addressed through analysis
│   └── how_to_run.md                      # Detailed steps to replicate the project 
│
├── README.md                              # Project overview, executive summary, insights & recommendations
│
└── LICENSE                                # MIT License for open-source usage
```

---

## SQL Analysis Performed

The project includes advanced SQL analysis across multiple business dimensions.

### Analytical Areas Covered

✅ Funnel stage conversion analysis  
✅ Customer journey progression  
✅ Traffic source attribution  
✅ Revenue intelligence metrics  
✅ Conversion efficiency analysis  
✅ Average order value analysis  
✅ Time-to-conversion analytics  
✅ Funnel leakage identification  
✅ Acquisition quality comparison  
✅ Monetization KPI tracking  

---

## Key SQL Queries

---

### 1️⃣ Funnel Conversion Analysis

```sql
WITH funnel AS (
    SELECT
        COUNT(DISTINCT CASE WHEN event_name = 'page_view' THEN user_id END) AS visitors,
        COUNT(DISTINCT CASE WHEN event_name = 'add_to_cart' THEN user_id END) AS carts,
        COUNT(DISTINCT CASE WHEN event_name = 'checkout' THEN user_id END) AS checkouts,
        COUNT(DISTINCT CASE WHEN event_name = 'payment' THEN user_id END) AS payments,
        COUNT(DISTINCT CASE WHEN event_name = 'purchase' THEN user_id END) AS buyers
    FROM ecommerce_events
)

SELECT
    visitors,
    carts,
    ROUND(carts * 100.0 / visitors, 2) AS view_to_cart_cvr,
    ROUND(checkouts * 100.0 / carts, 2) AS cart_to_checkout_cvr,
    ROUND(payments * 100.0 / checkouts, 2) AS checkout_to_payment_cvr,
    ROUND(buyers * 100.0 / payments, 2) AS payment_to_purchase_cvr
FROM funnel;
```

### 📌 Business Insight

> This analysis identifies the exact stages where customers abandon the purchasing journey and highlights optimization opportunities across the funnel.


### 2️⃣ Traffic Source Conversion Analysis

```sql
SELECT
    traffic_source,
    COUNT(DISTINCT user_id) AS visitors,
    COUNT(DISTINCT CASE WHEN event_name = 'purchase' THEN user_id END) AS buyers,
    ROUND(
        COUNT(DISTINCT CASE WHEN event_name = 'purchase' THEN user_id END)
        * 100.0 /
        COUNT(DISTINCT user_id),
    2) AS conversion_rate
FROM ecommerce_events
GROUP BY traffic_source
ORDER BY conversion_rate DESC;
```

### 📌 Business Insight

> This query evaluates acquisition quality by comparing how efficiently each traffic source converts users into paying customers.



### 3️⃣ Revenue Intelligence Metrics

```sql
SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(AVG(revenue), 2) AS avg_order_value,
    ROUND(SUM(revenue) / COUNT(DISTINCT user_id), 2) AS revenue_per_customer
FROM ecommerce_events
WHERE event_name = 'purchase';
```

### 📌 Business Insight

> Provides executive-level monetization KPIs used for revenue forecasting, profitability analysis, and acquisition ROI evaluation.


### 4️⃣ Time-to-Conversion Analysis

```sql
WITH user_journey AS (
    SELECT
        user_id,
        MIN(CASE WHEN event_name = 'page_view' THEN event_timestamp END) AS first_view,
        MIN(CASE WHEN event_name = 'purchase' THEN event_timestamp END) AS purchase_time
    FROM ecommerce_events
    GROUP BY user_id
)

SELECT
    ROUND(
        AVG(
            TIMESTAMP_DIFF(purchase_time, first_view, MINUTE)
        ),
    2) AS avg_conversion_time_minutes
FROM user_journey
WHERE purchase_time IS NOT NULL;
```

### 📌 Business Insight

> Measures buying-cycle duration and helps identify opportunities for short-window retargeting and conversion acceleration strategies.

---

## 📊 Funnel Analysis Results

### 30-Day Funnel Snapshot

| Funnel Stage | Users | Conversion Rate |
|---|---:|---:|
| Page View | 2,173 | — |
| Add to Cart | 688 | 31.66% |
| Checkout | 474 | 68.90% |
| Payment | 378 | 79.75% |
| Purchase | 353 | 93.39% |

---

### 🔍 Key Funnel Insights

> 📌 **Largest leakage occurs during the View → Cart stage**

### Major Findings

- Early-stage engagement is the primary optimization opportunity
- Checkout flow demonstrates strong usability
- Payment completion rates indicate low transactional friction
- Customers with cart intent show high purchase probability

### Executive Interpretation

The business already possesses a strong transactional engine.  
Growth potential now depends on improving top-of-funnel persuasion and cart initiation rates.

---

## 📈 Traffic Source Insights

| Traffic Source | Purchase Conversion Rate | Performance |
|---|---:|---|
| Email | 32.19% | 🔥 Highest Intent |
| Paid Ads | 20.70% | ✅ Efficient |
| Organic | 17.31% | ✅ Stable |
| Social | 6.41% | ❌ Underperforming |

---

## Key Observations

### ✅ Email Marketing Performs Best

Email visitors demonstrate:

- Strong purchase intent
- Higher engagement quality
- Better conversion efficiency

### ⚠️ Social Traffic Underperforms

Despite generating traffic volume:

- Conversion quality is weak
- Purchase efficiency is low
- ROI may be diluted

### 💡 Business Opportunity

Reallocating acquisition budget toward:

- Email lifecycle campaigns
- Retargeting
- High-intent channels

could materially improve revenue efficiency.

---

## ⏱ Conversion Time Analysis

| Journey Stage | Avg Time |
|---|---|
| View → Cart | 11 Minutes |
| Cart → Purchase | 13 Minutes |
| Total Journey | ~24 Minutes |

---

## Behavioral Insights

### Fast Purchase Cycles

Users convert relatively quickly, suggesting:

- Strong transactional intent
- Efficient user experience
- Effective checkout usability

### Strategic Implications

The business can leverage:

- Short-window remarketing
- Abandoned cart automation
- Time-sensitive promotions

to maximize conversions.

---

## 💲 Revenue Intelligence Metrics

| KPI | Value |
|---|---:|
| Total Revenue | $38,180 |
| Total Buyers | 353 |
| Average Order Value | $108 |
| Revenue per Visitor | $17.57 |
| Overall Conversion Rate | 16.24% |

---

## Revenue Insights

### Strong Monetization Efficiency

The platform demonstrates:

- Healthy order value
- Efficient revenue generation
- Strong lower-funnel monetization

### Revenue Growth Opportunity

Even modest improvements in:

- Product engagement
- Cart initiation
- Funnel entry quality

could significantly increase revenue without increasing acquisition costs.

---

## 💡 Strategic Business Recommendations

### 1️⃣ Optimize Top-of-Funnel Engagement

The largest drop occurs during:

```text
Page View → Add to Cart
```

### Recommended Actions

- Improve product page UX
- Strengthen CTAs
- Optimize product descriptions
- Enhance trust indicators

---

### 2️⃣ Scale High-Intent Traffic Sources

Prioritize:

- Email marketing
- Retargeting campaigns
- CRM-driven personalization

These channels generate the strongest conversion quality.

---

### 3️⃣ Reduce Inefficient Social Spend

Social traffic currently:

- Converts poorly
- Dilutes acquisition efficiency
- Likely lowers marketing ROI

Budget optimization is recommended.

---

### 4️⃣ Preserve Checkout Performance

Checkout conversion exceeds:

```text
80%+
```

This indicates:

✅ Minimal friction  
✅ Effective transactional UX  
✅ Strong purchase completion flow  

Major redesigns are unnecessary.

---

## 📈 Business Impact

## Value Delivered Through This Analysis

### Revenue Optimization

Identified opportunities to increase revenue without increasing traffic acquisition spend.

### Funnel Efficiency Improvement

Pinpointed exact leakage stages requiring optimization.

### Marketing ROI Enhancement

Highlighted high-performing and underperforming acquisition channels.

### Executive Decision Support

Provided actionable insights for:

- Marketing teams
- Growth teams
- Product stakeholders
- Revenue operations

---

## 📚 Key Learnings

### Technical Learnings

- Advanced SQL analytics
- Funnel conversion modeling
- BigQuery optimization
- KPI-driven reporting
- Customer journey analysis

### Business Learnings

- Revenue growth depends heavily on early-funnel efficiency
- Acquisition quality matters more than traffic volume
- Small conversion improvements can generate large revenue impact

---

## ▶️ How to Run This Project : [Click here to know](docs/how_to_run.md)

---

## 🚀 Future Improvements

Planned enhancements for the project:

- Build interactive Power BI dashboard
- Add cohort retention analysis
- Implement customer segmentation
- Create LTV prediction models
- Develop real-time KPI tracking
- Add A/B testing analysis
- Build dbt transformation models

---

## 🌟 About Me

Hi there! I'm Kaustubh Sutar, a data enthusiast and aspiring Data Analyst & Data Engineer skilled in Power BI, SQL, Python, Excel, PySpark, and Databricks. I enjoy building scalable data pipelines, analyzing datasets, and creating dashboards that transform raw data into actionable business insights.

I also have growing interests in Data Engineering, Machine Learning, and AI, continuously exploring modern technologies to expand my analytical and engineering capabilities. Let's stay in touch! Feel free to connect with me on the following platforms:

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/kaustubh-sutar-814134340/)

---

## ⭐ Support This Project

If you found this project insightful:

- ⭐ Star the repository
- 🍴 Fork the project
- 📢 Share it with others
- 💼 Connect for analytics collaborations

---

## 🛡️ License

This project is licensed under the [MIT License](LICENSE). You are free to use, modify, and share this project with proper attribution.

---
