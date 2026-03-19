/*
path: gMailListMessages.tpl
type: file
unique_id: qgwpdQL5
icon: ico-email
options:
  - name: filter
    display: Filter
    type: text
    options: ''
*/
{% set bpr %}
import AptugoGmail from '../services/gmail.service'
{% endset %}
{{ save_delayed('bpr',bpr) }}
const getMessages = () => {
    AptugoGmail.listMessages({{ element.values.filter | textOrVariable }}).then( (result) => {
      const promises = result.messages.map( (item,index) => {
        return AptugoGmail.getMessage(item.id).then(res => { 
          return { ...item, ...res }
        })
      })
      Promise.all(promises).then(res => {
        {{ content | raw }}
      })
    })
}