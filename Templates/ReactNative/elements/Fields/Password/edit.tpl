/*
path: edit.tpl
completePath: elements/Fields/Password/edit.tpl
unique_id: zlxp4g5o
*/
{% set tableName = ( field | fieldData ).table.name | friendly %}
{% set bpr %}
import { TextInput } from 'react-native-paper'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<TextInput
    {% if element.values.DisableUnderline %}
        InputProps={ { disableUnderline: true } }
    {% endif %}
    {% if element.values.Autofocus %}autoFocus{% endif %}
    {% if element.values.DisableVariable %}disabled={ {{ element.values.DisableVariable }} }{% endif %}
    {% if field.placeholder %}placeholder={{ field.placeholder | textOrVariable }}{% endif %}
    margin='{{ element.values.margin|default("dense") }}'
    label={{ field.prompt|default(field.column_name)  | textOrVariable }}
    type="text"
    fullWidth
    secureTextEntry={true}
    style={ {% if element.values.classname %}{{ element.values.classname }}{% else %}'field_{{ field.column_name | friendly }}'{% endif %}}
    mode="{{ element.values.variant|default('outlined') }}"
    value={ {{ tableName }}data.{{ field.column_name | friendly }} || '' }
    onChangeText={handle{{ tableName }}Change("{{ field.column_name | friendly }}")}
    error={ {{ tableName | lower }}Data?.errField === '{{ field.column_name | friendly }}'}
    helperText={ {{ tableName | lower }}Data?.errField === '{{ field.column_name | friendly }}' && {{ tableName | lower }}Data.errMessage}
    outlineColor="transparent"
    activeOutlineColor="#3A528A"
    theme={ {
        colors: {
            placeholder: '#C4D1FF',
            text: '#C3D1FF',
        },
    } }
/>
