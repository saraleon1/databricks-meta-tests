with sources as (

    select * from {{ ref('stg_test_results_central') }}

),

filtered as (

    select * from sources

    where test_result IN ('warn', 'fail')

)

select * from filtered