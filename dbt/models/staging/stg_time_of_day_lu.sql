with
source as (
    select * from {{ source('raw', 'time_of_day_lu') }}
)

select * from source