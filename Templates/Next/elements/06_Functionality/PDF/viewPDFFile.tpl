/*
path: viewPDFFile.tpl
icon: ico-viewpdf
keyPath: elements/06_Functionality/PDF/viewPDFFile.tpl
unique_id: voyGLwT3
options:
  - name: useAsset
    display: Use an asset
    type: dropdown
    options: >-
      return [['none', 'none'],
      ...aptugo.assetUtils.other().map(file => [file.id, file.name])]
  - name: path
    display: PDF File Path
    type: text
    options: ''
    settings: {
      "propertyCondition": "useAsset",
      "condition": "none"
    }
*/
{% if element.values.useAsset and element.values.useAsset != 'none' %}
  {% set asset = element.values.useAsset|assetData %}
  {% set path = '/img/' ~ asset.name %}
{% else %}
  {% set path = element.values.path %}
{% endif %}
<embed src="{{ path }}" width="100%" height="100%" type="application/pdf" />