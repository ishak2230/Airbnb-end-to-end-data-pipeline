{{ config(materialized='incremental',unique_key='HOST_ID')}}

SELECT
    HOST_ID,
    REPLACE(HOST_NAME, ' ', '_') as HOST_NAME,
    HOST_SINCE AS HOST_SINCE,
    IS_SUPERHOST AS IS_SUPERHOST,
    RESPONSE_RATE AS RESPONSE_RATE,
    case
        when RESPONSE_RATE > 95 then 'VERY GOOD'
        when RESPONSE_RATE > 80 then 'GOOD'
        WHEN RESPONSE_RATE > 60 THEN 'FAIR'
        else 'POOR'
    end as RESPONSE_RATE_QUALITY,
    CREATED_AT AS CREATED_AT
FROM
    {{ref('bronze_hosts')}}