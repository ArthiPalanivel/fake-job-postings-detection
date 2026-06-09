CREATE DATABASE FakeJobDB;
USE DATABASE FakeJobDB;

CREATE SCHEMA FakeJob;
USE SCHEMA FakeJob;

CREATE WAREHOUSE JobWarehouse;
USE WAREHOUSE JobWarehouse;

SELECT * FROM job_postings ;
DESC TABLE job_postings;
SELECT * FROM job_postings WHERE fraudulent IS NULL;
UPDATE job_postings SET industry='Unknown' WHERE industry IS NULL;
SELECT * FROM job_postings WHERE job_id=8194;
UPDATE job_postings SET department='Unknown' WHERE department IS NULL;
UPDATE job_postings SET employment_type='Not Specified' WHERE employment_type IS NULL;
UPDATE job_postings SET required_experience='Not Mentioned' WHERE required_experience IS NULL;
UPDATE job_postings SET required_education='Not Mentioned' WHERE required_education IS NULL; 
UPDATE job_postings SET salary_range='Not Available' WHERE salary_range IS NULL;
UPDATE job_postings SET location='Unknown' WHERE location IS NULL;

SELECT COUNT(*) AS total_jobs FROM job_postings;
SELECT COUNT(*) AS fake_jobs FROM job_postings WHERE fraudulent=1;
SELECT COUNT(*) AS real_jobs FROM job_postings WHERE fraudulent=0;

SELECT
industry,
COUNT(*) AS fake_jobs
FROM job_postings
WHERE fraudulent=1
GROUP BY industry
ORDER BY fake_jobs DESC;

SELECT required_experience, COUNT(*) as fake_jobs 
FROM job_postings
WHERE fraudulent=1
GROUP BY required_experience
ORDER BY fake_jobs DESC;

SELECT location, COUNT(*) as fake_jobs 
FROM job_postings
WHERE fraudulent=1
GROUP BY location
ORDER BY fake_jobs DESC;

CREATE VIEW fraud_summary AS
SELECT
industry,
COUNT(*) AS fake_jobs
FROM job_postings
WHERE fraudulent=1
GROUP BY industry;

CREATE VIEW experience_analysis AS
SELECT
required_experience,
COUNT(*) AS fake_jobs
FROM job_postings
WHERE fraudulent=1
GROUP BY required_experience;

CREATE VIEW location_analysis AS
SELECT
location,
COUNT(*) AS fake_jobs
FROM job_postings
WHERE fraudulent=1
GROUP BY location;

CREATE VIEW locations_analysis AS
SELECT
job_id,
COALESCE(NULLIF(SPLIT_PART(location, ',', 1),''),'Unknown') AS country,
COALESCE(NULLIF(TRIM(SPLIT_PART(location, ',', 2)),''),'Unknown') AS state_region,
COALESCE(NULLIF(TRIM(SPLIT_PART(location, ',', 3)),''),'Unknown') AS city,
fraudulent
FROM job_postings;

CREATE OR REPLACE VIEW job_posting AS
SELECT
 *,
COALESCE(NULLIF(TRIM(SPLIT_PART(location, ',',1)),''),'Location Not Specified') AS country,
COALESCE(NULLIF(TRIM(SPLIT_PART(location, ',',2)),''),'Location Not Specified') AS state_region,
COALESCE(NULLIF(TRIM(SPLIT_PART(location, ',',3)),''),'Location Not Specified') AS city,
COALESCE(has_company_logo, 0) AS has_company_logo_clean,
COALESCE(has_questions, 0) AS has_questions_clean,
COALESCE(telecommuting, 0) AS telecommuting_clean,
COALESCE(company_profile, 'Not Available') AS company_profile_clean
FROM job_postings;
 
CREATE OR REPLACE VIEW locations_analysis AS
SELECT
    job_id,
    city,
    fraudulent,
    CASE country
        WHEN 'US' THEN 'United States'
        WHEN 'GB' THEN 'United Kingdom'
        WHEN 'CA' THEN 'Canada'
        WHEN 'AU' THEN 'Australia'
        WHEN 'DE' THEN 'Germany'
        WHEN 'IN' THEN 'India'
        WHEN 'FR' THEN 'France'
        WHEN 'NL' THEN 'Netherlands'
        WHEN 'SG' THEN 'Singapore'
        WHEN 'NZ' THEN 'New Zealand'
        WHEN 'IE' THEN 'Ireland'
        WHEN 'IL' THEN 'Israel'
        WHEN 'GR' THEN 'Greece'
        WHEN 'PH' THEN 'Philippines'
        WHEN 'PK' THEN 'Pakistan'
        WHEN 'NG' THEN 'Nigeria'
        WHEN 'ZA' THEN 'South Africa'
        WHEN 'BR' THEN 'Brazil'
        WHEN 'MX' THEN 'Mexico'
        WHEN 'JP' THEN 'Japan'
        WHEN 'CN' THEN 'China'
        WHEN 'AE' THEN 'United Arab Emirates'
        WHEN 'HK' THEN 'Hong Kong'
        WHEN 'MY' THEN 'Malaysia'
        WHEN 'IT' THEN 'Italy'
        WHEN 'ES' THEN 'Spain'
        WHEN 'PT' THEN 'Portugal'
        WHEN 'SE' THEN 'Sweden'
        WHEN 'NO' THEN 'Norway'
        WHEN 'DK' THEN 'Denmark'
        WHEN 'FI' THEN 'Finland'
        WHEN 'CH' THEN 'Switzerland'
        WHEN 'AT' THEN 'Austria'
        WHEN 'BE' THEN 'Belgium'
        WHEN 'PL' THEN 'Poland'
        WHEN 'RU' THEN 'Russia'
        ELSE COALESCE(country, 'Unknown')
    END AS country,
    CASE state_region
        WHEN 'AL' THEN 'Alabama'
        WHEN 'AK' THEN 'Alaska'
        WHEN 'AZ' THEN 'Arizona'
        WHEN 'AR' THEN 'Arkansas'
        WHEN 'CA' THEN 'California'
        WHEN 'CO' THEN 'Colorado'
        WHEN 'CT' THEN 'Connecticut'
        WHEN 'DE' THEN 'Delaware'
        WHEN 'FL' THEN 'Florida'
        WHEN 'GA' THEN 'Georgia'
        WHEN 'HI' THEN 'Hawaii'
        WHEN 'ID' THEN 'Idaho'
        WHEN 'IL' THEN 'Illinois'
        WHEN 'IN' THEN 'Indiana'
        WHEN 'IA' THEN 'Iowa'
        WHEN 'KS' THEN 'Kansas'
        WHEN 'KY' THEN 'Kentucky'
        WHEN 'LA' THEN 'Louisiana'
        WHEN 'ME' THEN 'Maine'
        WHEN 'MD' THEN 'Maryland'
        WHEN 'MA' THEN 'Massachusetts'
        WHEN 'MI' THEN 'Michigan'
        WHEN 'MN' THEN 'Minnesota'
        WHEN 'MS' THEN 'Mississippi'
        WHEN 'MO' THEN 'Missouri'
        WHEN 'MT' THEN 'Montana'
        WHEN 'NE' THEN 'Nebraska'
        WHEN 'NV' THEN 'Nevada'
        WHEN 'NH' THEN 'New Hampshire'
        WHEN 'NJ' THEN 'New Jersey'
        WHEN 'NM' THEN 'New Mexico'
        WHEN 'NY' THEN 'New York'
        WHEN 'NC' THEN 'North Carolina'
        WHEN 'ND' THEN 'North Dakota'
        WHEN 'OH' THEN 'Ohio'
        WHEN 'OK' THEN 'Oklahoma'
        WHEN 'OR' THEN 'Oregon'
        WHEN 'PA' THEN 'Pennsylvania'
        WHEN 'RI' THEN 'Rhode Island'
        WHEN 'SC' THEN 'South Carolina'
        WHEN 'SD' THEN 'South Dakota'
        WHEN 'TN' THEN 'Tennessee'
        WHEN 'TX' THEN 'Texas'
        WHEN 'UT' THEN 'Utah'
        WHEN 'VT' THEN 'Vermont'
        WHEN 'VA' THEN 'Virginia'
        WHEN 'WA' THEN 'Washington'
        WHEN 'WV' THEN 'West Virginia'
        WHEN 'WI' THEN 'Wisconsin'
        WHEN 'WY' THEN 'Wyoming'
        WHEN 'DC' THEN 'Washington D.C.'
        ELSE COALESCE(state_region, 'Unknown')
    END AS state_region

FROM JOB_POSTING;
SELECT *
FROM JOB_POSTING
LIMIT 10;
SELECT *
FROM job_postings
WHERE company_profile LIKE '%Local Projects is a media design firm%';
