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
  - name: importOnRoot
    display: Import on Root
    type: checkbox
    options: ''
    advanced: true
    settings:
      default: false
children: []
*/
{% if element.values.importOnRoot %}
  {% set IBA %}
    import {{ element.values.moduleName }} from '{{ element.values.modulePath }}'
  {% endset %}
  {{ add_setting('SiteWideBeforePageRenderAddenum', IBA) }}
{% endif %}
import {{ element.values.moduleName }} from '{{ element.values.modulePath }}'