with source as (

    select * from {{ source('dbt_sleon_dev_dbt_test__audit', 'unique_dim_parts_manufacturer') }}

),

renamed as (

    select
        unique_field,
        n_records

    from source

)

select * from renamed