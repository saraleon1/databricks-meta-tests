
with source as (

    select * from {{ source('dbt_sleon_dev', 'my_package_model') }}

),

renamed as (

    select
        id,
        col2,
        true as trusted

    from source

)

select * from renamed
