/*
path: editInclude.tpl
completePath: elements/Fields/editInclude.tpl
unique_id: V4GMkcHl
*/
{% set bpr %}
import { useDispatch } from 'react-redux'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% if element.values.autosave %}
{% set bpr %}
import { edit{{ tableInfo.table.name | friendly | capitalize }} } from '../store/actions/{{ tableInfo.table.name | friendly | lower }}Actions'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% endif %}
{% set eifields = tableInfo.table.fields %}
{% set ph %}
const initialData{{ tableInfo.table.name | friendly }} = {
{% for field in eifields %}
  {% set fieldValue = "''" %}
  {% if (field | fieldData).defaultValue %}
    {% set fieldValue = (field | fieldData).defaultValue %}
  {% elseif (field | fieldData).initialValue %}
    {% set fieldValue = (field | fieldData).initialValue %}
  {% endif %}
  {% if (field | fieldData).reference %}
    {% set referencedField = (field | fieldData).reference | fieldData %}
    {% if field|fieldData.relationshipType == '1:m' or field|fieldData.relationshipType == '1:1' %}
      {% set fieldValue = "[]" %}
    {% else %}
      {% set fieldValue = "null" %}
    {% endif %}
  {% endif %}
  {{ field.column_name | friendly | lower }}: {{ fieldValue }},
{% endfor %}
}
const [{{ tableInfo.table.name | friendly }}data, set{{ tableInfo.table.name | friendly }}data] = React.useState<any>(initialData{{ tableInfo.table.name | friendly }})
const handle{{ tableInfo.table.name | friendly }}Change = (name: string) => (event: any) => {
  return new Promise((resolve,reject) => {
    const value = event?.target ? (event.target.files ? event.target.files[0] : event.currentTarget?.value || event.target.value) : event
    if (value !== {{ tableInfo.table.name | friendly }}data[name]) {
      set{{ tableInfo.table.name | friendly }}data((oldValues) => {
        return {
          ...oldValues,
          [name]: value
        }
      })
      {% if element.values.autosave %}
      if ({{ tableInfo.table.name | friendly }}data._id) {
        dispatch(edit{{ tableInfo.table.name | friendly }}({
          ...{{ tableInfo.table.name | friendly }}data,
          [name]: value
        }))
      }
      {% endif %}
    }
    resolve(value)
  })
  }
{% endset %}
{{ save_delayed('ph', ph, 1 ) }}