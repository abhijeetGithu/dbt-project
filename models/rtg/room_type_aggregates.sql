-- models/room_type_aggregates.sql

WITH listings AS (
    SELECT
        id,
        name,
        host_id,
        host_name,
        neighbourhood_group,
        neighbourhood,
        latitude,
        longitude,
        room_type,
        price,
        minimum_nights,
        number_of_reviews,
        reviews_per_month,
        calculated_host_listings_count,
        availability_365,
        number_of_reviews_ltm
    FROM {{ source('airbnb', 'listings') }}
),

reviews AS (
    SELECT
        listing_id,
        date
    FROM {{ source('airbnb', 'reviews') }}
)

SELECT
    listings.neighbourhood,
    listings.room_type,
    COUNT(listings.id) AS total_listings,
    AVG(listings.reviews_per_month) AS avg_reviews_per_month,
    MAX(listings.availability_365) AS max_availability
FROM
    listings
LEFT JOIN
    reviews
ON
    listings.id = reviews.listing_id
GROUP BY
    listings.neighbourhood,
    listings.room_type
