/*
path: email.tpl
type: file
unique_id: urGd2l4d
icon: ico-email
name: Send Email
helpText: Allows you to send emails
sourceType: javascript
order: 51
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
settings:
  - name: Packages
    value: '"mailgun.js": "12.0.1",'
childs:
  - name: Email Content
    element: emailContent
children: []
*/
{% set emailEndpoint %}
import nc from 'next-connect'
import { ncOpts } from '@api-lib/nc'
import Mailgun from 'mailgun.js'

const handler = nc(ncOpts)

handler.post((req, res, next) => {
  console.log(req.body)
  const mail = new Mailgun(FormData)
  
  const mg = mail.client({ username: '{{ element.values.smptuser }}', key: '{{ element.values.smptpass }}' })
  
  mg.messages.create('www.aptugo.com', {
    from: req.body.name,
    to: [req.body.email],
    subject: req.body.subject,
    html: req.body.messageHtml,
    text: 'some text'
  }).then(result => {
    console.log('mg 2', result.toString())
    res.send({ message: 'Email sent successfully' })
    next()
  }).catch(err => console.error('error', err)); // logs any error

  
})

export default handler
{% endset %}
{{ addExtraFile('/src/pages/api/sendEmail/index.tsx', emailEndpoint) }}
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

    fetch('/api/sendEmail', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        name: from,
        email: to,
        messageHtml: messageHtml,
        extra: extra,
        subject: subject,
      }),
    }).then((response)=>{
      console.log('response', response)
    })
  }
{% endset %}
{% endset %}
{{ save_delayed('ph',ph,1) }}
{{ save_delayed('bpr',bpr) }}
{{ content | raw }}
