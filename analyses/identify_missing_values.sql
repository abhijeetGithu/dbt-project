-- analyses/identify_missing_values.sql

-- This SQL script identifies missing values in the stg_listings and stg_reviews tables

-- Identify missing values in stg_listings
WITH stg_listings AS (
    SELECT
        id,
        name,
        host_id,
        host_name,
        neighbourhood,
        latitude,
        longitude,
        room_type,
        CAST(
            REPLACE(
                REPLACE(price, '$', ''), 
                ',', ''
            ) AS FLOAT
        ) AS price,
        last_review,
        reviews_per_month,
        calculated_host_listings_count,
        availability_365,
        number_of_reviews as number_of_reviews_ltm
    FROM {{ ref('stg_listings') }}
)

SELECT
    'stg_listings' AS table_name,
    'id' AS column_name,
    COUNT(*) AS missing_count
FROM
    stg_listings
WHERE
    id IS NULL

UNION ALL

SELECT
    'stg_listings' AS table_name,
    'name' AS column_name,
    COUNT(*) AS missing_count
FROM
    stg_listings
WHERE
    name IS NULL

-- Repeat the above pattern for each column in the stg_listings table
-- Adjust column names and conditions accordingly

UNION ALL

-- Identify missing values in stg_reviews
WITH stg_reviews AS (
    SELECT
        *
    FROM {{ ref('stg_reviews') }}
)

SELECT
    'stg_reviews' AS table_name,
    'listing_id' AS column_name,
    COUNT(*) AS missing_count
FROM
    stg_reviews
WHERE
    listing_id IS NULL

UNION ALL

SELECT
    'stg_reviews' AS table_name,
    'date' AS column_name,
    COUNT(*) AS missing_count
FROM
    stg_reviews
WHERE
    date IS NULL

-- Repeat the above pattern for each column in the stg_reviews table
-- Adjust column names and conditions accordingly
