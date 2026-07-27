# 🛒 E-Commerce Product & Sales Data Analytics 

![Python](https://img.shields.io/badge/Python-3.12-blue?style=flat&logo=python)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-pgAdmin4-336791?style=flat&logo=postgresql)
![Power BI](https://img.shields.io/badge/Power_BI-Dashboard-F2C811?style=flat&logo=powerbi)

## 📌 Overview
This project delivers an **end-to-end data analytics workflow** on a large-scale e-commerce dataset containing **800,000+ raw product records**. 

The goal was to transform messy, unorganized web-scraped marketplace data into a structured relational database (PostgreSQL) and build business intelligence dashboards (Power BI) to analyze pricing patterns, discount distributions, and category ranks.

---

## 🛠️ Tech Stack
* **Data Processing & EDA:** Python (`pandas`, `numpy`, `seaborn`, `matplotlib`) via Google Colab
* **Database Management:** PostgreSQL (`pgAdmin 4`)
* **Visualization & BI:** Power BI Desktop

---

## 🧹 Data Pipeline & Cleaning Methodology

### 1. Schema Optimization & Datatypes
* Corrected numeric data types for `price`, `discount`, and `rank_sub` columns.
* Fixed messy column headers and ensured consistent schema structure across sub-category files.

### 2. Intelligent Deduplication
* Preserved genuine product variants (e.g., color variants across baby/maternity lines) by deduplicating records on composite keys: `['product_title', 'price', 'discount', 'rank_title', 'selling_proposition', 'rank_sub', 'available_color']`.

### 3. Outlier Treatment (IQR Method)
* Applied Interquartile Range (IQR) filtering on numerical features (`price` & `rank`) to detect structural anomalies, eliminating non-sensical data points like negative prices and extreme upper outliers.

### 4. Primary Key Generation
* Synthetic `product_id` indexing was introduced in Python to serve as a Primary Key for downstream PostgreSQL indexing and Power BI data modeling.

---

## 🗄️ Database Architecture (PostgreSQL)

Cleaned data was exported to PostgreSQL to support low-latency analytical SQL querying:

