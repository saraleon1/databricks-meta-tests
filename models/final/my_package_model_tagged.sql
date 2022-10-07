with ranked as (


    {% set relations = [ref('stg_my_package_model'), ref('stg_not_null_my_package_model_id')] %}
    SELECT *, rank() OVER(PARTITION BY id ORDER BY trusted) as rnk FROM  (
    {{ dbt_utils.union_relations(relations = relations) }} 
    )
),

final as (
    select id, col2, trusted from ranked
    where rnk = 1
)


select * from final