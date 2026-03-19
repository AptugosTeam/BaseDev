/*
path: KanbanColumn.tpl
completePath: elements/Experimental/Kanban/KanbanColumn
type: file
unique_id: avUXMfs3
icon: f:KanbanColumn.svg
children: []
options:
  - name: ColumnTitle
    display: Column Title
    type: text
    options: ''
  - name: RowData
    display: Row Data
    type: text
    options: ''
  - name: onDrop
    display: On Drop
    type: code
    options: ''
  - name: className
    display: ClassName
    type: styles
    options: ''
  - name: classNameList
    display: ClassName (for items)
    type: styles
    options: ''
  - name: ref
    display: Use Reference
    type: text
    options: ''
    advanced: true
  - name: extraStylesToKanbanHeaderFather
    display: Extra Styles To Kanban Header Father
    type: styles
    options: ''
    advanced: true
  - name: extraStylesTokanbanHeader
    display: Extra Styles To Kanban Header
    type: styles
    options: ''
    advanced: true
  - name: returnProps
    display: Return other Props
    type: text
    options: ''
    advanced: true
  - name: propsColumn
    display: Send props value to column component
    type: code
    options: ''
    advanced: true
  - name: componentCode
    display: Code before render in the component
    type: function
    options: ''
    advanced: true
  - name: additionalProps
    display: Send more props to the component
    type: code
    options: ''
    advanced: true
extraFiles:
  - source: 'elements/Experimental/Kanban/999_kanbanColumn.tsx'
    destination: 'front-end/components/KanbanColumn/index.tsx'
*/
{% set bpr %}
import KanbanColumn from '@components/KanbanColumn'
{% endset %}
{{ save_delayed('bpr',bpr) }}

{% set skibidiMacucas %}{{ element.values.componentCode }}{% endset %}
{{ add_setting('macanudo', skibidiMacucas) }}

<KanbanColumn properties={ {
  columnInfo: {{ element.values.RowData }},
  theme,
  {% if element.values.className %}className: {{ element.values.className }},{% endif %}
  onDrop: (item, channel) => {
    {{element.values.onDrop | default("console.log(item, channel)")}}
  },
  {{element.values.additionalProps | raw}}
} }
>
  {({ columnItem, columnIndex {% if element.values.returnProps %}, {{element.values.returnProps}} {% endif %} }) => {
  return (
    <React.Fragment>
      <div {% if element.values.extraStylesToKanbanHeaderFather %}style={ {{element.values.extraStylesToKanbanHeaderFather}} } {% endif %}>
        <div className='kanbanHeader' {% if element.values.extraStylesTokanbanHeader %}style={ {{element.values.extraStylesTokanbanHeader}} } {% endif %}>
        {{ element.values.ColumnTitle }}
        </div>
        <svg width="10" height="56"><path d="M1 0l8 28-8 28"></path></svg>
    </div>
    <div className={ {% if element.values.classNameList %}{{ element.values.classNameList }}{% else %}classes.list{% endif %} }
    {% if element.values.ref %}ref={ {{element.values.ref}} }{% endif %}
    >
      {{ content | raw }}
    </div>
    </React.Fragment>
  )}
  }
</KanbanColumn>