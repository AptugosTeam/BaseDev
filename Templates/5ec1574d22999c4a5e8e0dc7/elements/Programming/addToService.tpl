/*
path: addToService.tpl
completePath: elements/Programming/addToService.tpl
display: Add to service
type: file
unique_id: addToService2
icon: f:prepareForSaving.svg
sourceType: javascript
options:
  - name: service
    display: Service
    type: dropdown
    options: >-
      return [['auth.service', 'auth.service'], ['user.service', 'user.service']]
  - name: code
    display: Code
    type: function
children: []
*/
{% set service = element.values.service %}
{% set addToService %}
  {{ element.values.code | default( content | raw ) }}
{% endset %}

{{ add_setting(service, addToService) }}
