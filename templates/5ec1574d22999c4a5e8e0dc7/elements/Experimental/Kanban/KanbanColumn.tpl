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
  - name: code
    display: Code before match condition
    type: function
    options: ''
  - name: matchCondition
    display: Match Condition
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
  - name: disabledReturn
    display: Disable Return with KanbanItem
    type: checkbox
    options: ''
    advanced: true
    settings: 
      default: false
*/
<KanbanColumn channel={columnItem} key={columnIndex} {% if element.values.className %}className={{ element.values.className | textOrVariable }}{% endif %}>
  <div {% if element.values.extraStylesToKanbanHeaderFather %}style={ {{element.values.extraStylesToKanbanHeaderFather}} } {% endif %}>
    <div className='kanbanHeader' {% if element.values.extraStylesTokanbanHeader %}style={ {{element.values.extraStylesTokanbanHeader}} } {% endif %}>
    {{ element.values.ColumnTitle }}{% if element.values.Subtitle %}<span>{{ element.values.Subtitle }}</span>{% endif %}
    </div>
    <svg width="10" height="56"><path d="M1 0l8 28-8 28"></path></svg>
  </div>
  <div className={ {% if element.values.classNameList %}{{ element.values.classNameList }}{% else %}classes.list{% endif %} }
  {% if element.values.ref %}ref={ {{element.values.ref}} }{% endif %}
  >
    {% if not element.values.disabledReturn %}
    { {{ element.values.RowData }}.map((rowItem, rowIndex) => {
      {% if element.values.code %}
        {{ element.values.code}}
      {% endif %}
      {% if element.values.matchCondition %}
      if ({{ element.values.matchCondition }}) {
      {% endif %}
        return (
          <KanbanItem key={rowIndex} item={rowItem}>
            {{ content | raw }}
          </KanbanItem>
        )
      {% if element.values.matchCondition %}
      }
      {% endif %}
    })}
    {% endif %}
      {% if element.values.disabledReturn %}
          {{ content | raw }}
      {% endif %}
    {% if element.values.addRecords %}
    <Button onClickCapture={() => { {{ element.values.addRecords }} }}>
      <AddIcon />
    </Button>
    {% endif %}
  </div>
</KanbanColumn>