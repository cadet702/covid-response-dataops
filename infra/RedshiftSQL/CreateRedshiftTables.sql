-- Had to create a Redshift Role to be able to access AWS services; tried to use that role, but failed. Ended up using access key and secret access key.
-- Had to zero out all FIPS that were NULL in Incident data source so we would still get the data in.


-- Drop Existing Version
DROP TABLE "Location";

-- Create New Table Structure
CREATE TABLE "Location"
(
  FIPS               INTEGER NOT NULL DISTKEY SORTKEY,
  County_Name        VARCHAR(50),
  State_Name         VARCHAR(25),
  Est_Population     INTEGER NOT NULL
);


-- Drop Existing Version
DROP TABLE "Incident";

-- Create New Table Structure
CREATE TABLE "Incident"
(
  Incident_Date      DATE DISTKEY,
  FIPS               INTEGER NOT NULL SORTKEY,
  Case_Count         INTEGER,
  Death_Count        INTEGER
);

-- Drop Existing Version
DROP TABLE "Hospital";

-- Create New Table Structure
CREATE TABLE "Hospital"
(
  Hospital_Name                 VARCHAR(200),
  Hospital_Type                 VARCHAR(100),
  HQ_Address                    VARCHAR(100),
  HQ_Address1                   VARCHAR(100),
  HQ_City                       VARCHAR(50),
  HQ_State                      VARCHAR(25),
  HQ_Zip                        VARCHAR(10),
  FIPS                          INTEGER NOT NULL DISTKEY SORTKEY,
  Licensed_Beds_Count           SMALLINT,
  Staffed_Beds_Count            SMALLINT,
  ICU_Beds_Count                SMALLINT,
  Adult_ICU_Beds_Count          SMALLINT,
  Pedi_ICU_Beds_Count           SMALLINT,
  Bed_Utilization               DECIMAL(8,7),
  Potential_Incr_Bed_Capacity   SMALLINT,
  Avg_Ventilator_Usage          DECIMAL(8,2)
);


