{% set configs = [
    {
        "table" : "AIRBNB.GOLD.OBT",
        "columns" : "gold_obt.BOOKING_ID,
                     gold_obt.LISTING_ID,
                     gold_obt.HOST_ID,
                     gold_obt.TOTAL_AMOUNT,
                     gold_obt.BEDROOMS,
                     gold_obt.BATHROOMS,
                     gold_obt.ACCOMMODATES,
                     gold_obt.PRICE_PER_NIGHT,
                     gold_obt.RESPONSE_RATE
                    ",
        "alias" : "gold_obt"
    }, 
    {
        "table" : "AIRBNB.GOLD.DIM_LISTINGS",
        "columns" : "gold_listings.host_id as ",
        "alias" : "gold_listings" ,
        "join_condition" : "gold_obt.listing_id = gold_listings.listing_id" 
    },
    {
        "table" : "AIRBNB.GOLD.DIM_HOSTS",
        "columns" : "",
        "alias" : "gold_hosts" ,
        "join_condition" : "gold_obt.host_id = gold_hosts.host_id" 
    }

]%}



SELECT
    {{configs[0]['columns']}}
FROM 
    {% for config in configs %}
        {% if loop.first %}
            {{config["table"]}} as {{ config["alias"]}}
        {%else%}
            LEFT JOIN {{config["table"]}} as {{ config["alias"]}} 
            ON {{config["join_condition"]}}
        {% endif %}
    {% endfor %}