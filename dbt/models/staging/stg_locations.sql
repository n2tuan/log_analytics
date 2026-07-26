with 

source as (
    select * from {{ source('raw','locations') }}
)

,filtered as (
    select
        JOIN_KEY,
        START_IP_INT::BIGINT as START_IP_INT,
        END_IP_INT::BIGINT as END_IP_INT,
        START_IP,
        END_IP,
        CITY,
        REGION,
        COUNTRY,
        TIMEZONE
    from source
    where TRY_CAST(START_IP_INT AS BIGINT) IS NOT NULL
)

select * from filtered