/*
path: registryEventGlobalGaming.tpl
keyPath: elements/Games/ProgramToGame/registryEventGlobalGaming.tpl
unique_id: IcPCNGGC
icon: ico-user-event
options:
  - name: eventName
    display: Event Name
    type: text
    options: ''
    required: true
  - name: actionType
    display: Action Type
    type: dropdown
    options: 
      return [['emit', 'Emit'], ['on', 'On'], ['off', 'Off'], ['once', 'Once']]
    settings:
      default: emit
  - name: dataSource
    display: Data Source
    type: text
    options: ''
  - name: code
    display: Code
    type: code
    options: ''
    settings:
      active: true
      propertyCondition: actionType
      condition: on
  - name: code
    display: Code
    type: code
    options: ''
    settings:
      active: true
      propertyCondition: actionType
      condition: once
*/

{% if element.values.actionType in ['emit', 'off'] %}
this.registry.events.{{ element.values.actionType }}('{{ element.values.eventName }}', {% if content %}{{ content | trim | replace('\n', '') | replace('\r', '') | raw }}{% else %}{{ element.values.dataSource }}{% endif %})
{% endif %}
{% if element.values.actionType in ['on', 'once'] %}
this.registry.events.{{ element.values.actionType }}('{{ element.values.eventName }}', ({{ element.values.dataSource }}) => {
  {{ element.values.code | raw }}
  {{ content | trim | replace('\n', '') | replace('\r', '') | raw }}
})
{% endif %}