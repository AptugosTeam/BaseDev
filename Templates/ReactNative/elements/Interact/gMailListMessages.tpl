/*
path: gMailListMessages.tpl
type: file
unique_id: qgwpdQL5
icon: ico-email
helpText: Fetch Gmail messages through the configured Gmail service and expose the hydrated results in the child block
options:
  - name: filter
    display: Filter
    helpText: Gmail search query used to filter which messages are listed
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
