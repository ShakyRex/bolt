-- test for customer contacts

SELECT
    customer_id
FROM
    {{ source('schema','customer') }}
WHERE
    email IS NULL
    OR phone_number IS NULL

