/*
path: BackgroundTask.tpl
keyPath: elements/15_Programming/Snippets/BackgroundTask.tpl
type: file
unique_id: 2d3e8313
icon: ico-time
sourceType: javascript
helpText: >-
  Defines a top-level expo-task-manager background task that can be reused for
  background events.
options:
  - name: taskConstant
    display: Task Constant
    type: text
    options: ''
  - name: taskName
    display: Task Name
    type: text
    options: ''
  - name: onTaskErrorCode
    display: On Task Error
    type: code
    options: ''
    advanced: true
children: []
settings:
  - name: Packages
    value: '"expo-task-manager": "~14.0.9",'
*/
{% set bpr %}
import * as TaskManager from 'expo-task-manager'
{% endset %}
{{ save_delayed('bpr', bpr) }}

const {{ element.values.taskConstant }} = '{{ element.values.taskName }}'

TaskManager.defineTask({{ element.values.taskConstant }}, async ({ data, error }: any) => {
  if (error) {
    {% if element.values.onTaskErrorCode %}
    {{ element.values.onTaskErrorCode | raw }}
    {% endif %}
    return
  }

  {{ content | raw }}
})