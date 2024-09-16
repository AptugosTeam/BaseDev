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
    settings:
      aptugoOnChange: >-
        element = arguments[0]

        var selectedAsset = element.values?.useAsset

        if (selectedAsset !== 'none') {

        //  const assetInfo = aptugo.assetUtils.stylesheets().find(ss => ss.id
        === //selectedAsset)

        //  const currentPage =
        //aptugo.pageUtils.findContainerPage(aptugo.variables.retrieveGlobalVariables('currentElement').unique_id).unique_id

        //  aptugo.variables.setPageVariable(currentPage,{ theme: assetInfo })

          console.log('onchange', element, selectedAsset)
        }
      aptugoOnLoad: |-
        element = arguments[0];
        var selectedAsset = (element.values?.useAsset && element.values?.useAsset !== 'none') ? element.values?.useAsset : null;
        if (selectedAsset) {
          const assetInfo = aptugoUtils.assets.stylesheets().find(ss => ss.id === selectedAsset);
          const currentPage = aptugoUtils.helpers.findContainerPage(element).unique_id;
          aptugoUtils.assets.grabCssSelectors(assetInfo).then(cssinfo => {
            aptugoUtils.variables.setPageVariable(currentPage, element.unique_id, { theme: cssinfo, hidden: selectedAsset })
          })
        }
  - name: extraThemeOptions
    display: Extra Theme options
    type: code
    advanced: true
  - name: variableName
    display: Custom Variable Name
    type: text
    advanced: true
sourceType: javascript
children: []
*/
// Theme selection
{% if element.values.primaryColor %}
{% set bpr %}
  import {{ element.values.primaryColor }} from '@mui/material/colors/{{ element.values.primaryColor }}'
  import colors_{{ element.values.primaryColor }} from '@components/Themes/colors_{{ element.values.primaryColor }}.module.scss'
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% endif %}
{% if element.values.useAsset and element.values.useAsset != 'none' %}
  {% set asset = element.values.useAsset|assetData %}
  {% set theme = asset.name|friendly %}
  {% set bpr %}
    import {{ asset.name|friendly }} from 'dist/css/{{ asset.name }}'
  {% endset %}
{% else %}
  {% set theme = element.values.theme %}
  {% set bpr %}
    import {{ element.values.theme }} from '../components/Themes/{{ element.values.theme }}.module.scss'
  {% endset %}
{% endif %}
{{ save_delayed('bpr',bpr) }}
{% set ph %}
{% if  element.values.variableName %}
const {{ element.values.variableName }} = { {%if element.values.primaryColor %}...colors_{{ element.values.primaryColor }}, {% endif %}...baseClasses, ...{{ theme }} }
{% else %}
const theme = { {%if element.values.primaryColor %}...colors_{{ element.values.primaryColor }}, {% endif %}...baseClasses, ...{{ theme }} }
{% endif %}
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