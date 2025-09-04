/* 
=========================================
Create Database and Schemas
=========================================
Script Purpose:
  This Script creates new database name 'DataWarehouse' after checking if it already exists.
  if the database exists, it is dropped and recreated. Additionally, the script sets up three schemas
  within the database: 'bronze', 'silver', 'gold'.

WARNING:
  Running this scrip will drop the entire 'DataWarehouse' database if it exists.
  All data in the databasse will be permanently deleted. Proceed with caution
  and ensure you have proper backups before runing this script.
*/



Use master;
Go

-- Drop and recreate the 'DataWarehouse' database
  IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'Datawarehouse')
  BEGIN
      ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
      DROP DATABASE DataWarehouse;
  END;
  Go

-- Create the 'DataWarehouse' database

CREATE DATABASE DataWarehouse;
Go

USE DataWarehouse;
Go
  -- Create Schemas

CREATE SCHEMA bronze;
Go
CREATE SCHEMA silver;
Go
CREATE SCHEMA gold;
Go

-- Creating Table 

CREATE TABLE bronze.crm_cust_info(
cst_id INT,
cst_key NVARCHAR(50),
cst_firstname NVARCHAR(50),
cst_lastname NVARCHAR(50),
cst_material_status NVARCHAR(50),
cst_gndr NVARCHAR(50),
cst_create_date DATE
);

CREATE TABLE bronze.crm_prd_info(
prd_id INT,
prd_key NVARCHAR(50),
prd_nm NVARCHAR(50),
prd_cost INT,
prd_line NVARCHAR(50),
prd_start_dt DATETIME,
prd_end_dt DATETIME
);
IF OBJECT_ID ('bronze.crm_sales_details') IS NOT NULL
	DROP TABLE bronze.crm_sales_details;
CREATE TABLE bronze.crm_sales_details(
sls_ord_num NVARCHAR (50),
sls_prd_key NVARCHAR(50),
sls_cust_ID INT,
sls_order_dt INT,
sls_ship_dt DATETIME,
sls_due_dt DATETIME,
sls_sales INT,
sls_quantity INT,
sls_price INT,
);

IF OBJECT_ID ('bronze.erp_cust_AZ12') IS NOT NULL
	DROP TABLE bronze.erp_cust_AZ12;

CREATE TABLE bronze.erp_cust_AZ12(
cid NVARCHAR(50),
bdate DATE,
GEN NVARCHAR (50)
);

IF OBJECT_ID ('bronze.erp_loc_A101') IS NOT NULL
	DROP TABLE bronze.erp_loc_A101;

CREATE TABLE bronze.erp_loc_A101(
cid NVARCHAR (50),
cntry NVARCHAR (50),
);

CREATE TABLE bronze.erp_px_cat_g1v2(
id NVARCHAR(50),
cat NVARCHAR (50),
subcat NVARCHAR (50),
maintenance NVARCHAR (50)
);
