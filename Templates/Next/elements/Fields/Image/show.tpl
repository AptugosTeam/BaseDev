/*
path: show.tpl
completePath: elements/Fields/Image/show.tpl
unique_id: Z1frMeIx
extraFiles:
  - source: 'elements/99_ExtraFiles/Table/Field.tsx'
    destination: 'src/components/Table/Field.tsx'
  - source: 'elements/99_ExtraFiles/Table/table.module.scss'
    destination: 'src/components/Table/table.module.scss'
  - source: 'elements/99_ExtraFiles/Table/Table.tsx'
    destination: 'src/components/Table/Table.tsx'
*/
{% set bpr %}
import Field from '@components/Table/Field'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set columnName = field.column_name | friendly %}
{% set path = '/img/${fieldData.' ~ columnName ~ '}' %}
{% if field.gcloud == '1' %}{% set path = '${fieldData.{{ columnName }}}' %}{% endif %}
<Field {% if element.values.classname %} className={ {{ element.values.classname }} } {% endif %} value={(fieldData: any) => fieldData.{{ columnName }} ? <img src={`{{ path }}`} /> : <div />} />
