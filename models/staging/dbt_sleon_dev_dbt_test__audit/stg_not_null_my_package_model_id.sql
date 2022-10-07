with source as (

    select * from {{ source('dbt_sleon_dev_dbt_test__audit', 'not_null_my_package_model_id') }}

),

renamed as (

    select
        id,
        col2,
        false as trusted

    from source

)

select * from renamed