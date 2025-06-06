/*
path: dialog.tpl
completePath: elements/Material-UI/Dialogs/dialog.tpl
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
      Dialog'],['Custom','Custom'],...aptugo.pageUtils.plainpages.map(({unique_id, name }) =>
      [unique_id, name])]
  - name: hideButton
    display: Hide Add Button
    type: checkbox
    settings:
      default: false
  - name: color
    display: Color
    type: dropdown
    options: primary;inherit;secondary;default
  - name: manuallyManaged
    display: Do not auto close
    type: checkbox
    settings:
      default: false
  - name: classname
    display: ClassName
    type: styles
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
  - name: viewTitle
    display: View - Title
    type: text
    options: ''
  - name: viewIntroText
    display: View - Intro Text
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
  - name: customOnOpen
    display: Custom Open Handler
    type: text
    settings:
      condition: Custom
      propertyCondition: addProcedure
  - name: customSaveHandler
    display: Custom Save Handler
    type: code
    settings:
      condition: Custom
      propertyCondition: addProcedure
  - name: notRenderFields
    display: Do not render fields?
    type: checkbox
    settings:
      default: false
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
import { I{{ friendlyTableName }}Item } from '@store/models'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set bpr %}
import TextField from '@mui/material/TextField'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set bpr %}
import { add{{ friendlyTableName }} } from '@store/actions/{{ table.name | friendly | lower }}Actions'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set bpr %}
import { edit{{ friendlyTableName }} } from '@store/actions/{{ table.name | friendly | lower }}Actions'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set bpr %}
import { view{{ friendlyTableName }} } from '@store/actions/{{ table.name | friendly | lower }}Actions'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set bpr %}
import { softRemove{{ friendlyTableName }} } from '@store/actions/{{ table.name | friendly | lower }}Actions'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set bpr %}
import { remove{{ friendlySingleName }} } from '@store/actions/{{ table.name | friendly | lower }}Actions'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set bpr2 %}
import AddDialog from '../components/Dialog/Dialog'
{% endset %}
{{ save_delayed('bpr', bpr2 ) }}
{% set ph %}
  const [{{ dialogVariable }}, set{{ dialogVariable }}] = React.useState<'add' | 'edit' | 'view' | 'softDelete' | 'delete' | "">('')
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
  onOpen={() => {% if element.values.addProcedure != 'No' %}{% if element.values.addProcedure == 'Internal' %}set{{ dialogVariable }}('add'){% elseif element.values.addProcedure == 'Custom' %}set{{ dialogVariable }}('{{element.values.customOnOpen}}'){% else %}props.history.push('{{ (element.values.addProcedure | elementData ).path | withoutVars }}'){% endif %}{% else %}{}{%endif%}}
  {% if not element.values.manuallyManaged %}
    onSave={() => set{{ dialogVariable }}('')}
  {% endif %}
  onClose={() => set{{ dialogVariable }}('')}
  action={ {{ dialogVariable }} }
  addOptions={ { title: '{{ element.values.title }}', text: '{{ element.values.introText }}', button: '{{ element.values.button }}' } }
  editOptions={ { title: '{{ element.values.editTitle }}', text: '{{ element.values.editIntroText }}', button: '{{ element.values.editButton }}' } }
  viewOptions={ { title: '{{ element.values.viewTitle }}', text: '{{ element.values.viewIntroText }}' } }
  removeOptions={ { title: '{{ element.values.deleteTitle }}', text: '{{ element.values.deleteIntroText }}', button: '{{ element.values.deleteButton }}' } }
  saveDataHandler={ (data: I{{ table.name | friendly | capitalize }}Item ) => {
    {% if element.values.addProcedure == 'Internal' %}
      if ({{ dialogVariable }} === 'delete') {
        dispatch(remove{{ friendlySingleName }}(data))
      } else if ({{ dialogVariable }} === 'softDelete') {
        dispatch(softRemove{{ table.name | friendly | capitalize }}(data))
      } else {
        const cleanData:any = Object.fromEntries(Object.entries(data).filter(([_, v]) => v !== null && v !== '' && (v.length !== 0 || v.length === undefined)));
        {{ dialogVariable }} === 'add' ? dispatch(add{{ table.name | friendly | capitalize }}(cleanData)) : dispatch(edit{{ table.name | friendly | capitalize }}(cleanData))
      }
    {% endif %}
    {% if element.values.addProcedure == 'Custom' %}
      {{ element.values.customSaveHandler | raw }}
    {% endif %}
  } }
  color='{{ element.values.color }}'
  data={ {{ table.name | friendly }}data}
  initialData={initialData{{ table.name | friendly }}}
  setData={set{{ table.name | friendly }}data}
  allowMultipleSubmit={ {{ dialogVariable }} === 'add'}
  disabledFields={ {{ dialogVariable }} === 'view'}
>
{% if not element.values.notRenderFields %}
{% for field in fields %}
 {% set subvalues = { element: { values: { Field: field.unique_id, Type: 'edit' } }  } %}
 {% include includeTemplate('field.tpl') with subvalues %}
{% endfor %}
{% endif %}
{{ content | raw }}
</LocalAddDialog>
