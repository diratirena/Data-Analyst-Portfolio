library(tidyverse)
library(lubridate)
library(janitor)
library(scales)

data <- read_csv("C:/Users/Mybook 14G/Downloads/SuperStoreOrders.csv")
str(data)
head(data)


# merapikan nama kolom
data <- clean_names(data)

# ubah format tanggal
data$order_date <- as.Date(data$order_date)
data$ship_date <- as.Date(data$ship_date)

# cek missing value
colSums(is.na(data))

# cek duplikasi
sum(duplicated(data))

# hapus duplikasi jika ada
data <- data %>% distinct()

data <- data %>%
  mutate(
    order_month = month(order_date, label = TRUE),
    order_year = year(order_date),
    shipping_time = as.numeric(ship_date - order_date)
  )

summary_sales <- data %>%
  summarise(
    total_sales = sum(sales),
    total_profit = sum(profit),
    total_orders = n()
  )

summary_sales


monthly_sales <- data %>%
  group_by(order_year, order_month) %>%
  summarise(total_sales = sum(sales)) %>%
  ungroup()

ggplot(monthly_sales, aes(order_month, total_sales, group = order_year)) +
  geom_line(color = "steelblue", size = 1) +
  geom_point() +
  labs(
    title = "Monthly Sales Trend",
    x = "Month",
    y = "Total Sales"
  ) +
  theme_minimal()


category_sales <- data %>%
  group_by(category) %>%
  summarise(total_sales = sum(sales)) %>%
  arrange(desc(total_sales))

ggplot(category_sales, aes(reorder(category, total_sales), total_sales)) +
  geom_col(fill = "skyblue") +
  coord_flip() +
  labs(
    title = "Sales by Product Category",
    x = "Category",
    y = "Total Sales"
  ) +
  theme_minimal()


top_products <- data %>%
  group_by(product_name) %>%
  summarise(total_sales = sum(sales)) %>%
  arrange(desc(total_sales)) %>%
  slice_head(n = 10)

ggplot(top_products, aes(reorder(product_name, total_sales), total_sales)) +
  geom_col(fill = "orange") +
  coord_flip() +
  labs(
    title = "Top 10 Best Selling Products",
    x = "Product",
    y = "Total Sales"
  ) +
  theme_minimal()


region_sales <- data %>%
  group_by(region) %>%
  summarise(total_sales = sum(sales)) %>%
  arrange(desc(total_sales))

ggplot(region_sales, aes(reorder(region, total_sales), total_sales)) +
  geom_col(fill = "darkgreen") +
  coord_flip() +
  labs(
    title = "Sales by Region",
    x = "Region",
    y = "Total Sales"
  ) +
  theme_minimal()


ggplot(data, aes(discount, profit)) +
  geom_point(alpha = 0.4) +
  labs(
    title = "Relationship Between Discount and Profit",
    x = "Discount",
    y = "Profit"
  ) +
  theme_minimal()

segment_sales <- data %>%
  group_by(segment) %>%
  summarise(total_sales = sum(sales))

ggplot(segment_sales, aes(segment, total_sales)) +
  geom_col(fill = "purple") +
  labs(
    title = "Sales by Customer Segment",
    x = "Segment",
    y = "Total Sales"
  ) +
  theme_minimal()
