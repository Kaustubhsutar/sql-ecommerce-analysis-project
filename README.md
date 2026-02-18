# 🛒 E-Commerce Funnel Optimization & Revenue Intelligence (SQL Case Study)

A data-driven analysis of a 30-day e-commerce user journey to identify funnel drop-offs, evaluate traffic source efficiency,
measure monetization performance, and uncover revenue growth opportunities using SQL (BigQuery).

---

## 📖 Project Overview

This project analyzes user event data from an e-commerce platform to answer:

- Where are users dropping off in the funnel?
- Which acquisition channels drive high-intent traffic?
- How long does it take users to convert?
- How efficiently does traffic translate into revenue?
- What levers can increase revenue without increasing traffic?

A centralized rolling 30-day SQL view was created to ensure consistent, reusable analysis across all queries.

---

## 🛠️ Important Links & Tools

Everything used in this project is cloud-based and beginner-friendly 🚀
- **[Datasets](datasets/)**: Access to the project dataset (csv files).
- **[Google BigQuery](https://cloud.google.com/bigquery)**: Fully managed, serverless data warehouse used for performing SQL-based analytics.
- **[GitHub](https://github.com/)**: Version control and project hosting platform.
  
---

## ▶️ How to Run This Project : [`Click here to know`](docs/how_to_run.md)


---
## 📁 Repository Structure

```

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

## 📊 Key Results (30-Day Snapshot)

- **2,173 Visitors**
- **353 Buyers**
- **16.24% Overall Conversion**
- **$38,180 Revenue**
- **$108 Average Order Value**
- **~24 Min Avg Conversion Time**

---

## Funnel Insights

| Stage | Users | Conversion |
|-------|-------|------------|
| Page View | 2,173 | — |
| Add to Cart | 688 | 31.66% |
| Checkout | 474 | 68.90% |
| Payment | 378 | 79.75% |
| Purchase | 353 | 93.39% |

### Key Takeaways

- Largest drop occurs at **View → Cart**
- Checkout & payment flow are highly optimized
- Purchase completion rate is exceptionally strong
- Primary growth lever: Improve early funnel intent

---

## 📈 Channel Performance

| Source | Purchase CVR |
|--------|--------------|
| Email | **32.19%** 🔥 |
| Paid Ads | 20.70% |
| Organic | 17.31% |
| Social | **6.41%** ❌ |

### Insights

- Email drives highest-intent traffic
- Paid ads are efficient
- Organic provides stable baseline
- Social drives volume but weak purchase intent
- Budget reallocation opportunity identified

---

## ⏱ Conversion Behavior

- Avg View → Cart: 11 min  
- Avg Cart → Purchase: 13 min  
- Total Journey: ~24 min  

Users convert quickly, indicating short decision cycles and strong potential for short-window retargeting strategies.

---

## 💰 Monetization Metrics

- Revenue: **$38,180**
- Orders: 353
- Revenue per Visitor: $17.57
- Revenue per Buyer: $108

Small improvements in early-stage conversion would significantly increase revenue without additional traffic acquisition.

---

## 💡 Strategic Recommendations

1. Protect the Checkout Engine – 80%+ checkout-to-purchase conversion confirms a frictionless payment system. No redesign needed.
2. Fix the Real Leak: Top-of-Funnel Intent – The largest drop occurs at View → Cart. Growth depends on improving early-stage persuasion.
3. Reduce Inefficient Social Spend – Social drives volume but converts poorly (~6%). Current spend likely dilutes ROI.
4. Scale High-Intent Channels – Email delivers the strongest conversion performance. Prioritize email capture, retargeting, and lifecycle automation.
5. Enforce CAC Discipline – With ~$110 AOV, acquisition costs must remain tightly controlled to protect margins.
6. Revenue Growth Without More Traffic – Small improvements in early funnel conversion will materially increase revenue without increasing acquisition spend.

---

# 🎯 Business Impact

The platform demonstrates a strong transactional engine with minimal checkout friction.  
The biggest opportunity lies in improving top-of-funnel engagement and reallocating acquisition spend toward high-converting channels to drive scalable revenue growth.

---

## 🛡️ License

This project is licensed under the [MIT License](LICENSE). You are free to use, modify, and share this project with proper attribution.

## 🌟 About Me

Hi there! I'm **Kaustubh Sutar**. I’m a data enthusiast and aspiring data analyst skilled in Power BI, Excel, SQL, and Python, exploring Machine Learning & AI to turn data into actionable insights.

Let's stay in touch! Feel free to connect with me on the following platforms:

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/kaustubh-sutar-814134340/)
