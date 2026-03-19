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
  - name: smpthost
    display: Host (smtp)
    type: text
    options: ''
  - name: smptport
    display: Port (smtp)
    type: text
    options: ''
  - name: smptuser
    display: User (smtp)
    type: text
    options: ''
  - name: smptpass
    display: Password (smtp)
    type: text
    options: ''
  - name: subject
    display: Email Subject
    type: text
    options: ''
  - name: parameters
    display: Email Parameters
    type: text
    options: ''
  - name: from
    display: From (name <emailaddress>)
    type: text
    options: ''
settings:
  - name: BackendPackages
    value: '"nodemailer": "^6.4.11",'
  - name: Packages
    value: '"react-html-email": "^3.0.0",'
  - name: ServerRoute
    value: |
      const nodemailer = require("nodemailer");
      var transport = {
        host: "{{ element.values.smpthost }}",
        port: "{{ element.values.smptport }}",
        auth: {
          user: "{{ element.values.smptuser }}",
          pass: "{{ element.values.smptpass }}",
        },
      };

      var transporter = nodemailer.createTransport(transport);
      transporter.verify((error, success) => {
        if (error) {
          console.log(error);
        } else {
          console.log("All works fine, congratz!");
        }
      });
      app.use(express.json());
      app.set('sendEmail', async function(emailDetails) {
        var mail = {
          from: emailDetails.name,
          to: emailDetails.email,
          subject: emailDetails.subject,
          html: emailDetails.message,
        }

        if (typeof addICal === "function") {
          addICal(mail)
        }
        
        transporter.sendMail(mail, (err, data) => {
          if (err) {
            return { msg: 'fail' }
          } else {
            return { msg: 'success' }
          }
        })
      })
      app.post("/api/sendEmail", (req, res, next) => {
        const name = req.body.name
        const email = req.body.email
        const message = req.body.messageHtml
        const subject = req.body.subject
        res.json( app.get('sendEmail')( { name, email, message, subject }) )
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
{% set ph %}
{% if element.values.functionName %}
{% set functionName = element.values.functionName %}
{% else %}
{% set functionName = 'sendEmail' %}
{% endif %}
const {{ functionName }} = (to) => {
    const messageHtml = InlineLink({{ element.values.parameters }})
    axios({
      method: "POST", 
      url:"{{ settings.apiURL | raw }}/api/sendEmail",
      data: {
        name: '{{ element.values.from }}',
        email: to,
        messageHtml: messageHtml,
        subject: {{ element.values.subject }}
      }
    }).then((response)=>{
      if (response.data.msg === 'success'){
        console.log("Email sent, awesome!");
      } else if(response.data.msg === 'fail'){
        console.log('error', response)
      }
    })
  }
{% endset %}
{{ save_delayed('ph',ph) }}
{{ content | raw }}
