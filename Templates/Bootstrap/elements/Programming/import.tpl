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
children: []
*/
import {{ element.values.moduleName }} from '{{ element.values.modulePath }}'