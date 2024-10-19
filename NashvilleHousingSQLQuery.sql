--Use the correct Database which u have upload 
USE [NashvilleHousing2013-2016]
select *
from [NashvilleHousing2013-2016].dbo.NashvilleData

---- Standardise Date Format


ALTER TABLE [NashvilleHousing2013-2016].dbo.NashvilleData
ADD UpdatedSaleDate Date;

Update [NashvilleHousing2013-2016].dbo.NashvilleData
SET UpdatedSaleDate = CONVERT(Date,SaleDate)

SELECT UpdatedSaleDate, SaleDate
FROM [NashvilleHousing2013-2016].dbo.NashvilleData

---- Populate Property Address Data


-- Step 1: Retrieve all data from the NashvilleHousing2013-2016 table and order it by ParcelID.
-- This allows us to see the dataset sorted by the ParcelID column for easier review.

SELECT *
FROM [NashvilleHousing2013-2016].dbo.NashvilleData
ORDER BY ParcelID;

-- Step 2: Perform a self-join to find rows where the PropertyAddress is NULL for certain ParcelIDs.
-- This query attempts to join the table to itself (alias 'a' and 'b') on matching ParcelIDs but different UniqueID values.
-- The goal is to find instances where one row has a missing (NULL) PropertyAddress, but another row with the same ParcelID has the address.

SELECT a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress, b.PropertyAddress)
FROM [NashvilleHousing2013-2016].dbo.NashvilleData a
JOIN [NashvilleHousing2013-2016].dbo.NashvilleData b
    ON a.ParcelID = b.ParcelID
    AND a.[UniqueID] <> b.[UniqueID]  -- Ensures the rows are distinct based on UniqueID
WHERE a.PropertyAddress IS NULL;  -- Focus only on rows where PropertyAddress is missing

-- Step 3: Update the missing PropertyAddress values in the table using the values from matching rows.
-- This query will update rows in table 'a' where the PropertyAddress is NULL by filling them with the PropertyAddress 
-- from table 'b', where the ParcelID matches but the UniqueID differs (indicating different rows with the same ParcelID).

UPDATE a
SET PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)  -- Fills in missing addresses
FROM [NashvilleHousing2013-2016].dbo.NashvilleData a
JOIN [NashvilleHousing2013-2016].dbo.NashvilleData b
    ON a.ParcelID = b.ParcelID
    AND a.[UniqueID] <> b.[UniqueID]  -- Joins distinct rows with the same ParcelID
WHERE a.PropertyAddress IS NULL;  -- Updates only rows where PropertyAddress is NULL

-- Step 4: Check if there are any remaining rows where the PropertyAddress is still NULL.
-- After the update, this query ensures that all missing PropertyAddress values have been filled.

SELECT PropertyAddress
FROM [NashvilleHousing2013-2016].dbo.NashvilleData
WHERE PropertyAddress IS NULL;

-------------------------------------------------------------------------
-- Breaking out Full Address into individual Columns (Address, City, State)

--Property Address

--Step 1: Retrieve the full PropertyAddress column to review its contents
SELECT PropertyAddress
FROM [NashvilleHousing2013-2016].dbo.NashvilleData;

-- Step 2: Add a new column to store the street part of the PropertyAddress
ALTER TABLE [NashvilleHousing2013-2016].dbo.NashvilleData
ADD PropertyAddressStreet NVARCHAR(255);

-- Step 3: Update the new PropertyAddressStreet column by extracting the part before the first comma
-- SUBSTRING is used to extract characters from the beginning of PropertyAddress up to the first comma
UPDATE [NashvilleHousing2013-2016].dbo.NashvilleData
SET PropertyAddressStreet = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress)-1);

-- Step 4: Add a new column to store the city part of the PropertyAddress
ALTER TABLE [NashvilleHousing2013-2016].dbo.NashvilleData
ADD PropertyAddressCity NVARCHAR(255);

-- Step 5: Update the new PropertyAddressCity column by extracting the part after the first comma
-- The CHARINDEX function locates the first comma, and SUBSTRING extracts everything after it
UPDATE [NashvilleHousing2013-2016].dbo.NashvilleData
SET PropertyAddressCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1 , LEN(PropertyAddress));

-- Step 6: Retrieve the newly created PropertyAddressStreet and PropertyAddressCity columns to verify the results
SELECT PropertyAddressStreet, PropertyAddressCity
FROM [NashvilleHousing2013-2016].dbo.NashvilleData;


-- Step 7: Retrieve the full OwnerAddress column to review its contents
SELECT OwnerAddress
FROM [NashvilleHousing2013-2016].dbo.NashvilleData;

-- Step 8: Add a new column to store the street part of the OwnerAddress
ALTER TABLE [NashvilleHousing2013-2016].dbo.NashvilleData
ADD OwnerAddressStreet NVARCHAR(255);

-- Step 9: Update the new OwnerAddressStreet column by extracting the third part (street) using the PARSENAME function
-- REPLACE is used to convert commas into periods to use with PARSENAME, which extracts the third value
UPDATE [NashvilleHousing2013-2016].dbo.NashvilleData
SET OwnerAddressStreet = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 3);

-- Step 10: Add a new column to store the city part of the OwnerAddress
ALTER TABLE [NashvilleHousing2013-2016].dbo.NashvilleData
ADD OwnerAddressCity NVARCHAR(255);

-- Step 11: Update the new OwnerAddressCity column by extracting the second part (city) using the PARSENAME function
UPDATE [NashvilleHousing2013-2016].dbo.NashvilleData
SET OwnerAddressCity = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 2);

-- Step 12: Add a new column to store the state part of the OwnerAddress
ALTER TABLE [NashvilleHousing2013-2016].dbo.NashvilleData
ADD OwnerAddressState NVARCHAR(255);

-- Step 13: Update the new OwnerAddressState column by extracting the first part (state) using the PARSENAME function
UPDATE [NashvilleHousing2013-2016].dbo.NashvilleData
SET OwnerAddressState = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 1);


------------------------------------------------------------------------------
-- Change 1 to "Yes" and 0 to "No" in the "Sold as Vacant" field

SELECT DISTINCT SoldAsVacant
FROM [NashvilleHousing2013-2016].dbo.NashvilleData

--step 1 - Change the datatype of the column from int to char
ALTER TABLE [NashvilleHousing2013-2016].dbo.NashvilleData
ALTER COLUMN SoldAsVacant NVARCHAR(10)
 --step 2 update values inside the columns from 0 to 'NO' and from 1 to 'YES'
	UPDATE [NashvilleHousing2013-2016].dbo.NashvilleData
SET SoldAsVacant = CASE 
                      WHEN SoldAsVacant = '1' THEN 'Yes'
                      WHEN SoldAsVacant = '0' THEN 'No'
                      ELSE SoldAsVacant
                   END;
-----------------------------------------------------------------------------
  -- Remove Duplicates

-- Creating a CTE (Common Table Expression) with row numbering
WITH RowNumCTE AS (
   SELECT *,
      -- Using the ROW_NUMBER() function to number rows based on the columns specified in PARTITION
      ROW_NUMBER() OVER (
         -- Partitioning the rows by ParcelID, PropertyAddress, SalePrice, SaleDate, and LegalReference
         -- so that each set of rows within the same partition is treated separately
         PARTITION BY ParcelID,
                      PropertyAddress,
                      SalePrice,
                      SaleDate,
                      LegalReference
         -- Ordering them by UniqueID to assign a number to each row within each partition
         ORDER BY UniqueID
      ) row_num
   -- Selecting all columns from the NashvilleData table and adding the new row_num column
   FROM [NashvilleHousing2013-2016].dbo.NashvilleData
)

-- Deleting the duplicate rows based on the row_num column
DELETE
FROM RowNumCTE
-- Rows with row_num greater than 1 are duplicates, so we delete them and keep only the first row
WHERE row_num > 1;

-- You can use ORDER BY if you want to display the data ordered by PropertyAddress, for example
--SELECT * FROM RowNumCTE ORDER BY PropertyAddress;

----------------------------
-- Delete Unused Columns


SELECT *
FROM [NashvilleHousing2013-2016].dbo.NashvilleData

ALTER TABLE [NashvilleHousing2013-2016].dbo.NashvilleData
DROP COLUMN SaleDate, OwnerAddress, TaxDistrict, PropertyAddress