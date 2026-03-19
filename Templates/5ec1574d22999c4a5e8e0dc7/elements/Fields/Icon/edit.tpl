/*
path: edit.tpl
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/5ec1574d22999c4a5e8e0dc7/elements/Fields/Icon/edit.tpl
keyPath: elements/Fields/Icon/edit.tpl
unique_id: M8eG93F3
settings:
  - name: Packages
    value: '"@fortawesome/fontawesome-svg-core": "6.3.0","@fortawesome/free-solid-svg-icons": "6.3.0","@fortawesome/react-fontawesome": "0.2.0",'
extraFiles:
  - source: 'elements/Fields/Icon/component/iconPicker.tsx'
    destination: 'front-end/components/IconPicker/IconPicker.tsx'
  - source: 'elements/Fields/Icon/component/iconPicker.module.scss'
    destination: 'front-end/components/IconPicker/iconPicker.module.scss'
  - source: 'elements/Fields/Icon/component/useFontAwesomeIconPack.tsx'
    destination: 'front-end/components/IconPicker/useFontAwesomeIconPack.tsx'
*/
{% set tableName = ( field | fieldData ).table.name | friendly %}
{% set bpr %}
import FontAwesomeIconPicker from '@components/IconPicker/IconPicker'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<FontAwesomeIconPicker value={ {{ tableName }}data.{{ field.column_name | friendly }} || '' } onChange={handle{{ tableName }}Change("{{ field.column_name | friendly }}")} />