/*
path: fileUpload.tpl
keyPath: elements/Interact/fileUpload.tpl
unique_id: Iak20dlO
options:
  - name: classname
    display: ClassName
    type: styles
    options: ''
  - name: label
    display: Label 
    type: text
  - name: placeholder
    display: Placeholder 
    type: text
  - name: value
    display: Value 
    type: text
    required: true
  - name: onChange
    display: On Change 
    type: function
    required: true
  - name: variant
    display: Variant
    type: dropdown
    settings:
      default: standard
    options:
      return [['standard', 'Standard'],['filled', 'Filled'],['outlined', 'Outlined']]
  - name: resize
    display: Resize Images Before Upload?
    type: checkbox
    settings:
      default: false
  - name: resizeWidth
    display: Resize Width
    type: text
    settings:
      propertyCondition: resize
      condition: true
      active: true
  - name: accept
    display: Accept all types of files?
    type: checkbox
    settings:
      default: false
  - name: acceptOnlyPDF
    display: Accept only PDF files?
    type: checkbox
    settings:
      default: false  
  - name: ref
    display: Use Reference
    type: text
    options: ''
*/
{% set tableName = ( field | fieldData ).table.name | friendly %}
{% set bpr %}
import FileUpload from '@components/FileUpload/FileUpload'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<FileUpload
    {% if element.values.classname %}className={ {{ element.values.classname }} }{% endif %}
    {% if element.values.label %} label={{ element.values.label | textOrVariable}}{% endif %}
    {% if element.values.placeholder %}placeholder={{ element.values.placeholder | textOrVariable }}{% endif %}
    value={ {{element.values.value | default('') }} }
    onChange={ {{element.values.onChange | functionOrCall }} }
    variant="{{ element.values.variant| default('standard') }}"
    {% if element.values.resize and element.values.resizeWidth %}
        resizeWidth={ Number( {{ element.values.resizeWidth | default(800) }}) }
    {% endif %}
    {% if element.values.acceptOnlyPDF %}
        accept="application/pdf"
    {% elseif element.values.accept %}
        accept="*"
    {% endif %}
    {% if element.values.ref %}
      ref={ {{element.values.ref}} }
  {% endif %}
/>