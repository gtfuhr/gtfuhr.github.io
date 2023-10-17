# Design a Data Warehouse for Reporting and OLAP

Project rubric:

## Staging:
Students will be able to (SWBAT) load local data files into a Snowflake staging schema, using the command-line snowsql tool:
![01_staging_etl_snowsql_yelp_files](01_staging_etl_snowsql_yelp_files.png)
![02_staging_stage_files_yelp](02_staging_stage_files_yelp.png)
![03_staging_stage_files_yelp_checkin](03_staging_stage_files_yelp_checkin.png) 
![04_staging_stage_files_yelp_covid_features](04_staging_stage_files_yelp_covid_features.png) 
![05_staging_stage_files_yelp_tip](05_staging_stage_files_yelp_tip.png) 
![06_staging_stage_files_yelp_review](06_staging_stage_files_yelp_review.png) 
![07_staging_stage_files_yelp_user](07_staging_stage_files_yelp_user.png) 
![08_staging_stage_files_yelp_business](08_staging_stage_files_yelp_business.png)
![001_snowsql_proof](001_snowsql_proof.png)
SWBAT load data files smaller than 50 MB into Snowflake using browser.
![09_staging_csv_files_temp_precipitation](09_staging_csv_files_temp_precipitation.png)
![010_staging_csv_files_temp_precipitation_proof](010_staging_csv_files_temp_precipitation_proof.png) 
![011_staging_csv_files_temp_precipitation_etl](011_staging_csv_files_temp_precipitation_etl.png) 

SWBAT create a data architecture diagram showing the data files to stage to ODS to DWH to reporting.

![00_data_architecture](00_data_architecture.png)

## Operational Data Store:
SWBAT use snowsql to transform data from staging to ODS.
![10_ods_ddl_etl](10_ods_ddl_etl.png) 
![13_ods_ddl_etl](13_ods_ddl_etl.png) 
![14_ods_ddl_etl](14_ods_ddl_etl.png)

SWBAT expand and spread JSON data into individual columns.
![12_ods_ddl_etl](12_ods_ddl_etl.png) 

SWBAT calculate and compare data compression between raw files, staging, and ODS.
![02_staging_stage_files_yelp](02_staging_stage_files_yelp.png)
![010_staging_csv_files_temp_precipitation_proof](010_staging_csv_files_temp_precipitation_proof.png)
![17_ods_table_sizes](17_ods_table_sizes.png)
![18_staging_table_sizes](18_staging_table_sizes.png)

SWBAT reverse engineer data sets into an entity relationship model.
![15_ods_ER](15_ods_ER.png)

SWBAT integrate climate and Yelp data sets by identifying a common data field.
![19_yelp_climate_common_field_integration](19_yelp_climate_common_field_integration.png)

## Data Warehouse:
SWBAT design a star schema with dimensions and fact tables.
![21_dwh_star_schema](21_dwh_star_schema.png)

SWBAT extract, transform and load from ODS model to DWH model.
![20_dwh_ddl_etl](20_dwh_ddl_etl.png)

SWBAT write SQL queries to generate a correlation report between climate data and Yelp data.
![22_dwh_query](22_dwh_query.png)
![A23_dwh_query](23_dwh_query.png)

Finally, the DataWarehouse can be used to do analytics on the business data.
