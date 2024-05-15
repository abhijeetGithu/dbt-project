with listings AS (
    SELECT * FROM {{ source('airbnb', 'listings') }}
)
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
FROM
    listings