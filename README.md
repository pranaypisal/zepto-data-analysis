# zepto-data-analysis
# 🛒 Zepto SQL Data Analysis Project

## 📌 Project Overview
This project analyzes product-level data from Zepto using SQL to extract business insights like discounts, revenue, and inventory.

## 📂 Dataset
- Source: Zepto product dataset
- Contains:
  - Product Name
  - Category
  - MRP
  - Discount %
  - Stock availability
  - Weight

## 🧹 Data Cleaning
- Removed products with MRP = 0
- Converted price from paisa to rupees
- Checked for null values

## 📊 Key Business Questions Solved

1. Top 10 best-value products based on discount
2. High MRP but out-of-stock products
3. Estimated revenue by category
4. Products with high MRP and low discount
5. Top 5 categories with highest discounts
6. Price per gram analysis
7. Product segmentation (Low, Medium, Bulk)
8. Total inventory weight per category

## 🛠️ Tools Used
- SQL (PostgreSQL / MySQL)
- Data Analysis

## 📈 Key Insights
- Some categories offer significantly higher discounts
- High MRP products often go out of stock quickly
- Bulk products provide better price-per-gram value

## 🚀 How to Run
1. Create table using SQL script
2. Import CSV data
3. Run queries from `zepto_analysis.sql`

## 👤 Author
Pranay Pisal

## 🔥 Skills Demonstrated
- SQL Joins & Aggregations
- Data Cleaning
- Business Analysis
- Data Transformation
