-- models/listings_aggregates.sql

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
    COUNT(reviews.listing_id) AS total_reviews,
    AVG(listings.price) AS avg_price
FROM
    listings
LEFT JOIN
    reviews
ON
    listings.id = reviews.listing_id
GROUP BY
    listings.neighbourhood
