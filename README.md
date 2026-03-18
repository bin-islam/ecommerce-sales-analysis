# E-Commerce Sales Analysis

End-to-end sales analysis of a UK-based online retailer using Python and SQL.
Covers revenue trends, product performance, geographic breakdown, and RFM customer segmentation.

## Dataset
- Source: [UCI Online Retail Dataset](https://www.kaggle.com/datasets/carrie1/ecommerce-data) via Kaggle
- 541,909 transactions | Dec 2010 to Dec 2011 | 37 countries
- Cleaned to 397,884 rows after removing cancellations, nulls, and invalid entries

## Tools
- Python (Pandas, Matplotlib, Seaborn)
- SQL (SQLite)
- Jupyter Notebook

## Analyses

### 1. Monthly Revenue Trend
- Identified strong Q4 seasonality with revenue peaking at £1.16M in November 2011
- September to November saw a 22% revenue surge vs the prior 3-month average

### 2. Top 10 Products by Revenue
- PAPER CRAFT LITTLE BIRDIE led at £168,470 in total revenue
- Top 10 products contributed £903k combined

### 3. Geographic Revenue Breakdown
- UK accounts for 82% of total revenue (£7.3M of £8.9M)
- Netherlands and Ireland are the next largest markets at £285k and £265k

### 4. RFM Customer Segmentation
Scored 4,338 customers across Recency, Frequency, and Monetary dimensions
and grouped them into 7 segments:

| Segment | Customers | Revenue |
|---|---|---|
| Champion | 609 | £4,578,426 |
| Loyal | 914 | £2,022,949 |
| At Risk | 465 | £769,616 |
| Lost | 1,421 | £625,064 |
| Cant Lose Them | 264 | £413,399 |
| New Customer | 234 | £287,675 |
| Potential Loyalist | 431 | £214,279 |

Key finding: Champions are 14% of customers but generate 51% of total revenue.

## Project Structure
```
ecommerce-sales-analysis/
├── data/
│   └── data.csv
├── notebooks/
│   └── 01_eda_cleaning.ipynb
│   └── 02_analysis.ipynb
├── sql/
│   └── queries.sql
├── visuals/
│   ├── monthly_revenue.png
│   ├── top_products.png
│   └── rfm_segments.png
└── README.md
```

## Key Findings
- 33% of customers are classified as Lost -- re-engagement campaigns could recover significant revenue
- 264 "Cant Lose Them" customers are high spenders going inactive -- highest retention priority
- Q4 demand spike suggests inventory and marketing should scale up from August onward