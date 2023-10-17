CREATE DATABASE PROJECT_TWO;
USE DATABASE PROJECT_TWO;

# Staging
CREATE SCHEMA "PROJECT_TWO"."STAGING";
USE SCHEMA STAGING;
!DEFINE file_path=/mnt/c/Users/fuhr/Documents/Arquitetura de Dados/Projects/Project_2_Gabriel_Tobias_Fuhr/data;
!SET variable_substitution=true;

# YELP Data - Business
PUT 'file:///&{file_path}/yelp/business/business_prepared_*' @my_json_stage/business auto_compress=true PARALLEL=10;

COPY INTO BUSINESS FROM @my_json_stage/business MATCH_BY_COLUMN_NAME=CASE_INSENSITIVE;

# YELP Data - User:
PUT 'file:///&{file_path}/yelp/user/user_prepared_*' @my_json_stage/user auto_compress=true PARALLEL=10;

COPY INTO user FROM @my_json_stage/user MATCH_BY_COLUMN_NAME=CASE_INSENSITIVE;

# YELP Data - Review:
PUT 'file:///&{file_path}/yelp/review/review_prepared_*' @my_json_stage/review auto_compress=true PARALLEL=10;

COPY INTO review FROM @my_json_stage/review MATCH_BY_COLUMN_NAME=CASE_INSENSITIVE;

# YELP Data - Tip:
PUT 'file:///&{file_path}/yelp/tip/tip_prepared_*' @my_json_stage/tip auto_compress=true PARALLEL=10;

COPY INTO tip FROM @my_json_stage/tip MATCH_BY_COLUMN_NAME=CASE_INSENSITIVE;

# YELP Data - Checkin:
PUT 'file:///&{file_path}/yelp/checkin/checkin_prepared_*' @my_json_stage/checkin auto_compress=true PARALLEL=10;

COPY INTO checkin FROM @my_json_stage/checkin MATCH_BY_COLUMN_NAME=CASE_INSENSITIVE;

# YELP Data - Covid Features:
PUT 'file:///&{file_path}/yelp/covid_features/covid_features_prepared_*' @my_json_stage/covid_features auto_compress=true PARALLEL=10;

COPY INTO covid_features(BUSINESS_ID, HIGHLIGHTS, DELIVERY_OR_TAKEOUT, GRUBHUB_ENABLED, CALL_TO_ACTION_ENABLED, REQUEST_A_QUOTE_ENABLED, COVID_BANNER, TEMPORARY_CLOSED_UNTIL, VIRTUAL_SERVICES_OFFERED) 
FROM (SELECT 
    $1:business_id::varchar, 
    $1:highlights::variant,
    $1:"delivery or takeout"::boolean,
    $1:"Grubhub enabled"::boolean,
    $1:"Call To Action enabled"::boolean,
    $1:"Request a Quote Enabled"::boolean,
    $1:"Covid Banner"::variant,
    $1:"Temporary Closed Until"::variant,
    $1:"Virtual Services Offered"::variant
FROM @my_json_stage/covid_features);


# Weather Data
PUT 'file:///&{file_path}/precipitation.csv' @my_csv_stage auto_compress=true;
PUT 'file:///&{file_path}/temperature.csv' @my_csv_stage auto_compress=true;



