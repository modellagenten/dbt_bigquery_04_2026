{# 
 Wandelt einen Cent-Betrag in Euro um.
 Nutzung: {{ cents_to_euros('price_cents') }} -> round(price_cents /
100.0, 2)
#}
{% macro cents_to_euros(column_name, precision=2) %}
 round({{ column_name }} / 100.0, {{ precision }})
{% endmacro %}