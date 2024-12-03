version: 1

sources:
  - name: air_bolt
    database: database_name
    schema: schema_name
    tables:
      - name: customers
        columns:
          - name: id
            tests:
              - unique
              - not_null

      - name: customer_group
        columns:
          - name: id
            tests:
              - unique
              - not_null
        - name: aeroplane
          columns:
            -name: airplane_id
                tests:
                  - unique
                  - not_null
        - name: trip
          columns:
            -name: trip_id
                tests:
                  - unique
                  - not_null
            - name: origin_city
                tests:
                  - not_null
            - name: destination_city
                tests:
                  - not_null
            - name: airplane_id
                tests:
                  - not_null
            - name: start_timestamp
                tests:
                  - not_null
            - name: end_timestamp
                tests:
                  - not_null
        - name: order
          columns:
            - name: order_id
                tests:
                  - unique
                  - not_null
            - name: customer_id
                tests:
                  - not_null
            - name: trip_id
                tests:
                  - not_null
            - name: price_euro
                tests:
                  - not_null
            - name: status
                tests:
                accepted_values:
                    values:
                        - Finished
                        - Booked
                        - Cancelled

