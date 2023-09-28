/*
path: b.tpl
completePath: elements/Aptugo Internal Use/b.tpl
type: file
unique_id: evkkxPDn
icon: ico-field
sourceType: javascript
internalUse: true
children: []
options:
  - name: className
    display: ClassName
    type: styles
  - name: primaryColor
    display: Primary Color
    type: dropdown
    options: >-
      red;pink;purple;deepPurple;indigo;blue;lightBlue;cyan;teal;green;lightGreen;lime;yellow;amber;orange;deepOrange;brown;grey;blueGrey
  - name: extraThemeOptions
    display: Extra Theming options
    type: text    
*/
{% if element.values.primaryColor %}
{% set bpr %}
import {{ element.values.primaryColor }} from '@mui/material/colors/{{ element.values.primaryColor }}'
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% endif %}
{% if element.values.primaryColor or element.values.extraThemeOptions %}
{% set bpr %}
import { createTheme, ThemeProvider } from '@mui/material/styles'

const aptugotheme = createTheme({
  {% if element.values.primaryColor %}
  palette: {
    primary: {{ element.values.primaryColor }},
  },
  {% endif %}
  {{ element.values.extraThemeOptions }}
})

{% endset %}
{{ save_delayed('bpr', bpr) }}
<ThemeProvider theme={aptugotheme}>
{% endif %}
{% if element.values.className is defined and element.values.className is iterable and element.values.className|length > 1 %}
{% set bpr %}
import clsx from 'clsx'
{% endset %}
{{ save_delayed('bpr',bpr) }}
  {% set class = 'clsx(' ~ element.values.className|join(',') ~ ')' %}
{% else %}
  {% set class = element.values.className|default('classes.mainPanel') %}
{% endif %}
<div {% if class %}className={ {{ class }} }{% endif %} >
{{ content|raw }}
</div>
{% if element.values.primaryColor %}
</ThemeProvider>
{% endif %}
