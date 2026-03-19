/*
path: NumberFormat.tpl
type: file
unique_id: A7g9nkBV
icon: ico-field
children: []
options:
  - name: Content
    display: Content
    type: text
    options: ''
  - name: CountryCode
    display: Country Code (en-US)
    type: text
    settings:
      default: '''en-US'''
      active: true
  - name: ClassName
    display: ClassName
    type: text
    options: ''
  - name: Style
    display: Style
    type: dropdown
    options: None;Decimal;Percent;Currency;Unit
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
      default: '"symbol"'
*/
{% if element.values.ClassName %}<span className={ {{ element.values.ClassName }} }>{% endif %}
{
  new Intl.NumberFormat({{ element.values.CountryCode }}, {
    {% if element.values.Style and element.values.Style != 'None' %}style: '{{ element.values.Style|lower }}',{% endif %}
    {% if element.values.Style == 'Currency' %}currency: {{ element.values.Currency|default('"USD"') }},{% endif %}
    {% if element.values.CurrencyDisplay %}currencyDisplay: '{{ element.values.CurrencyDisplay }}',{% endif %}
    maximumFractionDigits: 2 }).format({{ element.values.Content | raw }}{{ content | raw }})
}
{% if element.values.ClassName %}</span>{% endif %}