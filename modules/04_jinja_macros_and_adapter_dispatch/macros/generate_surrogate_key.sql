-- Cross-database surrogate key macro using MD5 hash
{% macro generate_surrogate_key(field_list) %}
    {{ return(adapter.dispatch('generate_surrogate_key', 'dbt_handbook')(field_list)) }}
{% endmacro %}

{% macro default__generate_surrogate_key(field_list) %}
    md5(
        concat_ws('||',
            {% for field in field_list %}
                coalesce(cast({{ field }} as string), '_dbt_null_')
                {% if not loop.last %}, {% endif %}
            {% endfor %}
        )
    )
{% endmacro %}

{% macro bigquery__generate_surrogate_key(field_list) %}
    to_hex(md5(
        concat(
            {% for field in field_list %}
                coalesce(cast({{ field }} as string), '_dbt_null_')
                {% if not loop.last %}, '||', {% endif %}
            {% endfor %}
        )
    ))
{% endmacro %}
