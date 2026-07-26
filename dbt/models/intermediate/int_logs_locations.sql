with 

log as (
    select * from {{ ref('stg_logs') }}
)

,loc as (
    select * from {{ ref('stg_locations') }}
)

,joined as (
    select  log.ip_address as IP_ADDRESS
            ,ip_to_int(log.ip_address) as IP_ADDRESS_INT
            , log.user_login as GAMER_NAME
            , log.user_event as GAME_EVENT_NAME
            , log.datetime_iso8601 as GAME_EVENT_UTC
            , loc.city as CITY
            , loc.region as REGION
            , loc.country as COUNTRY
            , loc.timezone as GAMER_LTZ_NAME
            , timezone(loc.timezone , log.DATETIME_ISO8601)  as GAME_EVENT_LTZ

    from log 
    join loc
        on ip_to_int(log.ip_address) between loc.start_ip_int and end_ip_int
)

select * from joined