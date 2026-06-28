{{ config (
    materialized = 'view'
) }}

WITH ref_data AS (

    SELECT
        *
    FROM
        {{ ref('seed_zero_project') }}
)
SELECT
    *
FROM
    ref_data
