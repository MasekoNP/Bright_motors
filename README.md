# Car Sales Data Analysis Project

## Project Overview

This project analyses a car sales dataset to uncover key insights into **sales performance, customer purchasing behaviour, pricing trends, and profitability**.

The goal is to transform raw transactional data into meaningful business insights that can support **data-driven decision-making** for dealerships and stakeholders.

---

## Project objectives

* Identify top-performing **car brands and models**
* Analyse **revenue and sales volume trends**
* Understand the relationship between **price, mileage, and vehicle age**
* Evaluate **regional sales performance**
* Discover **emerging customer purchasing preferences**
* Assess **profitability and pricing strategies**

---

## Dataset Description

The dataset contains detailed records of car sales, including:

* Vehicle details: year, make, model, trim, body, transmission
* Identification: VIN (unique vehicle identifier)
* Location: state
* Vehicle condition: condition score, condition class
* Usage: odometer (mileage), mileage class
* Features: color, interior
* Seller information
* Pricing: MMR (market value), selling price
* Time: sale date, month, year, weekday, time of sale
* Performance metrics: units sold, total revenue, profit margin

---

## Data Cleaning and Preparation

The following steps were performed:

* Removed duplicates using **VIN and sale date**
* Converted price fields to numeric format
* Standardised date and time fields
* Created derived features:

  * **Car Age** = Sale Year − Manufacturing Year
  * **Odometer Class** (Low / Medium / High)
  * **Condition Class** (Grouped condition scores)
  * **Sales Time Class** (Morning / Afternoon / Evening)
  * **Margin Class** (Low / Medium / High profitability)

---

## Key Analyses & Insights

### 1. Sales Performance

* Identified top-performing **makes and models** by revenue and volume
* Compared **high-volume vs high-value vehicles**

### 2. Revenue & Profitability

* Analysed total revenue by brand, model, and region
* Evaluated **profit margins** to identify high-profit segments
* Compared **selling price vs MMR** to assess pricing strategy

### 3. Price, Mileage & Age Relationship

* Older vehicles tend to have **lower selling prices**
* Higher mileage is associated with **decreased vehicle value**
* Best-performing vehicles are **low mileage and newer models**

### 4. Regional Analysis

* Identified **top-performing states** by sales volume and revenue
* Compared regional differences in **average selling prices**

### 5. Customer Purchasing Trends

* Increasing preference for **SUVs and automatic vehicles**
* Higher demand for **low-mileage and good-condition cars**
* Gradual shift toward **higher-value vehicles**

### 6. Time-Based Trends

* Identified peak sales periods by **month, weekday, and time of day**
* Highlighted seasonal patterns in car sales

---

## Tools & Technologies

* **SQL (BigQuery)** – Data cleaning and analysis
* **Excel / Power BI** – Data visualisation and dashboards
* **GitHub** – Project documentation and version control


---

## Example Business Questions Answered

* Which car models generate the highest revenue?
* What factors influence vehicle pricing the most?
* Which regions have the highest sales volumes?
* What are the emerging trends in customer preferences?
* Which vehicles deliver the highest profit margins?

---

## Key Takeaways

* **Vehicle condition and mileage** are major drivers of price
* **Brand and model** significantly influence revenue generation
* **Regional differences** impact both sales volume and pricing
* Customer demand is shifting toward **quality and convenience**

---

## Future Improvements

* Build a **predictive model** to estimate car prices
* Develop an **interactive dashboard** for real-time insights
* Perform **customer segmentation analysis**
* Incorporate external data (economic indicators, fuel prices)

---

## Author

**Ndadlana Piet Maseko**
Aspiring Data Analyst | Passionate about data-driven decision-making

---

## Contact

* LinkedIn: www.linkedin.com/in/ndadlana-maseko-613a9216b
* Email: masekondadlana@gmail.com

---
