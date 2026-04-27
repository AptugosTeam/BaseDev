/*
path: import.tpl
type: file
unique_id: gkhS23C1
icon: f:import.svg
helpText: Import a module into the current generated file or into a root application section
options:
  - name: moduleName
    display: Module Name
    helpText: Imported symbol or default import name to use in the generated statement
    type: text
    options: ''
  - name: modulePath
    display: Module Path
    helpText: Path or package name used in the import source
    type: text
    options: ''
  - name: dependencies
    display: dependencies Path
    helpText: Optional package dependency string to register in the template settings
    type: text
    options: ''
    advanced: true
  - name: forceBPR
    display: Force import place
    helpText: Force the import into the before-page-render section instead of inline output
    type: checkbox
    options: ''
    advanced: true
    settings:
      default: false
  - name: importOnRoot
    display: Import on Root
    helpText: Emit the import at the app root or site-wide wrapper instead of the local file
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
