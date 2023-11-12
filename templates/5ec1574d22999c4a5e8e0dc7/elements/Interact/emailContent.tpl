/*
path: emailContent.tpl
type: file
unique_id: 5lG5PAMZ
icon: ico-field
internalUse: true
sourceType: javascript
children: []
options:
  - name: internalfunctionName
    display: Internal Function Name
    type: text
    options: ''
    advanced: true
    settings:
      default: "'InlineLink'"
  - name: renderInPlace
    display: Render In Place
    type: checkbox
*/

{% set bpr %}
import _server from 'react-dom/server'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set ph %}
function {{ element.values.internalfunctionName|default('InlineLink') }}(emailParameters:any = {}) {
  var _server2 = _interopRequireDefault(_server)
  function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

  function renderEmail(emailComponent) {
    var doctype = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">';
    return `${doctype}${_server2.default.renderToStaticMarkup(emailComponent).replaceAll('/img/','{{ settings.url }}/img/')}`
  }

  return emailParameters.content || renderEmail(<div>{{ content | raw }}</div>)
}
{% endset %}
{% if element.values.renderInPlace %}
  {{ ph }}
{% else %}
  {{ save_delayed('ph',ph) }}
{% endif %}
