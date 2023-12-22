/*
path: NumberFormat.tpl
type: file
unique_id: A7g9nkBV
icon: f:NumberFormat.svg
children: []
options:
  - name: Content
    display: Content
    type: text
    options: ''
  - name: formatNumber
    display: Format number
    type: dropdown
    options: 
      return [['none', 'None'],['"de-DE"', 'Thousand separator "."; Decimal separator ","'],['"en-US"', 'Thousand separator ","; Decimal separator "."']]
  - name: ClassName
    display: ClassName
    type: styles
    options: ''
  - name: Style
    display: Style
    type: dropdown
    options: 
      return [['None', 'None'],['Decimal', 'Decimal'],['Percent', 'Percent'],['Currency', 'Currency'],['Unit', 'Unit']]
  - name: Currency
    display: Currency
    type: text
    options: ''
    settings:
      active: true
      propertyCondition: Style
      condition: Currency
      default: '"USD"'
  - name: CurrencyDisplay
    display: Display
    type: dropdown
    options: symbol;narrowSymbol;code;name
    settings:
      active: true
      propertyCondition: Style
      condition: Currency
*/
{% if element.values.ClassName %}<span className={ {{ element.values.ClassName }} }>{% endif %}
{
  {% if element.values.formatNumber and element.values.formatNumber != 'none' %}
    new Intl.NumberFormat({{ element.values.formatNumber }}, {
      {% if element.values.Style and element.values.Style != 'None' %}
        style: '{{ element.values.Style|lower }}',
      {% endif %}
      {% if element.values.Style == 'Currency' %}
        currency: {{ element.values.Currency|default('"USD"') }},
      {% endif %}
      {% if element.values.CurrencyDisplay and element.values.Style == 'Currency' %}
        currencyDisplay: '{{ element.values.CurrencyDisplay }}',
      {% endif %}
      maximumFractionDigits: 2 }).format({{ element.values.Content | raw }}{{ content | raw }})
  {% endif %}
  {% if element.values.formatNumber == 'none' %}
    {{ element.values.Content | raw }}{{ content | raw }}
  {% endif %}  
}
{% if element.values.ClassName %}</span>{% endif %}