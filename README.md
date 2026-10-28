# Superstore Sales Performance & Business Insights Dashboard

An end-to-end Data Analytics project that transforms retail sales data into actionable business insights using **Python, SQL Server, and Power BI**. The project covers data cleaning, exploratory data analysis (EDA), SQL-based business analysis, interactive dashboard development, and performance reporting.

## Project Overview

The goal of this project is to analyze retail sales performance, identify top-performing products and regions, understand customer purchasing patterns, and evaluate shipping efficiency.

The analysis combines Python for data exploration, SQL Server for business queries, and Power BI for interactive reporting.

## Project Objectives

- Analyze overall sales performance and order trends.
- Identify top-performing products, categories, and sub-categories.
- Compare sales across regions, states, and customer segments.
- Evaluate customer contribution to total sales.
- Analyze shipping duration across different shipping modes.
- Build an interactive, multi-page Power BI dashboard to support data-driven decisions.

## Tools & Technologies

| Tool | Purpose |
|---|---|
| Python | Data cleaning and exploratory data analysis |
| Pandas, NumPy | Data manipulation and numerical analysis |
| Matplotlib, Seaborn | Data visualization |
| SQL Server | Data storage and business analysis queries |
| SQL | Aggregations, CTEs, window functions, and trend analysis |
| Power BI Desktop | Interactive dashboards and KPI reporting |
| DAX | Measures, year-over-year growth, and calculated metrics |
| Jupyter Notebook | Python analysis workflow |
| Git & GitHub | Version control and project documentation |

## Dataset

The project uses a retail Superstore sales dataset containing **9,800 records and 18 original columns**.

The dataset includes information about:

- Orders and order dates
- Shipping dates and shipping modes
- Customers and customer segments
- Products, categories, and sub-categories
- Cities, states, and regions
- Sales

### Data Preparation

The data preparation and validation process included:

- Inspecting data types, dimensions, and column names.
- Converting order and shipping dates to appropriate date formats.
- Checking missing values and data consistency.
- Identifying numerical distributions, skewness, and potential outliers.
- Performing univariate, bivariate, multivariate, and time-series analysis.
- Loading the cleaned dataset into SQL Server for further analysis.

The 11 missing postal-code values were identified during EDA and retained rather than removing otherwise usable records.

## Project Workflow

1. **Python EDA:** Explore, clean, and analyze the dataset.
2. **SQL Server:** Import the cleaned data into `SuperstoreDB`, in the `dbo.superstore_cleaned` table, and execute business queries.
3. **Power BI:** Connect to SQL Server, define DAX measures, and create interactive reports.
4. **Business Insights:** Interpret trends, compare performance, and identify opportunities for improvement.

## Power BI Dashboard

The report contains three pages designed for different business questions.

### 1. Executive Overview

Provides a high-level summary of business performance.

- Total Sales
- Total Orders
- Total Customers
- Unique Products
- Year-over-Year (YoY) Sales Growth
- Monthly Sales Trend
- Sales by Category
- Sales by Region
- Sales by Customer Segment

**Business question:** How is the business performing overall, and which regions and segments contribute most to sales?

### 2. Product Performance Analysis

Focuses on product-level sales performance.

- Total Product Sales
- Unique Products
- Top 10 Products by Sales
- Sales by Sub-Category
- Monthly Sales Trend by Category
- Category Sales by Region

**Business question:** Which products and sub-categories contribute most to revenue, and how does product performance vary over time and across regions?

### 3. Customer & Shipping Insights

Explores customer contribution and shipping efficiency.

- Total Customers
- Average Sales per Customer
- Average Shipping Days
- Top 10 Customers by Sales
- Sales by Customer Segment
- Average Shipping Days by Ship Mode
- Top 10 States by Sales

**Business question:** Which customers and states contribute most to sales, and how efficiently are orders shipped?

The report includes slicers for relevant dimensions such as year, region, category, customer segment, and shipping mode.

## Key Business Insights

The following findings were identified during the initial analysis of the dataset. Dashboard values should be validated against the final Power BI measures before publication.

### Sales Performance

- Total sales are approximately **2.26 million** in the dataset's recorded sales units.
- Technology generated the highest sales among the three main product categories, at approximately 828K.
- The West region recorded the highest regional sales, followed by the East region.
- Consumer customers contributed the largest share of sales, at approximately 1.15 million.

### Product Performance

- Phones and Chairs were among the highest-selling sub-categories, with sales of approximately 328K and 325K, respectively.
- The Top 10 Products analysis helps identify products that contribute significantly to total sales.
- Category-by-region comparisons reveal differences in product performance across geographic markets.

### Yearly Sales Trend

| Year | Total Sales |
|---|---:|
| 2015 | 479,856.21 |
| 2016 | 459,436.01 |
| 2017 | 600,192.55 |
| 2018 | 722,052.02 |

Sales declined in 2016, followed by strong growth in 2017 and 2018.

- 2016 YoY growth: approximately -4.26%
- 2017 YoY growth: approximately 30.64%
- 2018 YoY growth: approximately 20.30%

### Shipping Analysis

Shipping duration is calculated using the difference between order date and ship date. Comparing average shipping days across shipping modes helps evaluate delivery timelines and identify opportunities to improve operational efficiency.

## SQL Analysis

The SQL script includes queries for:

- Total sales, orders, customers, and products.
- Sales by category, region, and customer segment.
- Top 10 states, products, and customers by sales.
- Sub-category sales performance.
- Monthly sales trends.
- Year-over-year sales growth using `LAG()`.
- Category sales contribution percentages.
- Average shipping time by shipping mode.
- Monthly running totals and regional comparisons.

**SQL script:** `Superstore_Sales_Analysis.sql`

## Repository Structure

```text
Superstore-Sales-Analysis/
│
├── data/
│   └── README.md
│
├── notebooks/
│   └── Superstore_EDA.ipynb
│
├── sql/
│   └── Superstore_Sales_Analysis.sql
│
├── powerbi/
│   └── Superstore_Sales_Dashboard.pbix
│
├── screenshots/
│   ├── executive-overview.png
│   ├── product-performance.png
│   └── customer-shipping-insights.png
│
└── README.md
```

*Update the filenames to match the files you actually upload. Avoid committing duplicate or unnecessary copies of the dataset.*

## How to Run the Project

### Python EDA

1. Clone or download this repository.
2. Install Python and Jupyter Notebook.
3. Install the required libraries:

```bash
pip install pandas numpy matplotlib seaborn jupyter
```

4. Place the dataset in the appropriate local data folder.
5. Open and execute the EDA notebook.

### SQL Server

1. Install SQL Server and SQL Server Management Studio (SSMS).
2. Create the `SuperstoreDB` database.
3. Import the cleaned dataset into `dbo.superstore_cleaned`.
4. Open and execute `Superstore_Sales_Analysis.sql`.
5. Review the query results.

### Power BI

1. Install Power BI Desktop.
2. Open `Superstore_Sales_Dashboard.pbix`.
3. If necessary, update the SQL Server connection settings to match your local environment.
4. Refresh the data and validate the KPI measures.
5. Interact with the report using the slicers.

## Skills Demonstrated

- Data cleaning and preprocessing
- Exploratory Data Analysis (EDA)
- SQL querying and business analytics
- Data visualization and storytelling
- DAX measures and KPI development
- Time-series analysis and YoY growth
- Interactive dashboard design
- Business insight generation
- Data-driven decision-making

## Conclusion

This project demonstrates an end-to-end analytics workflow, from raw retail data to interactive business reporting. By combining Python, SQL Server, and Power BI, it provides a structured way to explore sales performance, product trends, customer contribution, and shipping efficiency.

The project showcases practical data analytics skills relevant to entry-level Data Analyst and Business Intelligence Analyst roles.

---

**Author:** Vaishnavi Sainath

**Tools:** Python | SQL Server | Power BI | DAX

**Project Type:** End-to-End Data Analytics
