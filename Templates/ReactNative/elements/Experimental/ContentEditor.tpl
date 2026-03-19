/*
path: ContentEditor.tpl
type: file
unique_id: 0FrlinoH
icon: ico-field
children: []
settings:
  - name: Packages
    value: '"ContentTools": "latest",'
options:
  - name: saveTable
    display: Save To
    type: dropdown
    options: >-
      return aptugo.store.getState().application.tables.map(({ unique_id, name
      }) => [unique_id, name])
  - name: content
    display: content
    type: text
  - name: onSave
    display: On Save
    type: text
  - name: uploadPath
    display: Upload Path (back-end)
    type: text
*/
{% set table = element.values.saveTable | tableData %}
{% set bpr %}
import ContEditor from '../components/ContentEdit'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set bpr %}
import { edit{{ table.name | friendly | capitalize }} } from '../store/actions/{{ table.name | friendly | lower }}Actions'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<ContEditor
  content={{ element.values.content | textOrVariable }}
  uploadPath={{ element.values.uploadPath | textOrVariable }}
  onSave={ {{ element.values.onSave }} }
/>