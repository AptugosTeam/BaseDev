/*
path: dialog.tpl
type: file
unique_id: Lcyk85fH
icon: ico-dialogs
sourceType: javascript
options:
  - name: table
    display: Table
    type: dropdown
    options: >-
      return aptugo.store.getState().application.tables.map(({ unique_id, name
      }) => [unique_id, name])
  - name: addProcedure
    display: Add Records
    type: dropdown
    options: >-
      return [['No','None'],['Internal','Popup
      Dialog'],...aptugo.pageUtils.plainpages.map(({unique_id, name }) =>
      [unique_id, name])]
  - name: hideButton
    display: Hide Add Button
    type: checkbox
    options: ''
  - name: color
    display: Color
    type: dropdown
    options: primary;inherit;secondary;default
  - name: manuallyManaged
    display: Do not auto close
    type: checkbox
    options: ''
  - name: classname
    display: ClassName
    type: text
    options: ''
  - name: title
    display: Add - Title
    type: text
    options: ''
  - name: introText
    display: Add - Intro Text
    type: text
    options: ''
  - name: button
    display: Add - Button Text
    type: text
    options: ''
  - name: editTitle
    display: Edit - Title
    type: text
    options: ''
  - name: editIntroText
    display: Edit - Intro Text
    type: text
    options: ''
  - name: editButton
    display: Edit - Button Text
    type: text
    options: ''
  - name: deleteTitle
    display: Delete - Title
    type: text
    options: ''
  - name: deleteIntroText
    display: Delete - Intro Text
    type: text
    options: ''
  - name: deleteButton
    display: Delete - Button Text
    type: text
    options: ''
children: []
*/
{% set table = element.values.table | tableData %}
{% set friendlyTableName = table.name | friendly | capitalize %}
{% set friendlySingleName = table.singleName | friendly | capitalize %}
{% set dialogVariable = 'dialog' ~ friendlyTableName ~ 'Action' %}
{% if element.children %}
{% else %}
  {% set fields = table.fields %}
{% endif %}
{% set bpr %}
import { I{{ friendlyTableName }}Item } from '../store/models'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set bpr %}
import { TextInput } from 'react-native-paper'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set bpr %}
import { add{{ friendlyTableName }} } from '../store/actions/{{ table.name | friendly | lower }}Actions'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set bpr %}
import { edit{{ friendlyTableName }} } from '../store/actions/{{ table.name | friendly | lower }}Actions'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set bpr %}
import { remove{{ friendlySingleName }} } from '../store/actions/{{ table.name | friendly | lower }}Actions'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set bpr2 %}
import AddDialog from '../components/Dialog/Dialog'
{% endset %}
{{ save_delayed('bpr', bpr2 ) }}
{% set ph %}
  const [{{ dialogVariable }}, set{{ dialogVariable }}] = React.useState<'add' | 'edit' | 'delete' | "">('')
{% endset %}
{{ save_delayed('ph', ph ) }}
{% set ph %}
  const LocalAddDialog = AddDialog
{% endset %}
{{ save_delayed('ph', ph ) }}
<LocalAddDialog
  {% if element.values.classname %}className={ {{ element.values.classname }} }{% endif %}
  {% if element.values.hideButton %}hideButton={true}{% endif %}
  isOpen={ {{ dialogVariable }} !== ''}
  onOpen={() => {% if element.values.addProcedure != 'No' %}{% if element.values.addProcedure == 'Internal' %}set{{ dialogVariable }}('add'){% else %}props.history.push('{{ (element.values.addProcedure | elementData ).path | withoutVars }}'){% endif %}{% else %}{}{%endif%}}
  {% if not element.values.manuallyManaged %}
    onSave={() => set{{ dialogVariable }}('')}
  {% endif %}
  onClose={() => set{{ dialogVariable }}('')}
  action={ {{ dialogVariable }} }
  addOptions={ { title: '{{ element.values.title }}', text: '{{ element.values.introText }}', button: '{{ element.values.button }}' } }
  editOptions={ { title: '{{ element.values.editTitle }}', text: '{{ element.values.editIntroText }}', button: '{{ element.values.editButton }}' } }
  removeOptions={ { title: '{{ element.values.deleteTitle }}', text: '{{ element.values.deleteIntroText }}', button: '{{ element.values.deleteButton }}' } }
  saveDataHandler={ (data: I{{ table.name | friendly | capitalize }}Item ) => {
    {% if element.values.addProcedure == 'Internal' %}
      if ({{ dialogVariable }} === 'delete') {
        dispatch(remove{{ friendlySingleName }}(data))
      } else {
        {{ dialogVariable }} === 'add' ? dispatch(add{{ table.name | friendly | capitalize }}(data)) : dispatch(edit{{ table.name | friendly | capitalize }}(data))
      }      
    {% endif %}
  } }
  color='{{ element.values.color }}'
  data={ {{ table.name | friendly }}data}
  initialData={initialData{{ table.name | friendly }}}
  setData={set{{ table.name | friendly }}Data}
  allowMultipleSubmit={ {{ dialogVariable }} === 'add'}
>
{% for field in fields %}
 {% set subvalues = { element: { values: { Field: field.unique_id, Type: 'edit' } }  } %}
 {% include includeTemplate('field.tpl') with subvalues %}
{% endfor %}
{{ content | raw }}
</LocalAddDialog>
