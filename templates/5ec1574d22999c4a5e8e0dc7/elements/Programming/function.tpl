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
    display: Priiority
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
settings:
  - name: ServerAddenum
    value: |-
      {% if element.values.serverSide %}
      {% if element.values.comment %}
        /**
        {{ element.values.comment }}
        */
      {% endif %}
      global.{{ element.values.functionName }} = {% if element.values.async%}async {% endif %}({{ element.values.functionParameters }}) => {
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
  {% if element.values.priority %}
  {% set ph %}
  {% if element.values.export%}export{% endif %} const {{ element.values.functionName }} = {% if element.values.async%}async{% endif %} {% if element.values.debounce %}debounce({% endif %}({{ element.values.functionParameters }}) => {
    {{ element.values.functionBody | raw }}
    {{ content | raw }}  
  }{% if element.values.debounce %}, {{element.values.debounceTime|default('300')}}){% endif %}
  {% endset %}
  {{ save_delayed('ph',ph,1) }}
  {% else %}
  {% if element.values.export%}export{% endif %} const {{ element.values.functionName }} = {% if element.values.async%}async{% endif %} {% if element.values.debounce %}debounce({% endif %}({{ element.values.functionParameters }}) => {
    {{ element.values.functionBody | raw }}
    {{ content | raw }}  
  }{% if element.values.debounce %}, {{element.values.debounceTime|default('300')}}){% endif %}
  {% endif %}
{% endif %}