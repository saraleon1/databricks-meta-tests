{% snapshot my_package_model_tagged_history %}

    {{
        config(
          target_schema='snapshots',
          strategy='check',
          unique_key='id',
          check_cols=['trusted']
        )
    }}

    select * from {{ ref('my_package_model_tagged') }}

{% endsnapshot %}