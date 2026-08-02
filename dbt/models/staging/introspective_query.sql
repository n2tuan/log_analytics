{{
    config(
        enabled = false
    )
}}

{% if execute %}
    {% set relation_exists = run_query(
        "select count(*) from information_schema.tables"
    ) %}

    {{ log("Result: " ~ relation_exists.columns[0][0], info=True) }}
{% endif %}

select
    1 as id,
    'Hello dbt' as message