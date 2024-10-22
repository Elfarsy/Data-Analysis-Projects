--SQL PROJECT 
#Nashville Housing Data Project - Data Analysis
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
