/*
path: UploadMultipleImages.tpl
completePath: elements/Experimental/UploadMultipleImages.tpl
type: file
unique_id: AcXumHAq
icon: f:UploadMultipleImages.svg
helpText: Allows you to upload multiple image files by selection or drag and drop
options:
  - name: classname
    display: ClassName
    type: styles
    options: ''
  - name: value
    display: Initial Value
    type: text
    options: ''
  - name: onChange
    display: On Change
    type: text
    options: ''
  - name: innerText
    display: Text for dropzone
    type: text
    options: ''
    default: "Drag 'n' drop some files here, or click to select files"
  - name: useAsset
    display: Use an asset
    type: dropdown
    options: >-
      return [['none', 'none'],
      ...aptugo.assetUtils.images().map(image => [image.id, image.name])]
  - name: path
    display: Image Path
    type: text
    options: ''
  - name: alt
    display: Alt Text
    type: text
    options: >-
      return aptugo.assetUtils.grabCssSelectors(
      aptugo.variables.retrievePageVariablesFromElement(arguments[0],'theme') )
  - name: width
    display: Width
    type: text
    options: >-
      return aptugo.assetUtils.grabCssSelectors(
      aptugo.variables.retrievePageVariablesFromElement(arguments[0],'theme') )
  - name: height
    display: Height
    type: text
    options: >-
      return aptugo.assetUtils.grabCssSelectors(
      aptugo.variables.retrievePageVariablesFromElement(arguments[0],'theme') )
  - name: filesLimit
    display: Limit of files
    type: text
    options: ''
settings:
  - name: Packages
    value: '"react-dropzone": "^11.4.2",'
children: []
*/
{% set bpr %}
import MultipleFileUpload from '@components/MultipleFileUpload'
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% set path = element.values.path %}
{% set width = element.values.width|default(null) %}
{% set height = element.values.height|default(null) %}
{% if element.values.useAsset and element.values.useAsset != 'none' %}
  {% set asset = element.values.useAsset|assetData %}
  {% if width == null %}
    {% set width = asset.width %}
  {% endif %}
  {% if height == null %}
    {% set height = asset.height %}
  {% endif %}
  {% set path = '/img/' ~ asset.name %}
{% endif %}
<MultipleFileUpload
  {% if element.values.value %}files={{ element.values.value | textOrVariable }}{% endif %}
  {% if element.values.innerText %}innerText={{ element.values.innerText | textOrVariable }}{% endif %}
  {% if element.values.classname %}className={ {{ element.values.classname }} }{% endif %}
  {% if element.values.onChange %}onChange={
    (files) => {
      {{ element.values.onChange }}
    }
  }{% endif %}
  {% if element.values.useAsset %}src={{ path | textOrVariable }}{% endif %}
  {% if width %}width={{ width | textOrVariable }}{% endif %}
  {% if height %}height={{ height | textOrVariable }}{% endif %}
  {% if element.values.alt %}alt={{ element.values.alt | textOrVariable }}{% endif %}
  {% if element.values.filesLimit %}maxFiles={ {{ element.values.filesLimit | textOrVariable }} }{% endif %}
/>
