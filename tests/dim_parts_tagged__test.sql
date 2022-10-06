

{% set relations = [ref('dim_parts_tagged__null'), ref('dim_parts_tagged__trusted'), ref('dim_parts_tagged__invalid_manufacturer')] %}
select * from (
{{ dbt_utils.union_relations(relations = relations) }} 
)

where trusted = false

