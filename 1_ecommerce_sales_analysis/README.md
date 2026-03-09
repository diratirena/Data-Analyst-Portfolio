# E-Commerce Sales Analysis

## Project Overview
This project analyzes sales performance and customer purchasing behavior using a retail transaction dataset. The goal is to identify sales trends, profitable product categories, and factors affecting profitability.

The analysis includes data cleaning, exploratory data analysis (EDA), and visualization to generate business insights.

## Business Problem
Companies need to understand sales performance and customer behavior to increase profitability and optimize business strategies.
This project aims to answer several questions:

- Which product categories generate the highest sales?
- Which regions contribute the most revenue?
- How do discounts affect profits?
- What is the sales trend over the year?

## Dataset
The dataset used in this project is obtained from Kaggle.

Source:
https://www.kaggle.com/datasets/thuandao/superstore-sales-analytics?resource=download

The dataset contains transaction records including 
- order_id
- order_date
- ship_date
- ship_mode
- customer_name
- segment
- country
- state
- market
- region
- product_id
- category
- sub_category
- product_name
- sales
- quantity
- discount
- profit
- shipping_cost
- order_priority
- year 

## Tools & Technologies
The analysis was conducted using:

- **R**
- tidyverse (dplyr, ggplot2)
- lubridate
- janitor

## Data Cleaning
Before performing the analysis, several preprocessing steps were applied:

- Standardizing column names
- Converting date variables into proper date format
- Removing duplicate records
- Checking for missing values
- Creating additional variables such as:
  - order_month
  - order_year
  - shipping_time

These steps ensure the dataset is ready for reliable analysis.

## Exploratory Data Analysis
Exploratory data analysis was conducted to understand sales patterns and key business metrics.

Key analyses include:
- Sales trend over time
- Sales distribution by product category
- Top selling products
- Sales performance by region
- Profit vs discount relationship
- Customer segment contribution
