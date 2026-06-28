{{ config (
    materialized = 'view'
) }}

WITH src_dept AS (

    SELECT
        id,
        name,
        sal,
        case 
        when sal>1000 then 'High'
        when sal>500 then 'Medium' else 'Low' end as sal_bracket,
        current_date as load_dt
    FROM
        {{source('dbtsnow', 'adept')}}
)
SELECT
    *
FROM
    src_dept
