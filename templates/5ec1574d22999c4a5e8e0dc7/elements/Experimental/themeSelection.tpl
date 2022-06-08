/*
path: themeSelection.tpl
completePath: elements/Experimental/themeSelection.tpl
type: file
unique_id: rtGqPUwH
icon: ico-theme-selection
options:
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
          const cssinfo = aptugoUtils.assets.grabCssSelectors(assetInfo);
          aptugoUtils.variables.setPageVariable(currentPage, element.unique_id, { theme: cssinfo, hidden: selectedAsset })
        }
sourceType: javascript
children: []
*/

// Theme selection
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
{% set bpr %}
import { mergeClasses } from '../services/utils'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set ph %}
const theme = {{ theme }}
{% endset %}
{{ save_delayed('ph',ph, 1) }}
