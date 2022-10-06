with staged_source as (

    select * from {{ ref('stg_dim_parts_base') }}

),

final as (

    select *,

        false as trusted

    from staged_source
    where (manufacturer ="Manufacturer#1") -- OR  (manufacturer = "Manufacturer#2")

)


select * from final