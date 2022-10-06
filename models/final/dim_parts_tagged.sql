
with ranked as (


    {% set relations = [ref('dim_parts_tagged__null'), ref('dim_parts_tagged__trusted'), ref('dim_parts_tagged__invalid_manufacturer')] %}
    SELECT *, rank() OVER(PARTITION BY part_key ORDER BY trusted) as rnk FROM  (
    {{ dbt_utils.union_relations(relations = relations) }} 
    )
),

final as (
    select * from ranked
    where rnk = 1
)


select * from final