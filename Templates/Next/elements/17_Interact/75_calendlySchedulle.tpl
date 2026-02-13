/*
path: 75_calendlySchedulle.tpl
keyPath: elements/17_Interact/75_calendlySchedulle.tpl
unique_id: fDZQUmOb
display: Calendly Invite
options:
  - name: url
    display: Calendly URL
    type: text
    options: ''
  - name: text
    display: Button Text
    type: text
    options: ''
    settings:
      default: 'Schedule a meeting'
      active: true
  - name: className
    display: ClassName
    type: styles
    options: ''
settings:
  - name: Packages
    value: '"react-calendly": "4.3.1",'
*/
{% set bpr %}
import { PopupButton as CalendlyPopupButton } from 'react-calendly'
{% endset %}
{{ save_delayed('bpr', bpr)}}
<CalendlyPopupButton
  url="{{ element.values.url }}"
  text="{{ element.values.text | default('Schedule a meeting') }}"
  rootElement={typeof window !== "undefined" ? document.getElementById("__next") : null}
  {% if element.values.className %}className={ {{element.values.className|raw}} }{% endif %}
/>