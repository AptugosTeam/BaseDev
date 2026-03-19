/*
path: import.tpl
type: file
unique_id: gkhS23C1
icon: f:import.svg
helpText: Imports modules
options:
  - name: moduleName
    display: Module Name
    type: text
    options: ''
  - name: modulePath
    display: Module Path
    type: text
    options: ''
  - name: dependencies
    display: dependencies Path
    type: text
    options: ''
    advanced: true
  - name: forceBPR
    display: Force import place
    type: checkbox
    options: ''
    advanced: true
    settings:
      default: false
  - name: importOnRoot
    display: Import on Root
    type: checkbox
    options: ''
    advanced: true
    settings:
      default: false
settings:
  - name: Packages
    value: '{{ element.values.dependencies }}'
children: []
*/
{% if element.values.importOnRoot %}
  {% set IBA %}
    import {{ element.values.moduleName }} from '{{ element.values.modulePath }}'
  {% endset %}
  {{ add_setting('SiteWideBeforePageRenderAddenum', IBA) }}
{% endif %}
{% if element.values.forceBPR %}
{% set bpr %}
import {{ element.values.moduleName }} from '{{ element.values.modulePath }}'
{% endset %}
{{ save_delayed('bpr', bpr )}}
{% else %}
import {{ element.values.moduleName }} from '{{ element.values.modulePath }}'
{% endif %}