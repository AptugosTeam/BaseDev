/*
path: PhoneInput.tpl
completePath: elements/Experimental/PhoneInput.tpl
type: file
unique_id: PHIAV002
icon: ico-uncontrolled-input
sourceType: javascript
options:
  - name: country
    display: Country
    type: text
    options: ''
    settings:
      default: us
  - name: value
    display: Value
    type: text
    options: ''
  - name: placeholder
    display: Placeholder
    type: text
    options: ''
  - name: styles
    display: Select a style
    type: dropdown
    options: >-
      return [['style','Style'],['high-res','High-Res'], ['material', 'Material'], ['bootstrap', 'Bootstrap'], ['semantic-ui','Semantic-Ui'], ['plain', 'Plain']]
  - name: enableSearch
    display: Enable Search?
    type: checkbox
    settings:
      default: false
  - name: searchPlaceholder
    display: Search Placeholder
    type: text
    options: ''
    settings: 
      propertyCondition: enableSearch
      condition: true
  - name: searchNotFound
    display: Search Not Found
    type: text
    options: ''
    settings:
      propertyCondition: enableSearch
      condition: true
  - name: onChange
    display: On Change
    type: function
    options: ''
  - name: plainOnChange
    display: Use plain OnChange?
    type: checkbox
    settings:
      default: false
  - name: disabled
    display: Disable input and dropdown
    type: text
    options: ''
  - name: disableDropdown
    display: Disable dropdown only
    type: text
    options: ''
  - name: enableLongNumbers
    display: Enable long numbers?
    type: checkbox
    settings:
      default: false
  - name: buttonStyle
    display: Country button styles
    type: text
    options: ''
settings:
  - name: Packages
    value: '"react-phone-input-2": "^2.15.0",'
children: []
*/
{% set bpr %}
import PhoneInput from 'react-phone-input-2'
{% if element.values.styles %}
    import 'react-phone-input-2/lib/{{element.values.styles}}.css'
{% endif %}
{% endset %}
{{ save_delayed('bpr', bpr) }}

<PhoneInput
    {% if element.values.country %}
        country={ '{{element.values.country}}' }
    {% endif %}
    {% if element.values.value %}
        value={{element.values.value}}
    {% endif %}
    {% if element.values.placeholder %}
        placeholder="{{element.values.placeholder}}"
    {% endif %}
    {% if element.values.enableSearch %}
        enableSearch={true}
        {% if element.values.searchPlaceholder %}
            searchPlaceholder="{{element.values.searchPlaceholder}}"
        {% endif %}
        {% if element.values.searchNotFound %}
            searchNotFound="{{element.values.searchNotFound}}"
        {% endif %}
    {% endif %}
    {% if element.values.disabled %}
        disabled={ {{element.values.disabled}} }
    {% endif %}
    {% if element.value.disableDropdown %}
        disableDropdown={ {{elementva.value.disableDropdown}} }
    {% endif %}
    {% if element.values.onChange %}
      {% if element.values.plainOnChange %}
        onChange={ {{element.values.onChange}} }
      {% else %}
        onChange={ (value, country, e, formattedValue) => {
          {{element.values.onChange}}
        } }
      {% endif %}
    {% endif %}
    {% if element.values.enableLongNumbers %}
        enableLongNumbers={true}
    {% endif %}
    {% if element.values.buttonStyle %}
        buttonStyle={ {{element.values.buttonStyle}} }
    {% endif %}
/>
