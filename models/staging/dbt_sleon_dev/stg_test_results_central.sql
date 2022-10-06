with source as (

    select * from {{ source('dbt_sleon_dev', 'test_results_central') }}

),

renamed as (

    select
        test_name,
        test_name_long,
        test_type,
        model_refs,
        source_refs,
        test_severity_config,
        execution_time_seconds,
        test_result,
        failures,
        file_test_defined,
        _timestamp

    from source

)

select * from renamed