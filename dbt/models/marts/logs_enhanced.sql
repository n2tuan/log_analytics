
{{ config(
    pre_hook="LOAD netquack"
) }}

with 

log as (
    select * from {{ ref('int_logs_locations') }}
)
,tod as (
    select * from {{ ref('stg_time_of_day_lu') }}
)

select  log.IP_ADDRESS
        , log.GAMER_NAME
        , log.GAME_EVENT_NAME
        , log.GAME_EVENT_UTC
        , log.CITY
        , log.REGION
        , log.COUNTRY
        , log.GAMER_LTZ_NAME
        , log.GAME_EVENT_LTZ
        , dayname(log.GAME_EVENT_LTZ) as DOW_NAME
        , tod.tod_name
from log 
join tod
    on HOUR(log.GAME_EVENT_LTZ) = tod.hour