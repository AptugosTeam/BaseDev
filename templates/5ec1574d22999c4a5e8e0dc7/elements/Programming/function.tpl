/*
path: function.tpl
type: file
unique_id: r0mQRZ4N
icon: ico-function
sourceType: javascript
helpText: Prepares a function to be called by other components and actions
options:
  - name: functionName
    display: Function Name
    type: text
    options: ''
  - name: functionParameters
    display: Parameters
    type: text
    options: ''
  - name: functionBody
    display: Body
    type: function
    options: ''
  - name: priority
    display: Priority
    type: dropdown
    options: Normal;High;Low
  - name: async
    display: Async
    type: checkbox
    settings:
      default: false
  - name: serverSide
    display: Back-End Function
    type: checkbox
    settings:
      default: false
  - name: export
    display: Export Function
    type: checkbox
    settings:
      default: false
  - name: debounce
    display: Debounce (only front)
    type: checkbox
    settings:
      default: false
  - name: debounceTime
    display: Debounce Time
    type: text
    settings:
      propertyCondition: debounce
      condition: true
  - name: comment
    display: Comment for doc
    type: function
    options: ''
    advanced: true
  - name: regularFunction
    display: Use Regular Function (instead of Arrow)
    type: checkbox
    advanced: true
    settings:
      default: false
  - name: classFunction
    display: Function is part of a class (instead of Arrow)
    type: checkbox
    advanced: true
    settings:
      default: false
settings:
  - name: ServerAddenum
    value: |-
      {% if element.values.serverSide %}
        {% if element.values.comment %}
        /**
          {{ element.values.comment }}
        */
        {% endif %}

        {% if element.values.regularFunction %}
          global.{{ element.values.functionName }} = {% if element.values.async %}async {% endif %}function({{ element.values.functionParameters }}) {
        {% else %}
          global.{{ element.values.functionName }} = {% if element.values.async %}async {% endif %}({{ element.values.functionParameters }}) => {
        {% endif %}

        {{ element.values.functionBody | raw }}
        {{ content | raw }}  
      }
      {% endif %}
  - name: Packages
    value: |-
      {% if element.values.debounce %}
      "lodash.debounce": "^4.0.8",
      {% endif %}
children: []
*/
  {% set bpr %}
    {% if element.values.debounce %}
    import debounce from 'lodash.debounce'
    {% endif %}
  {% endset %}
{{ save_delayed('bpr',bpr) }}
{% if element.values.comment %}
  /**
  {{ element.values.comment }}
  */
{% endif %}
{% if not element.values.serverSide %}

{% if element.values.export %}export {% endif %}

{% if element.values.regularFunction %}
  {% if element.values.async %}async {% endif %}function {{ element.values.functionName }}({{ element.values.functionParameters }}) {
    {{ element.values.functionBody | raw }}
    {{ content | raw }}
  }
{% elseif element.values.classFunction %}
  {% if element.values.async %}async {% endif %}{{ element.values.functionName }}({{ element.values.functionParameters }}) {
    {{ element.values.functionBody | raw }}
    {{ content | raw }}
  }
{% else %}
const {{ element.values.functionName }} =
{% if element.values.async %}async {% endif %}
{% if element.values.debounce %}debounce({% endif %}
({{ element.values.functionParameters }}) => {
  {{ element.values.functionBody | raw }}
  {{ content | raw }}
}
{% if element.values.debounce %}, {{ element.values.debounceTime|default('300') }}){% endif %}

{% endif %}

{% endif %}