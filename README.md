# ☕ Coffee Shop Sales Analysis Dashboard

## 📊 Project Overview

The **Coffee Shop Sales Analysis Dashboard** is an interactive business intelligence dashboard designed to analyze coffee shop sales performance across different time periods, product categories, stores, days, and hours.

The dashboard provides a consolidated view of key sales KPIs and helps identify **sales trends, high-performing products, store performance, peak sales periods, and customer purchasing patterns**.

The project combines **SQL data preparation** with an interactive dashboard to transform raw transaction data into actionable business insights.

---## 📊 Dashboard Preview

<p align="center">
  <img src="Coffe Sales/dashboard.png" alt="Coffee Shop Sales Dashboard" width="100%">
</p>

## 🎯 Project Objectives

The main objectives of this project are:

- Analyze overall coffee shop sales performance
- Track total sales, orders, and quantity sold
- Compare current-month performance with the previous month
- Identify daily sales trends
- Analyze sales by product category
- Identify top-performing products
- Compare sales performance across stores
- Identify weekday vs weekend sales contribution
- Analyze sales by hour of the day
- Identify peak business hours
- Provide an interactive reporting interface for business decision-making

---

## 🛠️ Tools & Technologies

- **SQL / MySQL** – Data cleaning and preparation
- **Power BI** – Dashboard development and visualization
- **Data Visualization** – KPI cards, bar charts, donut charts, trend analysis, and heatmaps
- **Data Analysis** – Sales, orders, quantity, category, store, date, and time analysis

---

# 🗂️ Dataset

The project uses a coffee shop transaction dataset containing transactional sales information.

The data includes fields related to:

- Transaction ID
- Transaction Date
- Transaction Time
- Product
- Product Category
- Store
- Quantity
- Sales Amount
- Other transaction-level information

The raw dataset required preprocessing before being used for analysis.

---

# 🧹 Data Cleaning & Preparation

SQL was used to prepare the raw transaction data for analysis.

### 1. Select the Database

```sql
USE coffe_db;
````

The analysis was performed using the `coffe_db` database.

---

### 2. Inspect the Table Structure

```sql
DESC shop_sales;
```

The table structure was reviewed to understand the available fields and their data types.

---

### 3. Convert Transaction Date

The original transaction date was stored in text format.

It was converted into a proper SQL date using:

```sql
UPDATE shop_sales
SET transaction_date = STR_TO_DATE(transaction_date, '%d/%m/%Y');
```

The column was then changed to the `DATE` data type:

```sql
ALTER TABLE shop_sales
MODIFY transaction_date DATE;
```

This allows the transaction date to be used correctly for:

* Monthly analysis
* Daily analysis
* Time-based trends
* Date filtering
* Period comparisons

---

### 4. Convert Transaction Time

The transaction time was converted from text into a proper SQL time format:

```sql
UPDATE shop_sales
SET transaction_time = STR_TO_DATE(transaction_time, '%H:%i:%s');
```

The column was then modified to the `TIME` data type:

```sql
ALTER TABLE shop_sales
MODIFY transaction_time TIME;
```

This enables analysis of sales performance across different hours of the day.

---

### 5. Rename Transaction ID Column

The original transaction ID column contained an encoding-related character.

It was renamed using:

```sql
ALTER TABLE shop_sales
CHANGE COLUMN ï»¿transaction_id transaction_id INT;
```

This ensures that the transaction identifier can be referenced cleanly during analysis.

---

# 📈 Dashboard Overview

The dashboard provides a complete view of coffee shop sales performance.

It includes:

* Sales KPIs
* Sales trend analysis
* Product category performance
* Store performance
* Weekday vs weekend analysis
* Sales by day and hour
* Interactive month filtering

---

# 🔑 Key Performance Indicators

The top section of the dashboard displays three major KPIs.

### 💰 Total Sales

Displays the total revenue generated during the selected period.

Example from the dashboard:

**$99K**

The dashboard also shows the percentage and absolute change compared with the previous month.

---

### 🧾 Total Orders

Displays the total number of orders generated during the selected period.

Example:

**21,229 Orders**

The previous-month comparison helps identify whether order volume is increasing or decreasing.

---

### 📦 Total Quantity

Displays the total quantity of products sold.

Example:

**30,406 Units**

This metric helps understand overall product movement.

---

# 📅 Interactive Month Filter

The dashboard contains a month selector that allows users to analyze sales performance for a specific month.

For example:

**March 2023**

Changing the selected month dynamically updates the dashboard metrics and visualizations.

This allows users to perform month-level performance analysis without manually filtering the underlying data.

---

# 📊 Sales Trend Over the Period

The **Sales Trend Over the Period** visualization shows daily sales performance throughout the selected period.

It helps identify:

* High-sales days
* Low-sales days
* Sales fluctuations
* Daily performance patterns
* Overall sales consistency

The dashboard also displays an average sales reference level to make it easier to compare individual days against the overall period average.

---

# ☕ Sales by Product Category

The dashboard provides category-level sales analysis.

Example categories shown include:

* Coffee
* Tea
* Bakery
* Drinking Chocolate
* Coffee Beans
* Branded
* Loose Tea
* Flavours
* Packaged Chocolate

The dashboard highlights both:

* Sales generated
* Percentage change compared with the previous month

### Example

**Coffee — $38.30K**

Coffee is the leading category in the displayed period.

This analysis helps identify which product categories contribute the most to overall sales.

---

# 🥤 Sales by Product

The dashboard also provides a more detailed product-level analysis.

Example products include:

* Barista Espresso
* Brewed Chai Tea
* Hot Chocolate
* Gourmet Brewed Coffee
* Brewed Black Tea
* Brewed Herbal Tea
* Premium Brewed Coffee
* Organic Brewed Coffee
* Scone
* Drip Coffee

This visualization helps businesses understand which individual products are generating the highest sales.

---

# 🏪 Sales by Store

Sales performance is also compared across individual store locations.

Example stores displayed include:

* Hell's Kitchen
* Lower Manhattan
* Astoria

The dashboard displays the sales contribution of each store along with its change compared with the previous month.

This enables management to identify:

* Top-performing stores
* Underperforming stores
* Store-level growth
* Location-specific sales patterns

---

# 📆 Weekday vs Weekend Analysis

The dashboard compares sales generated during:

* **Weekdays**
* **Weekends**

A donut chart provides a visual breakdown of the contribution of each period.

For the displayed period, the dashboard shows:

* Weekday sales: approximately **$74K**
* Weekend sales: approximately **$25K**

This helps identify whether the business is more dependent on weekday or weekend demand.

---

# 🕐 Sales by Day & Hour

One of the most useful sections of the dashboard is the **Sales by Days | Hour** heatmap.

It analyzes sales across:

* Monday to Sunday
* Different hours of the day

The visualization helps identify:

* Peak sales hours
* Low-demand periods
* Strong-performing weekdays
* Strong-performing weekends
* Potential staffing requirements
* Opportunities for targeted promotions

The dashboard also provides daily totals and hourly sales information.

---

# 📌 Key Insights from the Dashboard

Based on the displayed March 2023 dashboard:

### 1. Strong Sales Performance

Total sales are approximately:

**$99K**

The dashboard indicates approximately **30% growth compared with the previous month**.

---

### 2. High Order Volume

The selected period generated approximately:

**21,229 orders**

This indicates a significant level of customer transaction activity.

---

### 3. Coffee Is the Leading Category

Coffee contributes approximately:

**$38.30K**

making it the strongest product category displayed in the dashboard.

---

### 4. Weekdays Generate a Larger Share of Sales

Weekday sales account for approximately:

**$74K**

while weekend sales contribute approximately:

**$25K**

This indicates that weekday demand is substantially higher during the displayed period.

---

### 5. Store-Level Performance Can Be Compared

The dashboard makes it easy to compare locations such as Hell's Kitchen, Lower Manhattan, and Astoria.

This can help management identify locations that deserve additional attention or investment.

---

### 6. Sales Vary by Hour

The hourly heatmap shows that sales are not evenly distributed throughout the day.

Certain morning and daytime periods show stronger activity, making hourly analysis useful for:

* Workforce planning
* Inventory planning
* Promotional campaigns
* Store operations

---

# 🏗️ Project Workflow

```text
Raw Coffee Shop Data
        │
        ▼
Data Inspection
        │
        ▼
SQL Data Cleaning
        │
        ├── Convert Transaction Date
        ├── Convert Transaction Time
        └── Clean Transaction ID
        │
        ▼
Prepared Dataset
        │
        ▼
Business Intelligence Dashboard
        │
        ├── KPI Analysis
        ├── Sales Trends
        ├── Category Analysis
        ├── Product Analysis
        ├── Store Analysis
        ├── Weekday/Weekend Analysis
        └── Hourly Sales Analysis
        │
        ▼
Business Insights
```

---

# 📊 Dashboard Components

| Dashboard Section   | Purpose                      |
| ------------------- | ---------------------------- |
| Total Sales         | Measure overall revenue      |
| Total Orders        | Measure transaction volume   |
| Total Quantity      | Measure units sold           |
| Month Filter        | Analyze a selected month     |
| Sales Trend         | Analyze daily sales movement |
| Sales by Category   | Identify leading categories  |
| Sales by Product    | Identify top products        |
| Sales by Store      | Compare store performance    |
| Weekday vs Weekend  | Compare customer demand      |
| Sales by Day & Hour | Identify peak periods        |

---

# 💡 Business Value

The dashboard can support coffee shop management in several areas.

### Inventory Management

Understanding which categories and products generate the most sales can help optimize inventory levels.

### Workforce Planning

Hourly sales patterns can help managers allocate employees according to customer demand.

### Store Performance

Comparing sales across stores helps identify high-performing and underperforming locations.

### Product Strategy

Category and product-level analysis can support decisions around:

* Product promotion
* Product placement
* Inventory allocation
* Menu optimization

### Marketing Strategy

Sales trends can help identify suitable periods for:

* Promotions
* Discounts
* Loyalty campaigns
* Targeted offers

---

# 🎯 Project Goals

This project demonstrates how transactional sales data can be transformed into a business-oriented analytical solution.

The dashboard focuses on answering questions such as:

* How much are we selling?
* How many orders are being placed?
* How many products are being sold?
* Which product categories generate the most revenue?
* Which products perform best?
* Which stores generate the most sales?
* Are weekdays or weekends more important?
* What are the busiest hours?
* How is sales performance changing compared with the previous month?

---

# 🚀 Possible Future Enhancements

The dashboard can be further enhanced by adding:

* Customer segmentation
* Customer retention analysis
* Average order value trends
* Product basket analysis
* Year-over-year comparisons
* Sales forecasting
* Customer lifetime value
* Profit and margin analysis
* Store-level forecasting
* Product-level forecasting
* Automated data refresh
* Target vs actual sales tracking

---

# 📁 Project Structure

```text
Coffee-Shop-Sales-Analysis/
│
├── README.md
│
├── SQL/
│   └── coffee_shop_data_cleaning.sql
│
├── Dataset/
│   └── shop_sales.csv
│
└── Dashboard/
    └── Coffee_Shop_Sales_Dashboard.pbix
```

> File names may vary depending on the final project folder structure.

---

# 🧠 Skills Demonstrated

This project demonstrates skills in:

* SQL
* MySQL
* Data Cleaning
* Data Transformation
* Business Intelligence
* Data Visualization
* Dashboard Development
* KPI Analysis
* Sales Analysis
* Time-Based Analysis
* Retail Analytics
* Business Insight Generation

---

# 📌 Conclusion

The **Coffee Shop Sales Analysis Dashboard** transforms raw transaction data into an interactive business intelligence solution.

By combining **SQL-based data preparation** with dashboard-based visualization, the project provides a clear understanding of sales performance across **time, products, categories, stores, days, and hours**.

The dashboard enables decision-makers to quickly identify important sales patterns and use them to improve **inventory planning, staffing, product strategy, store performance, and marketing decisions**.

---

## 👨‍💻 Author

**Tanmay Shevale**

Aspiring Data Analyst | Business Analytics | SQL | Power BI | Data Visualization

```
```
