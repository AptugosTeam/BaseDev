/*
path: KanbanBoard.tpl
type: file
unique_id: glsvuPHA
icon: ico-kanban-board
options:
  - name: Columns
    display: Columns
    type: text
    options: ''
  - name: className
    display: ClassName
    type: styles
    options: ''
  - name: onDrop
    display: On Drop
    type: text
    options: ''
  - name: data
    display: Data
    type: dropdown
    options: >-
      return aptugo.store.getState().application.tables.map(({ unique_id, name
      }) => [unique_id, name])
#  - name: addRecords
#    display: Add Records
#    type: text
#    options: ''
  - name: ref
    display: Use Reference
    type: text
    options: ''
    advanced: true
  - name: onMouseDown
    display: On Mouse Down
    type: text
    advanced: true
  - name: code
    display: Code before render
    type: function
    options: ''
sourceType: javascript
settings:
  - name: Packages
    value: |
      "react-dnd": "11.1.3",
      "react-dnd-html5-backend": "11.1.3",
children: []
*/
{% if data %}{% set table = data | tableData %}{% else %}{% set table = element.values.data | tableData %}{% endif %}
{% if element.values.addRecords %}
{% set bpr %}
import Button from '@mui/material/Button'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set bpr %}
import AddIcon from '@mui/icons-material/Add'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% endif %}
{% set bpr %}
import { useDispatch } from 'react-redux'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set bpr %}
import { edit{{ table.name | friendly | capitalize }} } from '@store/actions/{{ table.name | friendly | lower }}Actions'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set bpr %}
import clsx from 'clsx'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set bpr %}
import { DndProvider, useDrop, useDrag, DropTargetMonitor, DragSourceMonitor } from 'react-dnd'
import { HTML5Backend } from 'react-dnd-html5-backend'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set ph %}
const KanbanColumn = React.memo(({ channel, children, ...props }) => {
    const ref = React.useRef(null)
    const [{ isOver }, drop] = useDrop({
      accept: 'card',
      drop(item: any) {
        {{ element.values.onDrop | raw }}
      },
      collect: (monitor) => ({
        isOver: monitor.isOver()
      })
    })
    drop(ref)
    return <div ref={ref} {...props} >{children}</div>
  })

const KanbanItem = React.memo(({ item, children, ...props }) => {
    const ref = React.useRef(null)
    const [{ isDragging }, drag] = useDrag({
      item: { type: 'card', item },
      collect: (monitor) => ({
        isDragging: monitor.isDragging(),
      }),
    })

    const opacity = isDragging ? 0 : 1
    drag(ref)
    return (
      <div ref={ref} {...props} style={ { opacity } }>
        {children}
      </div>
    )
  })
{% endset %}
{{ save_delayed('ph',ph) }}
<DndProvider backend={HTML5Backend}>       
<div className={clsx(classes.kanban {% if element.values.className %}, {{ element.values.className }}{% endif %})}
  {% if element.values.ref %}
    ref={ {{element.values.ref}} }
  {% endif %}
  {% if element.values.onMouseDown %}
    onMouseDown={ {{element.values.onMouseDown}} }
  {% endif %}
>
{ {{ element.values.Columns }}.map((columnItem, columnIndex) => {
      {% if element.values.code %}
        {{ element.values.code}}
      {% endif %}
    return ({{ content | raw }})
})}
</div>
</DndProvider>