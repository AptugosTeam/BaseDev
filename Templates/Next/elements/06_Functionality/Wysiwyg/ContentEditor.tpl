/*
path: ContentEditor.tpl
type: file
unique_id: 0FrlinoH
icon: ico-content-edit
children: []
settings:
  - name: Packages
    value: '"ContentTools": "latest","image-size": "^1.1.1","prismjs": "^1.29.0",'
extraFiles:
  - source: 'elements/99_ExtraFiles/989_contentEditor.tsx'
    destination: '/src/components/ContentEdit/index.tsx'
  - source: 'elements/99_ExtraFiles/988_fileUpload.tsx'
    destination: '/src/pages/api/upload.tsx'
  - source: 'elements/99_ExtraFiles/987_contentEditorModule.module.scss'
    destination: '/src/components/ContentEdit/extendedcss.module.scss'
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
    type: code
  - name: uploadPath
    display: Upload Path (back-end)
    type: text
    advanced: true
  - name: stylesDefinition
    display: Styles stylesDefinition
    type: code
    advanced: true
  - name: active
    display: Active State Variable
    type: text
*/
{% set bpr %}
import ContEditor from '@components/ContentEdit'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% if element.values.active %}
  { {{ element.values.active }} ? 
    <ContEditor
      content={{ element.values.content | textOrVariable }}
      uploadPath={{ element.values.uploadPath|default('/api/upload') | textOrVariable }}
      onSave={ {{ element.values.onSave }} }
      {% if element.values.stylesDefinition %}StylePalette={ {{ element.values.stylesDefinition }} }{% endif %}
    />
  : React.createElement('div', {
    key: 'my-region',
    dangerouslySetInnerHTML: { __html: '<div data-editable="my-region">' + {{ element.values.content | textOrVariableInCode }} + '</div>' },
  }) }
{% else %}
<ContEditor
  content={{ element.values.content | textOrVariable }}
  uploadPath={{ element.values.uploadPath|default('/api/upload') | textOrVariable }}
  onSave={ {{ element.values.onSave }} }
  {% if element.values.stylesDefinition %}StylePalette={ {{ element.values.stylesDefinition }} }{% endif %}
/>
{% endif %}
