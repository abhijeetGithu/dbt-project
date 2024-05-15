with reviews AS (
    SELECT * FROM {{ source('airbnb', 'reviews') }}
)


SELECT
    listing_id,
    date
FROM
    reviews