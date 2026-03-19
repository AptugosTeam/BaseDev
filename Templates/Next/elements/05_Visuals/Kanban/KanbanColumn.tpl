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
  - name: matchCondition
    display: Match Condition
    type: text
    options: ''
  - name: onDrop
    display: On Drop
    type: text
    options: ''
  - name: className
    display: ClassName
    type: styles
    options: ''
  - name: classNameList
    display: ClassName (for items)
    type: styles
    options: ''
*/
<KanbanColumn channel={columnItem} key={columnIndex} {% if element.values.className %}className={{ element.values.className | textOrVariable }}{% endif %}>
  <div>
    <div className='kanbanHeader'>{{ element.values.ColumnTitle }}{% if element.values.Subtitle %}<span>{{ element.values.Subtitle }}</span>{% endif %}</div>
  </div>
  <div className={ {% if element.values.classNameList %}{{ element.values.classNameList }}{% else %}classes.list{% endif %} }>
    { {{ element.values.RowData }}?.map((rowItem, rowIndex) => {
      {% if element.values.matchCondition %}if ({{ element.values.matchCondition }}) { {% endif %}
        return (
          <KanbanItem key={rowIndex} item={rowItem}>
            {{ content | raw }}
          </KanbanItem>
        )
      {% if element.values.matchCondition %}}{% endif %}
    })}
    {% if element.values.addRecords %}
    <Button onClickCapture={() => { {{ element.values.addRecords }} }}>
      <AddIcon />
    </Button>
    {% endif %}
  </div>
</KanbanColumn>