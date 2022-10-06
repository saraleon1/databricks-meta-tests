with sources as (

    select * from {{ source('dbt_sleon_dev', 'dim_parts') }}

),

renamed as (

    select
        part_key,
        manufacturer,
        name,
        brand,
        type,
        size,
        container,
        retail_price

    from sources

)

(select * from renamed limit 5)

union all

(select * from renamed limit 3)

union all

(
select
        null as part_key,
        null as manufacturer,
        "1" as name,
        null as brand,
        null as type,
        null as size,
        null as container,
        null as retail_price
)

