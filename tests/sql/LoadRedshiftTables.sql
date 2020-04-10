copy location from 's3://covidcoloradoresponse-data-1930/Curated/County_Population_TRANSFORMED.csv' 
credentials 'aws_access_key_id=AKIAXGXR6YQZF7PCBLYM;aws_secret_access_key=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' 
ignoreheader 1
ignoreblanklines
delimiter ','
region 'us-east-1';


copy incident from 's3://covidcoloradoresponse-data-1930/Curated/us-counties-cases-and-deaths_TRANSFORMED.csv' 
credentials 'aws_access_key_id=AKIAXGXR6YQZF7PCBLYM;aws_secret_access_key=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' 
ignoreheader as 1
ignoreblanklines
dateformat as 'auto'
delimiter ','
region 'us-east-1';


copy hospital from 's3://covidcoloradoresponse-data-1930/Curated/hospital_data_CONVERTED_TRANSFORMED.csv' 
credentials 'aws_access_key_id=AKIAXGXR6YQZF7PCBLYM;aws_secret_access_key=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' 
ignoreheader as 1
ignoreblanklines
delimiter ','
region 'us-east-1';


-- Query for viewing load errors:
SELECT * FROM stl_load_errors;


--NOT WORKING !!!
/* copy hospital
(fips, hospital_name, hospital_type, hq_address, hq_address1, hq_city, hq_state, hq_zip, licensed_beds_count,
staffed_beds_count, icu_beds_count, adult_icu_beds_count, pedi_icu_beds_count, bed_utilization, potential_incr_bed_capacity)
from 's3://covidcoloradoresponse-data-1930/Curated/usa-hospital-beds.geojson' 
credentials 'aws_access_key_id=AKIAXGXR6YQZF7PCBLYM;aws_secret_access_key=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' 
json 's3://covidcoloradoresponse-data-1930/Curated/usa-hospital-beds.jsonpaths'
region 'us-east-1'; */

