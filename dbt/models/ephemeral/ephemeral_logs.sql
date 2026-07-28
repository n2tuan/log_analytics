{{config(
    materialized = 'ephemeral'
)}}

with

source as (

    select * from {{ source('raw','game_logs') }}

),

parsed as (

    select
        (RAW_LOG->>'ip_address')::varchar as ip_address,
        (RAW_LOG->>'user_login')::varchar as user_login,
        (RAW_LOG->>'user_event')::varchar as user_event,
        (RAW_LOG->>'datetime_iso8601')::TIMESTAMP as datetime_iso8601,
        ingested_at
    from source

)

select * from parsed