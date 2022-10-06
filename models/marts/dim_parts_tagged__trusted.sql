with staged_source as (

    select * from {{ ref('stg_dim_parts_base') }}

),

final as (

    select *,

        true as trusted

    from staged_source
)



select * from final