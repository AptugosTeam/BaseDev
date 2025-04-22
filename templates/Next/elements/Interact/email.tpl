/*
path: email.tpl
type: file
unique_id: urGd2l4d
icon: ico-email
helpText: Allows you to send emails
sourceType: javascript
options:
  - name: functionName
    display: Function Name
    type: text
    options: ''
  - name: internalfunctionName
    display: Internal Function Name
    type: text
    options: ''
    advanced: true
    settings:
      default: "InlineLink"
  - name: service
    display: Email Sending service
    type: dropdown
    options: SMTP;MailGun
  - name: smpthost
    display: Host (smtp)
    type: text
    options: ''
    settings:
      propertyCondition: service
      condition: SMTP
      active: true
      default: 'smtp.gmail.com'
  - name: smptport
    display: Port (smtp)
    type: text
    options: ''
    settings:
      propertyCondition: service
      condition: SMTP
      active: true
      default: '465'
  - name: smptuser
    display: User (smtp)
    type: text
    options: ''
    required: true
  - name: smptpass
    display: Password (smtp)
    type: text
    options: ''
    required: true
  - name: subject
    display: Email Subject
    type: text
    options: ''
  - name: parameters
    display: Email Content Parameters
    type: text
    options: ''
  - name: from
    display: From (name <emailaddress>)
    type: text
    options: ''
    required: true
  - name: emailLogs
    display: Save email logs
    type: dropdown
    options: >-
      return [['none','None'],
      ...aptugo.store.getState().application.tables.map(({ unique_id, name }) => [unique_id, name])]
extraFiles:
  - source: 'elements/Interact/email/001_emails.tsx'
    destination: 'src/api-lib/db/emails.tsx'
  - source: 'elements/Interact/email/002_index.tsx'
    destination: 'src/pages/api/email/index.tsx'
settings:
  - name: Packages
    value: '"axios": "1.6.8",'
  - name: Packages
    value: '"nodemailer": "^6.10.1",'
childs:
  - name: Email Content
    element: emailContent
children: []
*/
{% set bpr %}
import axios from 'axios'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set bpr %}
{% if element.values.functionName %}
{% set functionName = element.values.functionName %}
{% else %}
{% set functionName = 'sendEmail' %}
{% endif %}
{% set ph %}
const {{ functionName }} = (to, extra:any = {}) => {
    const from = extra.from || '{{ element.values.from }}'
    const subject = extra.subject || {{ element.values.subject|default(" ") }}
    const messageHtml = {{ element.values.internalfunctionName|default('InlineLink') }}({{ element.values.parameters }})
    axios({
      method: 'POST', 
      url:"/api/email",
      data: {
        to: to,
        from: from,
        subject: subject,
        text: JSON.stringify(extra),
        html: messageHtml,
      },
    }).then((response)=>{
      if (response.data.msg === 'success'){
        console.log("Email sent, awesome!");
      } else if(response.data.msg === 'fail'){
        console.log('error', response)
      }
    })
  }
{% endset %}
{% endset %}
{{ save_delayed('ph',ph,1) }}
{{ save_delayed('bpr',bpr) }}
{{ content | raw }}
