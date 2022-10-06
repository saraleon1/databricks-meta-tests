with staged_source as (

    select * from {{ ref('stg_dim_parts_base') }}

),

final as (

    select *,

        false as trusted

    from staged_source
    where part_key is null -- the test

)


select * from final