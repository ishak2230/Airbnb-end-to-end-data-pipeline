{% set congigs = [
    {
        "table_name": "AIRBNB.GOLD.OBT",
        "columns" : "GOLD_obt.BOOKING_ID,GOLD_obt.LISTING_ID,GOLD_obt.HOST_ID,GOLD_obt.TOTAL_AMOUNT,GOLD_obt.SERVICE_FEE,GOLD_obt.CLEANING_FEE,GOLD_obt.ACCOMMODATES,GOLD_obt.BEDROOMS,GOLD_obt.BATHROOMS,GOLD_obt.PRICE_PER_NIGHT,GOLD_obt.RESPONSE_RATE",
        "alias" :"GOLD_obt"
    },
    {
        "table_name": "AIRBNB.GOLD.DIM_LISTINGS",
        "columns" : "",
        "alias" :"dim_listings",
        "join_condition" : "GOLD_OBT.LISTING_ID = dim_listings.LISTING_ID"
    },
    {
        "table_name": "AIRBNB.GOLD.DIM_HOSTS",
        "columns" : "",
        "alias" :"dim_hosts",
        "join_condition" : "GOLD_OBT.HOST_ID = dim_hosts.HOST_ID"
    }
]%} 

SELECT 
    {{congigs[0]['columns']}}

FROM
    {% for config in congigs %}
    {% if loop.first %}
       {{config['table_name'] }} AS  {{config['alias'] }}   
    {% else %}
        LEFT JOIN {{config['table_name'] }} AS  {{config['alias'] }}
        ON {{config['join_condition'] }} 
    {% endif %}
    {%endfor%}
    