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
