-- models/host_listing_reviews.sql

WITH listings AS (
    SELECT
        id,
        host_id,
        neighbourhood,
        number_of_reviews
    FROM {{ source('airbnb', 'listings') }}
),

reviews AS (
    SELECT
        listing_id,
        COUNT(*) AS num_reviews
    FROM {{ source('airbnb', 'reviews') }}
    GROUP BY listing_id
)

SELECT
    l.host_id,
    COUNT(l.id) AS total_listings,
    AVG(r.num_reviews) AS avg_reviews_per_listing
FROM
    listings l
LEFT JOIN
    reviews r
ON
    l.id = r.listing_id
GROUP BY
    l.host_id
