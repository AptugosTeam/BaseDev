/*
path: themeSelection.tpl
completePath: elements/Experimental/themeSelection.tpl
type: file
unique_id: rtGqPUwH
icon: ico-theme-selection
options:
  - name: primaryColor
    display: Primary Color
    type: dropdown
    options: >-
      red;pink;purple;deepPurple;indigo;blue;lightBlue;cyan;teal;green;lightGreen;lime;yellow;amber;orange;deepOrange;brown;grey;blueGrey
  - name: theme
    display: Theme
    type: dropdown
    options: website;whatsapp;layout;fantasyx;crm;minimum;prototyping;lite
  - name: useAsset
    display: Use an Asset
    type: dropdown
    options: >-
      return [['none', 'none'],
      ...aptugo.assetUtils.stylesheets().map(stylesheet => [stylesheet.id,
      stylesheet.name])]
  - name: extraThemeOptions
    display: Extra Theme options
    type: code
    advanced: true
sourceType: javascript
children: []
*/
// Theme selection
{% if element.values.primaryColor %}
{% set bpr %}
  import { {{ element.values.primaryColor }} } from '@mui/material/colors'
  import colors_{{ element.values.primaryColor }} from '@components/Themes/colors_{{ element.values.primaryColor }}.module.scss'
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% endif %}
{% if element.values.useAsset and element.values.useAsset != 'none' %}
  {% set asset = element.values.useAsset|assetData %}
  {% set theme = asset.name|friendly %}
  {% set bpr %}
    import {{ asset.name|friendly }} from 'public/css/{{ asset.name }}'
  {% endset %}
{% else %}
  {% set theme = element.values.theme %}
  {% set bpr %}
    import {{ element.values.theme }} from '../components/Themes/{{ element.values.theme }}.module.scss'
  {% endset %}
{% endif %}
{{ save_delayed('bpr',bpr) }}
{% set ph %}
const theme = { {%if element.values.primaryColor %}...colors_{{ element.values.primaryColor }}, {% endif %}...{{ theme }} }
const classes = { {%if element.values.primaryColor %}...colors_{{ element.values.primaryColor }}, {% endif %}...{{ theme }} }
{% endset %}
{{ save_delayed('ph',ph, 1) }}
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
{% set b %}
<ThemeProvider theme={aptugotheme}>
{% endset %}
{{ save_delayed('b', b, 1)}}
{% set pf %}
</ThemeProvider>
{% endset %}
{{ save_delayed('pf', pf, 1)}}
{% endif %}