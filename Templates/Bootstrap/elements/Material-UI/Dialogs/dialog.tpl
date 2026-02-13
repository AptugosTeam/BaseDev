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
      Dialog'],...aptugo.pageUtils.plainpages.map(({unique_id, name }) =>
      [unique_id, name])]
  - name: separador
    display: Soy un separador
    type: separator
    options: ''
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
import TextField from '@mui/material/TextField'
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
<div>Dialog</div>