--SQL PROJECTS

# 1- Nashville Housing Data Project - Data Analysis
In this project, I worked with a comprehensive dataset of Nashville housing transactions from 2013 to 2016. The goal was to clean, organize, and analyze the data using SQL, providing insights into property sales and ownership details across the city. Here's a breakdown of the tasks I accomplished:

-Data Cleaning and Normalization:

I used SQL to clean the data by removing duplicates based on key attributes like Parcel ID, Property Address, Sale Price, and Sale Date. This helped ensure data accuracy and removed any redundancy.
I handled missing or incomplete data, particularly by updating null property addresses with valid ones from other records where Parcel ID matched.

-Data Transformation:

I split compound address fields into more granular columns such as street, city, and state, which made the data more manageable and easier to query for specific analyses.
For fields like “SoldAsVacant,” I transformed the values from binary format (0 and 1) to meaningful labels like 'Yes' and 'No' to improve readability in reports.

-Duplicate Removal:

Using the ROW_NUMBER() function in SQL, I identified and removed duplicate records while keeping the earliest entries, ensuring the dataset was free of repeated entries that could distort analysis results.

-Property and Owner Analysis:

I created queries to break down property addresses and owner details into separate components, which provided clearer insights into patterns of ownership and location-specific sales.

-Data Updates:

Several update queries were executed to enrich the data by filling in missing or inconsistent information, such as property addresses, owner addresses, and legal references.
The project demonstrated the importance of data cleaning and structuring in preparing a dataset for further analysis, such as market trend assessments and real estate insights. By transforming and organizing the Nashville housing data, I made it ready for deeper analytics using tools like Power BI or Python for further exploration.

CHECK SOURCE CODE:https://github.com/Elfarsy/Data-Analysis-Projects/blob/main/NashvilleHousingSQLQuery.sql

DOWNLOAD DATASET :https://github.com/Elfarsy/Data-Analysis-Projects/blob/main/Nashville%20Housing%20Data%20for%20Data%20Cleaning.csv

# 2-SQL SUBQUERY REFERENCE - Functions and Analysis Project 
This project showcases a series of SQL exercises focused on advanced querying techniques and aggregate window functions. It includes practical examples demonstrating the use of various SQL functions to analyze employee data, sales records, and department information.

Features
Window Functions: Demonstrated the use of ROW_NUMBER(), RANK(), DENSE_RANK(), NTILE(), and various aggregate functions to manipulate and analyze data sets effectively.

Aggregation Techniques: Explored SUM(), AVG(), and COUNT() functions to calculate totals and averages across different dimensions such as departments and categories.

Grouping and Set Functions: Utilized GROUPING SETS, ROLLUP(), and CUBE() to generate complex aggregation results that provide insights into data across multiple categories.

CTEs and Subqueries: Implemented Common Table Expressions (CTEs) to organize queries and enhance readability while performing calculations on customer purchases and employee data.

Example Queries
Employee Analysis
Retrieve Employee Salaries: Utilizes RANK() to rank employees based on their salaries within departments.
Sales Analysis
Aggregate Sales Data: Uses SUM() and COUNT() to derive total sales and employee counts by category and shipping modes.
Data Grouping
Dynamic Grouping: Shows how to group results dynamically using NTILE(), and analyze data trends with ROLLUP() and CUBE().

CHECK SOURCE CODE : https://github.com/Elfarsy/Data-Analysis-Projects/blob/main/SubQuery%20Refrence.sql

DDL used : https://github.com/Elfarsy/Data-Analysis-Projects/blob/main/project-db.txt

datasets : https://github.com/Elfarsy/Data-Analysis-Projects/blob/main/Sales.csv

 https://github.com/Elfarsy/Data-Analysis-Projects/blob/main/Customers.csv

--POWER BI Project 
#-1 Sales Analysis Dashboard with Power BI
This project showcases a Sales Analysis Dashboard created using Power BI, leveraging Power Query and DAX techniques for data analysis and visualization. The dashboard provides actionable insights into sales performance across various regions and includes financial overviews with tax adjustments.

🚀 Key Features
Sales Analysis by Region

Visualized total sales and units sold using interactive charts.
Tax-Adjusted Sales Calculation

Added a calculated column to include sales with a tax rate of 1.5% for a comprehensive financial overview.
Key Metrics

Average sales and units sold.
Distributor sales performance metrics.
Dynamic Reporting

Interactive reports showing sales trends by invoice date.
Progress Tracking

Measures and visualizations to track sales progress against predefined goals.
📈 Benefits of the Dashboard
Enhanced Decision-Making
Empower stakeholders with accurate, visual insights to make data-driven decisions.
Flexible Analysis Tools
Included slicers and cards for easy data filtering and deeper analysis.
🛠️ Tools Used
Power BI: For building the dashboard.
Power Query: For data transformation.
DAX: For creating calculated columns and measures.
🗂️ Project Files
The repository includes:

The Power BI Dashboard file (.pbix).
A sample dataset (if required).
A detailed walkthrough of the DAX formulas and Power Query transformations used.
📨 Get In Touch
If you're interested in exploring this project or want to try it out with the dataset, feel free to contact me!
