/*
path: model.tpl
type: file
unique_id: SPWHx7vM
icon: ico-field
*/
{% set fieldName = field.column_name | friendly %}
{% set imports = [] %}
{% set scale = field.decimalScale | default(0) %}
{% set type = 'Integer' %}

{% if scale > 0 %}
    {% set type = 'BigDecimal' %}
    {% set imports = imports | merge(['java.math.BigDecimal']) %}
{% else %}
    {% set requiresLong = false %}
    {% if field.isAllowed is defined and field.isAllowed | length > 10 %} {% set requiresLong = true %} {% endif %}
    {% if field.minLimit is defined and field.minLimit | length > 10 %} {% set requiresLong = true %} {% endif %}
    {% if requiresLong %}
        {% set type = 'Long' %}
    {% endif %}
{% endif %}

{% set isRequired = field.required | default(false) %}
{% set isUnique = field.unique | default(false) %}
{% set defaultValue = field.defaultValue | default(null) %}
{% set maxValue = field.isAllowed | default(null) %}
{% set minValue = field.minLimit | default(null) %}
{% set allowNegative = field.allowNegative | default('none') %}

{% set annotations = [] %}

{% set columnArgs = [] %}
{% set columnArgs = columnArgs|merge(['name = "' ~ fieldName ~ '"']) %}
{% if isRequired %}
    {% set columnArgs = columnArgs|merge(['nullable = false']) %}
{% endif %}
{% if isUnique %}
    {% set columnArgs = columnArgs|merge(['unique = true']) %}
{% endif %}
{% if type == 'BigDecimal' %}
    {% set precision = field.length | default(0) %}
    {% if precision > 0 %}
         {% set columnArgs = columnArgs|merge(['precision = ' ~ precision]) %}
    {% endif %}
    {% if scale >= 0 %}
         {% set columnArgs = columnArgs|merge(['scale = ' ~ scale]) %}
    {% endif %}
{% endif %}
{% set annotations = annotations|merge(['@Column(' ~ (columnArgs|join(', ')) ~ ')']) %}

{% if isRequired %}
    {% set annotations = annotations|merge(['@jakarta.validation.constraints.NotNull']) %}
    {% set imports = imports | merge(['jakarta.validation.constraints.NotNull']) %}
{% endif %}
{% if maxValue is not null and maxValue|length > 0 %}
    {% set annotations = annotations|merge(['@jakarta.validation.constraints.Max(value = ' ~ maxValue ~ (type == 'Long' ? 'L' : '') ~ ')']) %}
    {% set imports = imports | merge(['jakarta.validation.constraints.Max']) %}
{% endif %}
{% if minValue is not null and minValue|length > 0 %}
    {% set annotations = annotations|merge(['@jakarta.validation.constraints.Min(value = ' ~ minValue ~ (type == 'Long' ? 'L' : '') ~ ')']) %}
    {% set imports = imports | merge(['jakarta.validation.constraints.Min']) %}
{% endif %}
{% if allowNegative == 'false' %}
    {% set annotations = annotations|merge(['@jakarta.validation.constraints.PositiveOrZero']) %}
    {% set imports = imports | merge(['jakarta.validation.constraints.PositiveOrZero']) %}
{% endif %}

{% set generatedCode %}
{% for annotation in annotations %}
{{ annotation }}
{% endfor %}
private {{ type }} {{ fieldName }}{% if defaultValue is not null and defaultValue|length > 0 %} = {% spaceless %}
    {% if type == 'Long' %}
        {{ defaultValue }}L
    {% elseif type == 'Float' %}
        {{ defaultValue }}f
    {% elseif type == 'BigDecimal' %}
        new BigDecimal("{{ defaultValue }}")
        {% set imports = imports | merge(['java.math.BigDecimal']) %}
    {% else %}
        {{ defaultValue }}
    {% endif %}
{% endspaceless %}{% endif %};
{% endset %}

{{ {'rawString': generatedCode | trim, 'imports': imports } | json_encode() }}