/*
path: copyToClipboard.tpl
type: file
unique_id: 11u8ATDo
icon: ico-field
children: []
options:
  - name: onCopy
    display: On Copy
    type: text
    options: ''
*/

const copyToClipboard = (str, e) => {
  const el = document.createElement('textarea')
  el.value = str.replace(/<br\s*\/?>/mg,"\n")
  el.setAttribute('readonly', '')
  el.style.position = 'absolute'
  el.style.left = '-9999px'
  var container = e ? e.target.parentElement : document.body
  container.appendChild(el)
  el.select()
  document.execCommand('copy')
  container.removeChild(el)

  {% if element.values.onCopy %}
  {{ element.values.onCopy }}
  {% endif %}
}
