{% set congigs = [
    {
        "table_name": "AIRBNB.SILVER.SILVER_BOOKINGS",
        "columns" : "SILVER_BOOKINGS.*",
        "alias" :"silver_bookings"
    },
    {
        "table_name": "AIRBNB.SILVER.SILVER_LISTINGS",
        "columns" : "SILVER_listings.HOST_ID,SILVER_listings.PROPERTY_TYPE,SILVER_listings.ROOM_TYPE,SILVER_listings.CITY,SILVER_listings.COUNTRY,SILVER_listings.ACCOMMODATES,SILVER_listings.BEDROOMS,SILVER_listings.BATHROOMS,SILVER_listings.PRICE_PER_NIGHT,SILVER_listings.PRICE_PER_NIGHT_TAG,SILVER_listings.CREATED_AT AS LISTINGS_CREATED_AT",
        "alias" :"silver_listings",
        "join_condition" : "silver_bookings.LISTING_ID = silver_listings.LISTING_ID"
    },
    {
        "table_name": "AIRBNB.SILVER.SILVER_HOSTS",
        "columns" : "SILVER_HOSTS.HOST_NAME,SILVER_HOSTS.HOST_SINCE,SILVER_HOSTS.IS_SUPERHOST,SILVER_HOSTS.RESPONSE_RATE,SILVER_HOSTS.RESPONSE_RATE_QUALITY,SILVER_HOSTS.CREATED_AT AS HOSTS_CREATED_AT",
        "alias" :"silver_hosts",
        "join_condition" : "silver_listings.HOST_ID = silver_hosts.HOST_ID"
    }
]%} 

SELECT 
    {% for config in congigs %}
    {{config['columns']}}{%if not loop.last %},{%endif%}
    {%endfor%}
FROM
    {% for config in congigs %}
    {% if loop.first %}
       {{config['table_name'] }} AS  {{config['alias'] }}   
    {% else %}
        LEFT JOIN {{config['table_name'] }} AS  {{config['alias'] }}
        ON {{config['join_condition'] }} 
    {% endif %}
    {%endfor%}
    