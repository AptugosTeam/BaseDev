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
    options: SMTP;MailGun;GmailOAuth2
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
    settings:
      propertyCondition: service
      conditionNegate: GmailOAuth2
      condition: GmailOAuth2
      active: true
  - name: clientId
    display: Client ID (gOAuth2)
    type: text
    options: ''
    required: true
    settings:
      propertyCondition: service
      condition: GmailOAuth2
      active: true
  - name: clientSecret
    display: Client Secret (gOAuth2)
    type: text
    options: ''
    required: true
    settings:
      propertyCondition: service
      condition: GmailOAuth2
      active: true
  - name: refreshToken
    display: Refresh Token (gOAuth2)
    type: text
    options: ''
    required: true
    settings:
      propertyCondition: service
      condition: GmailOAuth2
      active: true
  - name: redirectUri
    display: Redirect URI (gOAuth2)
    type: text
    options: ''
    required: true
    settings:
      propertyCondition: service
      condition: GmailOAuth2
      active: true
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
  - name: onSuccess
    display: On Email Success
    type: function
    options: ''
    advanced: true
  - name: onError
    display: On Email Error
    type: function
    options: ''
    advanced: true
settings:
  - name: BackendPackages
    value: '"nodemailer": "^6.4.11",'
  - name: ServerRoute
    value: |
      const nodemailer = require("nodemailer");
      {% if element.values.service == 'SMTP' %}
      const transport = {
        host: "{{ element.values.smpthost|default("smtp.gmail.com") }}",
        port: "{{ element.values.smptport|default("465") }}",
        auth: {
          user: "{{ element.values.smptuser }}",
          pass: "{{ element.values.smptpass }}",
        },
      };
      {% elseif element.values.service == 'GmailOAuth2' %}
      {{ add_setting('BackendPackages', '"googleapis": "134.0.0",') }}
      const { google } = require('googleapis')
      const CLIENT_ID = {{ element.values.clientId }}
      const CLIENT_SECRET = {{ element.values.clientSecret }}
      const REDIRECT_URI = {{ element.values.redirectUri }}
      const REFRESH_TOKEN = {{ element.values.refreshToken }}

      const oAuth2Client = new google.auth.OAuth2(
        CLIENT_ID,
        CLIENT_SECRET,
        REDIRECT_URI
      );
      oAuth2Client.setCredentials({ refresh_token: REFRESH_TOKEN });
      {% else %}
      const transport = {
        service: 'Mailgun',
        auth: {
          user: "{{ element.values.smptuser }}",
          pass: "{{ element.values.smptpass }}",
        }
      }
      {% endif %}
      app.use(express.json());
      {% if element.values.service == 'GmailOAuth2' %}
      app.set('sendEmail', async function(emailDetails, extra) {
        const { name, email, subject, message } = emailDetails
        return new Promise(async (resolve, reject) => {
          try {
            const accessToken = await oAuth2Client.getAccessToken();
            const transport = nodemailer.createTransport({
              service: 'gmail',
              auth: {
                type: 'OAuth2',
                user: '{{ element.values.smptuser }}',
                clientId: CLIENT_ID,
                clientSecret: CLIENT_SECRET,
                refreshToken: REFRESH_TOKEN,
                accessToken
              },
            });
            const mail = {
              from: name,
              to: email,
              subject,
              html: message,
            }
            if (typeof addICal === 'function' && extra && extra.sendWithIcal) {
              addICal(mail, extra)
            }
            transport.sendMail(mail, (err, data) => {
              if (err) {
                console.log('err', err)
                reject({ msg: 'fail' })
              } else {
                console.log('data', data)
                resolve({ msg: 'success' })
              }
            })
          } catch (error) {
              console.log(error)
          }
        })
      })
      {% else %}
      const transporter = nodemailer.createTransport(transport);
      transporter.verify((error, success) => {
        if (error) {
          console.log(error);
        } else {
          console.log("All works fine, congratz!");
        }
      });
      app.set('sendEmail', async function(emailDetails, extra) {
        return new Promise((resolve, reject) => {
          const mail = {
            from: emailDetails.name,
            to: emailDetails.email,
            subject: emailDetails.subject,
            html: emailDetails.message,
          }

          if (emailDetails.bcc) mail.bcc = emailDetails.bcc

          if (typeof addICal === 'function' && extra && extra.sendWithIcal) {
            addICal(mail, extra)
          }

          transporter.sendMail(mail, (err, data) => {
            if (err) {
              console.log('err', err)
              reject({ msg: 'fail' })
            } else {
              console.log('data', data)
              resolve({ msg: 'success' })
            }
          })
        })
      })
      {% endif %}
      app.post("/api/sendEmail", async (req, res, next) => {
        try {
          const name = req.body.name
          const email = req.body.email
          const message = req.body.messageHtml
          const subject = req.body.subject
          const result = await app.get('sendEmail')({ name, email, message, subject }, req.body.extra)
          res.json(result)
        } catch (error) {
          console.error(error)
          res.status(500).json({ msg: 'fail', error: 'Internal Server Error' })
        }
      });
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
      method: "POST", 
      url:`${process.env.APIURL}/api/sendEmail`,
      data: {
        name: from,
        email: to,
        messageHtml: messageHtml,
        extra: extra,
        subject: subject
      }
    }).then((response)=>{
      if (response.data.msg === 'success'){
      {% if element.values.onSuccess %}
        {{ element.values.onSuccess }} 
      {% else %}
        console.log("Email sent, awesome!");
      {% endif %}
      } else if(response.data.msg === 'fail'){
          {% if element.values.onError %}
            {{ element.values.onError }} 
          {% else %}
            console.log('error', response)
          {% endif %}
      }
    }).catch((error) => {
  {% if element.values.onError %}
    {{ element.values.onError }} 
  {% else %}
    console.error(error)
  {% endif %}
})
  }
{% endset %}
{% endset %}
{{ save_delayed('ph',ph,1) }}
{{ save_delayed('bpr',bpr) }}
{{ content | raw }}
