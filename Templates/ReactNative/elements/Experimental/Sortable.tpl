/*
path: Sortable.tpl
type: file
unique_id: QpQ4sVNw
icon: ico-field
helpText: Sortable list
settings:
  - name: Packages
    value: '"react-sortablejs": "^6.0.0","sortablejs": "^1.13.0",'
options:
  - name: List
    display: List
    type: text
    options: ''
  - name: onChange
    display: On Change
    type: text
    options: ''
  - name: group
    display: Group
    type: text
    options: ''
  - name: classname
    display: ClassName
    type: text
    options: ''
  - name: keyValue
    display: Key Value
    type: text
    options: ''
children: []
*/


{% set bpr %}
import { ReactSortable } from "react-sortablejs"
{% endset %}
{{ save_delayed('bpr',bpr) }}
<ReactSortable
  list={ {{ element.values.List }} }
  setList={ {{ element.values.onChange }} }
  group={ {{ element.values.group }} }
  {% if element.values.classname %}className={ {{ element.values.classname }} }{% endif %}
>
    { {{ element.values.List }}.map((item) => {
      return <React.Fragment key={ {{ element.values.keyValue}} }>
        {{ content|raw }}
      </React.Fragment>
    })}
</ReactSortable>