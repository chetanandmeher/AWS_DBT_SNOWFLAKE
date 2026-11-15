{# {% set nights_booked = 0 %}

SELECT * FROM {{ ref('bronze_bookings') }}
where NIGHTS_BOOKED = {{nights_booked}} #}


select * from {{ ref('silver_bookings') }}
{# select * from {{ ref('silver_listings') }} #}
{# select * from {{ ref('silver_bookings') }} #}