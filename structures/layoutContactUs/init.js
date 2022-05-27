
const emptyBPR = {
  "path": "bpr.tpl",
  "completePath": "elements/Aptugo Internal Use/bpr.tpl",
  "type": "element",
  "icon": "ico-field",
  "sourceType": "javascript",
  "internalUse": true,
  "children": [],
  "open": false,
  "name": "Before Page Render",
  "cascades": false,
  "value": "bpr",
  "prevent_delete": false
}

const PH = {
  "path": "ph.tpl",
  "completePath": "elements/Aptugo Internal Use/ph.tpl",
  "open": false,
  "children": [{
    "path": "dummyEncloser.tpl",
    "completePath": "elements/Basic/dummyEncloser.tpl",
    "children": [{
        "path": "defineVariable.tpl",
        "completePath": "elements/Programming/defineVariable.tpl",
        "type": "element",
        "icon": "ico-define-variable",
        "helpText": "Allows you to define a variable that will be used later",
        "options": [{
            "name": "variableName",
            "display": "Name",
            "type": "text",
            "options": ""
          },
          {
            "name": "variableValue",
            "display": "Value",
            "type": "text",
            "options": ""
          },
          {
            "name": "willbeModified",
            "display": "Will it be modified?",
            "type": "checkbox",
            "options": ""
          },
          {
            "name": "serverSide",
            "display": "Back-End Variable",
            "type": "checkbox"
          }
        ],
        "settings": [{
          "name": "ServerAddenum",
          "value": "{% if element.values.serverSide %}\n  {% if element.values.willbeModified %}let{% else %}const{% endif %} {{ element.values.variableName }} = {{ element.values.variableValue|default(content | raw)}}\n{% endif %}"
        }],
        "sourceType": "javascript",
        "children": [],
        "open": false,
        "name": "Contact's email",
        "cascades": false,
        "value": "defineVariable",
        "values": {
          "variableName": "contactEmail",
          "variableValue": "''"
        },
        "prevent_delete": false
      },
      {
        "path": "defineVariable.tpl",
        "completePath": "elements/Programming/defineVariable.tpl",
        "type": "element",
        "icon": "ico-define-variable",
        "helpText": "Allows you to define a variable that will be used later",
        "options": [{
            "name": "variableName",
            "display": "Name",
            "type": "text",
            "options": ""
          },
          {
            "name": "variableValue",
            "display": "Value",
            "type": "text",
            "options": ""
          },
          {
            "name": "willbeModified",
            "display": "Will it be modified?",
            "type": "checkbox",
            "options": ""
          },
          {
            "name": "serverSide",
            "display": "Back-End Variable",
            "type": "checkbox"
          }
        ],
        "settings": [{
          "name": "ServerAddenum",
          "value": "{% if element.values.serverSide %}\n  {% if element.values.willbeModified %}let{% else %}const{% endif %} {{ element.values.variableName }} = {{ element.values.variableValue|default(content | raw)}}\n{% endif %}"
        }],
        "sourceType": "javascript",
        "children": [],
        "open": false,
        "name": "Map coordinates",
        "cascades": false,
        "value": "defineVariable",
        "values": {
          "variableName": "mapCoordinates",
          "variableValue": "[50,50]"
        },
        "prevent_delete": false
      },
      {
        "path": "defineVariable.tpl",
        "completePath": "elements/Programming/defineVariable.tpl",
        "type": "element",
        "icon": "ico-define-variable",
        "helpText": "Allows you to define a variable that will be used later",
        "options": [{
            "name": "variableName",
            "display": "Name",
            "type": "text",
            "options": ""
          },
          {
            "name": "variableValue",
            "display": "Value",
            "type": "text",
            "options": ""
          },
          {
            "name": "willbeModified",
            "display": "Will it be modified?",
            "type": "checkbox",
            "options": ""
          },
          {
            "name": "serverSide",
            "display": "Back-End Variable",
            "type": "checkbox"
          }
        ],
        "settings": [{
          "name": "ServerAddenum",
          "value": "{% if element.values.serverSide %}\n  {% if element.values.willbeModified %}let{% else %}const{% endif %} {{ element.values.variableName }} = {{ element.values.variableValue|default(content | raw)}}\n{% endif %}"
        }],
        "sourceType": "javascript",
        "children": [],
        "open": false,
        "name": "Language",
        "cascades": false,
        "value": "defineVariable",
        "values": {
          "variableName": "langStrings",
          "variableValue": "{\n    en: {\n      ContactUs: \"Contact US\",\n      IntroPhrase: \"We are always ready to your needs!\",\n      WhereAreWe: \"Where are we\",\n      messageSent: \"Your message has been sent!\",\n      address1: \"Address Line 1\",\n      address2: \"Address Line 2\",\n      address3: \"Address Line 3\",\n      address4: \"Address Line 4\",\n      Email: 'Email',\n      EmailPlaceholder: 'Enter your email',\n      Subject: 'Subject',\n      SubjectPlaceholder: 'Set a subject',\n      Message: 'Message',\n      MessagePlaceholder: 'Your Message',\n      sendButton: 'Send!',\n      contactSubject: 'Message from your website',\n      EmailContentIntro: 'A new message has been sent from your website'\n    },\n    sp: {\n      ContactUs: \"Contáctanos\",\n      IntroPhrase: \"¡Estamos siempre atentos a tus necesidades!\",\n      WhereAreWe: \"Dónde estamos\",\n      messageSent: \"¡Tu mensaje ha sido enviado!\",\n      address1: \"Línea de dirección 1\",\n      address2: \"Línea de dirección 2\",\n      address3: \"Línea de dirección 3\",\n      address4: \"Línea de dirección 4\",\n      Email: 'Email',\n      EmailPlaceholder: 'completa tu email',\n      Subject: 'Tema',\n      SubjectPlaceholder: 'Ingresa el tema',\n      Message: 'Mensaje',\n      MessagePlaceholder: 'Escribe tu mensaje',\n      sendButton: '¡Envia tu mensaje!',\n      contactSubject: 'Mensaje desde tu website',\n      EmailContentIntro: 'Te han enviado un mensaje desde tu website!'\n    },\n  }"
        },
        "prevent_delete": false
      }
    ],
    "icon": "ico-dummy-enclosure",
    "helpText": "Organizational unit with no render value",
    "open": false,
    "name": "Config: ContactUS",
    "cascades": false,
    "type": "element",
    "value": "dummyEncloser",
    "prevent_delete": false
  },
  {
    "path": "dummyEncloser.tpl",
    "completePath": "elements/Basic/dummyEncloser.tpl",
    "children": [{
        "path": "useState.tpl",
        "completePath": "elements/Programming/useState.tpl",
        "type": "element",
        "icon": "ico-use-state",
        "options": [{
            "name": "variableName",
            "display": "Variable Name",
            "type": "text",
            "options": "",
            "settings": {
              "aptugoOnLoad": "const element = arguments[0]; const page = aptugo.pageUtils.findContainerPage(element.unique_id).unique_id; if (element.values.variableName) {\n  aptugo.variables.setPageVariable(page, element.unique_id, { [element.values.variableName]: element.values ? element.values.defaultValue : null });\n  aptugo.variables.setPageFunction(page, 'f' + element.unique_id, `set${element.values.variableName}` );\n}",
              "aptugoOnChange": "const value = arguments[0]; const element = arguments[1]; const page = arguments[2]; if (element.values?.variableName) {\n  aptugo.variables.setPageVariable(page, element.unique_id, { [value]: element.values ? element.values.defaultValue : null });\n  aptugo.variables.setPageFunction(page, 'f' + element.unique_id, `set${element.values.variableName}` );\n}",
              "active": true
            }
          },
          {
            "name": "defaultValue",
            "display": "Default Value",
            "type": "text",
            "options": "",
            "settings": {
              "aptugoOnChange": "const value = arguments[0]; const element = arguments[1]; const page = arguments[2]; if ( element.values.variableName ) aptugo.variables.setPageVariable(page, element.unique_id, { [element.values.variableName]: value });",
              "active": true
            }
          }
        ],
        "children": [],
        "open": false,
        "name": "ContactUS State",
        "cascades": false,
        "value": "useState",
        "values": {
          "variableName": "contactusState",
          "defaultValue": "{\nemail: '',\nsubject: '',\nmessage: ''\n}"
        },
        "prevent_delete": false
      },
      {
        "path": "function.tpl",
        "completePath": "elements/Programming/function.tpl",
        "type": "element",
        "icon": "ico-function",
        "sourceType": "javascript",
        "helpText": "Prepares a function to be called by other components and actions",
        "options": [{
            "name": "functionName",
            "display": "Function Name",
            "type": "text",
            "options": ""
          },
          {
            "name": "functionParameters",
            "display": "Parameters",
            "type": "text",
            "options": ""
          },
          {
            "name": "functionBody",
            "display": "Body",
            "type": "function",
            "options": ""
          },
          {
            "name": "priority",
            "display": "Priiority",
            "type": "dropdown",
            "options": "Normal;High;Low"
          }
        ],
        "children": [{
            "path": "code.tpl",
            "completePath": "elements/Programming/code.tpl",
            "type": "element",
            "icon": "ico-code",
            "sourceType": "javascript",
            "options": [{
              "name": "code",
              "display": "Code",
              "type": "text",
              "options": ""
            }],
            "children": [],
            "open": false,
            "name": "code",
            "cascades": false,
            "value": "code",
            "values": {
              "code": "sendContactUsEmail(contactEmail)"
            },
            "prevent_delete": false
          },
          {
            "path": "updateStateVariable.tpl",
            "completePath": "elements/Programming/Snippets/updateStateVariable.tpl",
            "type": "element",
            "icon": "ico-paper",
            "sourceType": "javascript",
            "helpText": "Updates the value of a state variable",
            "options": [{
                "name": "variable",
                "display": "Variable to Update",
                "type": "variable",
                "options": ""
              },
              {
                "name": "newvalue",
                "display": "New Value",
                "type": "variable",
                "options": ""
              }
            ],
            "children": [],
            "open": false,
            "name": "updateStateVariable",
            "cascades": false,
            "value": "updateStateVariable",
            "values": {
              "variable": "contactusState",
              "newvalue": "{\nemail: '',\nsubject: '',\nmessage: ''\n}"
            },
            "prevent_delete": false
          },
          {
            "path": "updateStateVariable.tpl",
            "completePath": "elements/Programming/Snippets/updateStateVariable.tpl",
            "type": "element",
            "icon": "ico-paper",
            "sourceType": "javascript",
            "helpText": "Updates the value of a state variable",
            "options": [{
                "name": "variable",
                "display": "Variable to Update",
                "type": "variable",
                "options": ""
              },
              {
                "name": "newvalue",
                "display": "New Value",
                "type": "variable",
                "options": ""
              }
            ],
            "children": [],
            "open": false,
            "name": "updateStateVariable",
            "cascades": false,
            "value": "updateStateVariable",
            "values": {
              "variable": "contactUsSnackOpen",
              "newvalue": "true"
            },
            "prevent_delete": false
          }
        ],
        "open": false,
        "name": "Send ContactUS Message",
        "cascades": false,
        "value": "function",
        "values": {
          "functionName": "sendContactUsMessage"
        },
        "prevent_delete": false
      },
      {
        "path": "email.tpl",
        "completePath": "elements/Interact/email.tpl",
        "type": "element",
        "icon": "ico-email",
        "helpText": "Allows you to send emails",
        "sourceType": "javascript",
        "options": [{
            "name": "functionName",
            "display": "Function Name",
            "type": "text",
            "options": ""
          },
          {
            "name": "internalfunctionName",
            "display": "Internal Function Name",
            "type": "text",
            "options": "",
            "advanced": true,
            "settings": {
              "default": "'InlineLink'"
            }
          },
          {
            "name": "service",
            "display": "Email Sending service",
            "type": "dropdown",
            "options": "SMTP;MailGun"
          },
          {
            "name": "smpthost",
            "display": "Host (smtp)",
            "type": "text",
            "options": "",
            "settings": {
              "propertyCondition": "service",
              "condition": "SMTP",
              "active": true
            }
          },
          {
            "name": "smptport",
            "display": "Port (smtp)",
            "type": "text",
            "options": "",
            "settings": {
              "propertyCondition": "service",
              "condition": "SMTP",
              "active": true
            }
          },
          {
            "name": "smptuser",
            "display": "User (smtp)",
            "type": "text",
            "options": ""
          },
          {
            "name": "smptpass",
            "display": "Password (smtp)",
            "type": "text",
            "options": ""
          },
          {
            "name": "subject",
            "display": "Email Subject",
            "type": "text",
            "options": ""
          },
          {
            "name": "parameters",
            "display": "Email Parameters",
            "type": "text",
            "options": ""
          },
          {
            "name": "from",
            "display": "From (name <emailaddress>)",
            "type": "text",
            "options": ""
          }
        ],
        "settings": [{
            "name": "BackendPackages",
            "value": "\"nodemailer\": \"^6.4.11\","
          },
          {
            "name": "Packages",
            "value": "\"react-html-email\": \"^3.0.0\","
          },
          {
            "name": "ServerRoute",
            "value": "const nodemailer = require(\"nodemailer\");\n{% if element.values.service != 'MailGun' %}\n  var transport = {\n    host: \"{{ element.values.smpthost }}\",\n    port: \"{{ element.values.smptport }}\",\n    auth: {\n      user: \"{{ element.values.smptuser }}\",\n      pass: \"{{ element.values.smptpass }}\",\n    },\n  };\n{% else %}\n  var transport = {\n    service: 'Mailgun',\n    auth: {\n      user: \"{{ element.values.smptuser }}\",\n      pass: \"{{ element.values.smptpass }}\",\n    }\n  }\n{% endif %}\n\nvar transporter = nodemailer.createTransport(transport);\ntransporter.verify((error, success) => {\n  if (error) {\n    console.log(error);\n  } else {\n    console.log(\"All works fine, congratz!\");\n  }\n});\napp.use(express.json());\napp.set('sendEmail', async function(emailDetails, extra) {\n  var mail = {\n    from: emailDetails.name,\n    to: emailDetails.email,\n    subject: emailDetails.subject,\n    html: emailDetails.message,\n  }\n\n  if (typeof addICal === \"function\" && extra && extra.sendWithIcal) {\n    addICal(mail, extra)\n  }\n  \n  transporter.sendMail(mail, (err, data) => {\n    if (err) {\n      return { msg: 'fail' }\n    } else {\n      return { msg: 'success' }\n    }\n  })\n})\napp.post(\"/api/sendEmail\", (req, res, next) => {\n  const name = req.body.name\n  const email = req.body.email\n  const message = req.body.messageHtml\n  const subject = req.body.subject\n  res.json( app.get('sendEmail')( { name, email, message, subject }, req.body.extra) )\n});\n"
          }
        ],
        "childs": [{
          "name": "Email Content",
          "element": "emailContent"
        }],
        "children": [{
          "path": "emailContent.tpl",
          "completePath": "elements/Interact/emailContent.tpl",
          "type": "element",
          "icon": "ico-field",
          "internalUse": true,
          "sourceType": "javascript",
          "children": [{
              "path": "div.tpl",
              "completePath": "elements/Basic/div.tpl",
              "type": "element",
              "icon": "ico-div",
              "sourceType": "javascript",
              "options": [{
                  "name": "class",
                  "display": "ClassName",
                  "type": "styles",
                  "options": ""
                },
                {
                  "name": "useid",
                  "display": "Use UniqueID as ID",
                  "type": "checkbox",
                  "options": ""
                },
                {
                  "name": "id",
                  "display": "ID",
                  "type": "text",
                  "options": ""
                },
                {
                  "name": "onclick",
                  "display": "On Click",
                  "type": "function",
                  "options": ""
                },
                {
                  "name": "ref",
                  "display": "Use Reference",
                  "type": "text",
                  "options": ""
                },
                {
                  "name": "style",
                  "display": "Extra Styles",
                  "type": "text",
                  "options": ""
                }
              ],
              "children": [{
                "path": "text.tpl",
                "completePath": "elements/Basic/text.tpl",
                "type": "element",
                "icon": "ico-text",
                "helpText": "Insert simple text anywhere. Can hold variables, code, and anything of your choice",
                "sourceType": "javascript",
                "options": [{
                    "name": "Content",
                    "display": "Content",
                    "type": "text",
                    "options": ""
                  },
                  {
                    "name": "ClassName",
                    "display": "ClassName",
                    "type": "text",
                    "options": ""
                  }
                ],
                "children": [],
                "open": false,
                "name": "text",
                "cascades": false,
                "value": "text",
                "values": {
                  "Content": "{lang?.EmailContentIntro}"
                },
                "prevent_delete": false
              }],
              "helpText": "Basic HTML Div element",
              "open": false,
              "name": "Intro Line",
              "cascades": false,
              "value": "div",
              "prevent_delete": false
            },
            {
              "path": "div.tpl",
              "completePath": "elements/Basic/div.tpl",
              "type": "element",
              "icon": "ico-div",
              "sourceType": "javascript",
              "options": [{
                  "name": "class",
                  "display": "ClassName",
                  "type": "styles",
                  "options": ""
                },
                {
                  "name": "useid",
                  "display": "Use UniqueID as ID",
                  "type": "checkbox",
                  "options": ""
                },
                {
                  "name": "id",
                  "display": "ID",
                  "type": "text",
                  "options": ""
                },
                {
                  "name": "onclick",
                  "display": "On Click",
                  "type": "function",
                  "options": ""
                },
                {
                  "name": "ref",
                  "display": "Use Reference",
                  "type": "text",
                  "options": ""
                },
                {
                  "name": "style",
                  "display": "Extra Styles",
                  "type": "text",
                  "options": ""
                }
              ],
              "children": [{
                "path": "text.tpl",
                "completePath": "elements/Basic/text.tpl",
                "type": "element",
                "icon": "ico-text",
                "helpText": "Insert simple text anywhere. Can hold variables, code, and anything of your choice",
                "sourceType": "javascript",
                "options": [{
                    "name": "Content",
                    "display": "Content",
                    "type": "text",
                    "options": ""
                  },
                  {
                    "name": "ClassName",
                    "display": "ClassName",
                    "type": "text",
                    "options": ""
                  }
                ],
                "children": [],
                "open": false,
                "name": "text",
                "cascades": false,
                "value": "text",
                "values": {
                  "Content": "email: {emailParameters.email}"
                },
                "prevent_delete": false
              }],
              "helpText": "Basic HTML Div element",
              "open": false,
              "name": "Email",
              "cascades": false,
              "value": "div",
              "prevent_delete": false
            },
            {
              "path": "div.tpl",
              "completePath": "elements/Basic/div.tpl",
              "type": "element",
              "icon": "ico-div",
              "sourceType": "javascript",
              "options": [{
                  "name": "class",
                  "display": "ClassName",
                  "type": "styles",
                  "options": ""
                },
                {
                  "name": "useid",
                  "display": "Use UniqueID as ID",
                  "type": "checkbox",
                  "options": ""
                },
                {
                  "name": "id",
                  "display": "ID",
                  "type": "text",
                  "options": ""
                },
                {
                  "name": "onclick",
                  "display": "On Click",
                  "type": "function",
                  "options": ""
                },
                {
                  "name": "ref",
                  "display": "Use Reference",
                  "type": "text",
                  "options": ""
                },
                {
                  "name": "style",
                  "display": "Extra Styles",
                  "type": "text",
                  "options": ""
                }
              ],
              "children": [{
                "path": "text.tpl",
                "completePath": "elements/Basic/text.tpl",
                "type": "element",
                "icon": "ico-text",
                "helpText": "Insert simple text anywhere. Can hold variables, code, and anything of your choice",
                "sourceType": "javascript",
                "options": [{
                    "name": "Content",
                    "display": "Content",
                    "type": "text",
                    "options": ""
                  },
                  {
                    "name": "ClassName",
                    "display": "ClassName",
                    "type": "text",
                    "options": ""
                  }
                ],
                "children": [],
                "open": false,
                "name": "text",
                "cascades": false,
                "value": "text",
                "values": {
                  "Content": "Subject: {emailParameters.subject}"
                },
                "prevent_delete": false
              }],
              "helpText": "Basic HTML Div element",
              "open": false,
              "name": "Subject",
              "cascades": false,
              "value": "div",
              "prevent_delete": false
            },
            {
              "path": "div.tpl",
              "completePath": "elements/Basic/div.tpl",
              "type": "element",
              "icon": "ico-div",
              "sourceType": "javascript",
              "options": [{
                  "name": "class",
                  "display": "ClassName",
                  "type": "styles",
                  "options": ""
                },
                {
                  "name": "useid",
                  "display": "Use UniqueID as ID",
                  "type": "checkbox",
                  "options": ""
                },
                {
                  "name": "id",
                  "display": "ID",
                  "type": "text",
                  "options": ""
                },
                {
                  "name": "onclick",
                  "display": "On Click",
                  "type": "function",
                  "options": ""
                },
                {
                  "name": "ref",
                  "display": "Use Reference",
                  "type": "text",
                  "options": ""
                },
                {
                  "name": "style",
                  "display": "Extra Styles",
                  "type": "text",
                  "options": ""
                }
              ],
              "children": [{
                "path": "text.tpl",
                "completePath": "elements/Basic/text.tpl",
                "type": "element",
                "icon": "ico-text",
                "helpText": "Insert simple text anywhere. Can hold variables, code, and anything of your choice",
                "sourceType": "javascript",
                "options": [{
                    "name": "Content",
                    "display": "Content",
                    "type": "text",
                    "options": ""
                  },
                  {
                    "name": "ClassName",
                    "display": "ClassName",
                    "type": "text",
                    "options": ""
                  }
                ],
                "children": [],
                "open": false,
                "name": "text",
                "cascades": false,
                "value": "text",
                "values": {
                  "Content": "Content: {emailParameters.message}"
                },
                "prevent_delete": false
              }],
              "helpText": "Basic HTML Div element",
              "open": false,
              "name": "Message",
              "cascades": false,
              "value": "div",
              "prevent_delete": false
            }
          ],
          "options": [{
            "name": "internalfunctionName",
            "display": "Internal Function Name",
            "type": "text",
            "options": "",
            "advanced": true,
            "settings": {
              "default": "'InlineLink'"
            }
          }],
          "open": false,
          "name": "Email Content",
          "cascades": false,
          "value": "emailContent",
          "prevent_delete": false
        }],
        "open": false,
        "name": "email",
        "cascades": false,
        "value": "email",
        "values": {
          "functionName": "sendContactUsEmail",
          "service": "SMTP",
          "smpthost": "1",
          "smptport": "2",
          "smptuser": "3",
          "smptpass": "4",
          "subject": "lang.contactSubject",
          "from": "contact@yourdomain.com",
          "parameters": "contactusState"
        },
        "prevent_delete": false
      }
    ],
    "icon": "ico-dummy-enclosure",
    "helpText": "Organizational unit with no render value",
    "open": false,
    "name": "Definitions: ContactUS",
    "cascades": false,
    "type": "element",
    "value": "dummyEncloser",
    "prevent_delete": false
  }],
  "name": "Page Header",
  "cascades": false,
  "type": "element",
  "value": "ph",
  "prevent_delete": false
}

const B = {
  "path": "b.tpl",
  "completePath": "elements/Aptugo Internal Use/b.tpl",
  "type": "element",
  "icon": "ico-field",
  "sourceType": "javascript",
  "internalUse": true,
  "children": [{
    "path": "snackbar.tpl",
    "completePath": "elements/Material-UI/snackbar.tpl",
    "type": "element",
    "icon": "ico-snackbar",
    "options": [{
        "name": "message",
        "display": "Message",
        "type": "text",
        "options": ""
      },
      {
        "name": "autohide",
        "display": "Auto Hide Duration (ms)",
        "type": "text",
        "options": ""
      },
      {
        "name": "position",
        "display": "Position",
        "type": "dropdown",
        "options": "Top-Left;Top-Center;Top-Right;Bottom-Left;Bottom-Center;Bottom-Right"
      },
      {
        "name": "varName",
        "display": "Variable Name (snackBarOpen)",
        "type": "text",
        "settings": {
          "default": "snackBarOpen",
          "active": true
        }
      }
    ],
    "children": [],
    "open": false,
    "name": "Contact Us Snackbar",
    "cascades": false,
    "value": "snackbar",
    "values": {
      "message": "{lang?.messageSent}",
      "autohide": "6000",
      "position": "Bottom-Right",
      "varName": "contactUsSnackOpen"
    },
    "prevent_delete": false
  },
  {
    "path": "Container.tpl",
    "completePath": "elements/Material-UI/Container.tpl",
    "type": "element",
    "icon": "ico-field",
    "helpText": "The container centers your content horizontally. It's the most basic layout element.",
    "options": [{
        "name": "disableGutters",
        "display": "Disable Gutters",
        "type": "checkbox",
        "options": ""
      },
      {
        "name": "fixed",
        "display": "Fixed?",
        "type": "checkbox",
        "options": ""
      },
      {
        "name": "maxWidth",
        "display": "Max Width",
        "type": "dropdown",
        "options": "lg;md;sm;xl;xs;false"
      },
      {
        "name": "className",
        "display": "className",
        "type": "text",
        "options": ""
      }
    ],
    "sourceType": "javascript",
    "children": [{
        "path": "typography.tpl",
        "completePath": "elements/Material-UI/typography.tpl",
        "children": [{
          "path": "text.tpl",
          "completePath": "elements/Basic/text.tpl",
          "type": "element",
          "icon": "ico-text",
          "helpText": "Insert simple text anywhere. Can hold variables, code, and anything of your choice",
          "sourceType": "javascript",
          "options": [{
              "name": "Content",
              "display": "Content",
              "type": "text",
              "options": ""
            },
            {
              "name": "ClassName",
              "display": "ClassName",
              "type": "text",
              "options": ""
            }
          ],
          "children": [],
          "open": false,
          "name": "Text Content",
          "cascades": false,
          "value": "text",
          "values": {
            "Content": "{lang?.ContactUs}"
          },
          "prevent_delete": false
        }],
        "icon": "ico-typography",
        "helpText": "Renders different typographic html elements",
        "calculatedName": "function (ele) { \n  try {\n    return ele.values.tag\n  } catch(e) {\n    return 'Typography'\n  }\n}",
        "options": [{
          "name": "tag",
          "display": "Tag",
          "type": "dropdown",
          "options": "h1;h2;h3;h4;h5;h6;subtitle1;subtitle2;body1;body2;caption;button;overline;srOnly;inherit"
        }],
        "childs": [{
          "name": "Text Content",
          "element": "text"
        }],
        "open": false,
        "name": "typography",
        "originalName": "typography",
        "cascades": false,
        "type": "element",
        "value": "typography",
        "values": {
          "tag": "h1"
        },
        "prevent_delete": false
      },
      {
        "path": "grid.tpl",
        "completePath": "elements/Material-UI/grid.tpl",
        "children": [{
            "path": "grid.tpl",
            "completePath": "elements/Material-UI/grid.tpl",
            "children": [{
                "path": "typography.tpl",
                "completePath": "elements/Material-UI/typography.tpl",
                "children": [{
                  "path": "text.tpl",
                  "completePath": "elements/Basic/text.tpl",
                  "type": "element",
                  "icon": "ico-text",
                  "helpText": "Insert simple text anywhere. Can hold variables, code, and anything of your choice",
                  "sourceType": "javascript",
                  "options": [{
                      "name": "Content",
                      "display": "Content",
                      "type": "text",
                      "options": ""
                    },
                    {
                      "name": "ClassName",
                      "display": "ClassName",
                      "type": "text",
                      "options": ""
                    }
                  ],
                  "children": [],
                  "open": false,
                  "name": "Text Content",
                  "cascades": false,
                  "value": "text",
                  "values": {
                    "Content": "{lang?.IntroPhrase}"
                  },
                  "prevent_delete": false
                }],
                "icon": "ico-typography",
                "helpText": "Renders different typographic html elements",
                "calculatedName": "function (ele) { \n  try {\n    return ele.values.tag\n  } catch(e) {\n    return 'Typography'\n  }\n}",
                "options": [{
                  "name": "tag",
                  "display": "Tag",
                  "type": "dropdown",
                  "options": "h1;h2;h3;h4;h5;h6;subtitle1;subtitle2;body1;body2;caption;button;overline;srOnly;inherit"
                }],
                "childs": [{
                  "name": "Text Content",
                  "element": "text"
                }],
                "open": false,
                "name": "typography",
                "originalName": "typography",
                "cascades": false,
                "type": "element",
                "value": "typography",
                "values": {
                  "tag": "h2"
                },
                "prevent_delete": false
              },
              {
                "path": "div.tpl",
                "completePath": "elements/Basic/div.tpl",
                "type": "element",
                "icon": "ico-div",
                "sourceType": "javascript",
                "options": [{
                    "name": "class",
                    "display": "ClassName",
                    "type": "styles",
                    "options": ""
                  },
                  {
                    "name": "useid",
                    "display": "Use UniqueID as ID",
                    "type": "checkbox",
                    "options": ""
                  },
                  {
                    "name": "id",
                    "display": "ID",
                    "type": "text",
                    "options": ""
                  },
                  {
                    "name": "onclick",
                    "display": "On Click",
                    "type": "function",
                    "options": ""
                  },
                  {
                    "name": "ref",
                    "display": "Use Reference",
                    "type": "text",
                    "options": ""
                  },
                  {
                    "name": "style",
                    "display": "Extra Styles",
                    "type": "text",
                    "options": ""
                  }
                ],
                "children": [{
                    "path": "uncontrolledInput.tpl",
                    "completePath": "elements/Material-UI/uncontrolledInput.tpl",
                    "type": "element",
                    "icon": "ico-uncontrolled-input",
                    "sourceType": "javascript",
                    "options": [{
                        "name": "label",
                        "display": "Label",
                        "type": "text",
                        "options": ""
                      },
                      {
                        "name": "value",
                        "display": "Value",
                        "type": "text",
                        "options": ""
                      },
                      {
                        "name": "onChange",
                        "display": "On Change",
                        "type": "text",
                        "options": ""
                      },
                      {
                        "name": "placeholder",
                        "display": "Placeholder",
                        "type": "text",
                        "options": ""
                      },
                      {
                        "name": "variant",
                        "display": "Variant",
                        "type": "dropdown",
                        "options": "standard;filled;outlined"
                      },
                      {
                        "name": "margin",
                        "display": "Margin",
                        "type": "dropdown",
                        "options": "normal;dense;none"
                      },
                      {
                        "name": "className",
                        "display": "ClassName",
                        "type": "text",
                        "options": ""
                      },
                      {
                        "name": "fieldname",
                        "display": "fieldname",
                        "type": "text",
                        "options": ""
                      },
                      {
                        "name": "type",
                        "display": "Type",
                        "type": "dropdown",
                        "options": "text;password;date;number;textarea"
                      }
                    ],
                    "children": [],
                    "open": false,
                    "name": "Email Input",
                    "cascades": false,
                    "value": "uncontrolledInput",
                    "values": {
                      "label": "{lang?.Email}",
                      "value": "{contactusState.email}",
                      "onChange": "(e) => { setcontactusState({ ...contactusState, email: e.target.value }) }",
                      "placeholder": "{lang?.EmailPlaceholder}",
                      "variant": "filled",
                      "margin": "normal"
                    },
                    "prevent_delete": false
                  },
                  {
                    "path": "uncontrolledInput.tpl",
                    "completePath": "elements/Material-UI/uncontrolledInput.tpl",
                    "type": "element",
                    "icon": "ico-uncontrolled-input",
                    "sourceType": "javascript",
                    "options": [{
                        "name": "label",
                        "display": "Label",
                        "type": "text",
                        "options": ""
                      },
                      {
                        "name": "value",
                        "display": "Value",
                        "type": "text",
                        "options": ""
                      },
                      {
                        "name": "onChange",
                        "display": "On Change",
                        "type": "text",
                        "options": ""
                      },
                      {
                        "name": "placeholder",
                        "display": "Placeholder",
                        "type": "text",
                        "options": ""
                      },
                      {
                        "name": "variant",
                        "display": "Variant",
                        "type": "dropdown",
                        "options": "standard;filled;outlined"
                      },
                      {
                        "name": "margin",
                        "display": "Margin",
                        "type": "dropdown",
                        "options": "normal;dense;none"
                      },
                      {
                        "name": "className",
                        "display": "ClassName",
                        "type": "text",
                        "options": ""
                      },
                      {
                        "name": "fieldname",
                        "display": "fieldname",
                        "type": "text",
                        "options": ""
                      },
                      {
                        "name": "type",
                        "display": "Type",
                        "type": "dropdown",
                        "options": "text;password;date;number;textarea"
                      }
                    ],
                    "children": [],
                    "open": false,
                    "name": "Subject Input",
                    "cascades": false,
                    "value": "uncontrolledInput",
                    "values": {
                      "label": "{lang?.Subject}",
                      "value": "{contactusState.subject}",
                      "onChange": "(e) => { setcontactusState({ ...contactusState, subject: e.target.value }) }",
                      "placeholder": "{lang?.SubjectPlaceholder}",
                      "variant": "filled",
                      "margin": "normal"
                    },
                    "prevent_delete": false
                  },
                  {
                    "path": "uncontrolledInput.tpl",
                    "completePath": "elements/Material-UI/uncontrolledInput.tpl",
                    "type": "element",
                    "icon": "ico-uncontrolled-input",
                    "sourceType": "javascript",
                    "options": [{
                        "name": "label",
                        "display": "Label",
                        "type": "text",
                        "options": ""
                      },
                      {
                        "name": "value",
                        "display": "Value",
                        "type": "text",
                        "options": ""
                      },
                      {
                        "name": "onChange",
                        "display": "On Change",
                        "type": "text",
                        "options": ""
                      },
                      {
                        "name": "placeholder",
                        "display": "Placeholder",
                        "type": "text",
                        "options": ""
                      },
                      {
                        "name": "variant",
                        "display": "Variant",
                        "type": "dropdown",
                        "options": "standard;filled;outlined"
                      },
                      {
                        "name": "margin",
                        "display": "Margin",
                        "type": "dropdown",
                        "options": "normal;dense;none"
                      },
                      {
                        "name": "className",
                        "display": "ClassName",
                        "type": "text",
                        "options": ""
                      },
                      {
                        "name": "fieldname",
                        "display": "fieldname",
                        "type": "text",
                        "options": ""
                      },
                      {
                        "name": "type",
                        "display": "Type",
                        "type": "dropdown",
                        "options": "text;password;date;number;textarea"
                      }
                    ],
                    "children": [],
                    "open": false,
                    "name": "Message Input",
                    "cascades": false,
                    "value": "uncontrolledInput",
                    "values": {
                      "label": "{lang?.Message}",
                      "value": "{contactusState.message}",
                      "onChange": "(e) => { setcontactusState({ ...contactusState, message: e.target.value }) }",
                      "placeholder": "{lang?.MessagePlaceholder}",
                      "variant": "filled",
                      "margin": "normal"
                    },
                    "prevent_delete": false
                  },
                  {
                    "path": "button.tpl",
                    "completePath": "elements/Material-UI/button.tpl",
                    "type": "element",
                    "icon": "ico-button",
                    "options": [{
                        "name": "ButtonText",
                        "display": "Button Text",
                        "type": "text",
                        "options": "",
                        "settings": {
                          "default": "Button"
                        }
                      },
                      {
                        "name": "Action",
                        "display": "Action",
                        "type": "text",
                        "options": ""
                      },
                      {
                        "name": "className",
                        "display": "ClassName",
                        "type": "text",
                        "options": ""
                      },
                      {
                        "name": "Variant",
                        "display": "Variant",
                        "type": "dropdown",
                        "options": "text;contained;outlined"
                      },
                      {
                        "name": "Color",
                        "display": "Color",
                        "type": "dropdown",
                        "options": "default;inherit;primary;secondary",
                        "settings": {
                          "default": "primary"
                        }
                      },
                      {
                        "name": "disabled",
                        "display": "Disabled",
                        "type": "variable",
                        "options": "",
                        "settings": {
                          "active": true
                        }
                      },
                      {
                        "name": "fullWidth",
                        "display": "Full Width",
                        "type": "checkbox",
                        "options": ""
                      },
                      {
                        "name": "icon",
                        "display": "Icon",
                        "type": "dropdown",
                        "options": "None;Add;Home;Link;Send;AllInbox;Menu;DeleteOutline;Favorite;Clear;Google;Facebook;Twitter;Person;ThumbUp"
                      }
                    ],
                    "sourceType": "javascript",
                    "children": [],
                    "open": false,
                    "name": "button",
                    "cascades": false,
                    "value": "button",
                    "values": {
                      "ButtonText": "{lang?.sendButton}",
                      "Action": "sendContactUsMessage()",
                      "Variant": "contained",
                      "fullWidth": true
                    },
                    "prevent_delete": false
                  }
                ],
                "helpText": "Basic HTML Div element",
                "open": false,
                "name": "Form",
                "cascades": false,
                "value": "div",
                "prevent_delete": false
              }
            ],
            "options": [{
                "name": "container",
                "display": "Is the container",
                "type": "checkbox",
                "options": ""
              },
              {
                "name": "className",
                "display": "ClassName",
                "type": "text",
                "options": ""
              },
              {
                "name": "justify",
                "display": "Justify",
                "type": "dropdown",
                "options": "flex-start;center;flex-end;space-between;space-around;space-evenly"
              },
              {
                "name": "align",
                "display": "Align",
                "type": "dropdown",
                "options": "flex-start;center;flex-end;stretch;baseline"
              },
              {
                "name": "smallcolumns",
                "display": "Columns (small)",
                "type": "text",
                "options": "flex-start;center;flex-end;stretch;baseline"
              },
              {
                "name": "midcolumns",
                "display": "Columns (mid)",
                "type": "text",
                "options": "flex-start;center;flex-end;stretch;baseline"
              },
              {
                "name": "spacing",
                "display": "Spacing",
                "type": "text",
                "options": "flex-start;center;flex-end;stretch;baseline"
              }
            ],
            "helpText": "The Material Design responsive layout grid adapts to screen size and orientation, ensuring consistency across layouts.",
            "icon": "ico-grid",
            "open": false,
            "name": "Left Grid",
            "cascades": false,
            "type": "element",
            "value": "grid",
            "values": {
              "smallcolumns": "12",
              "midcolumns": "6"
            },
            "prevent_delete": false
          },
          {
            "path": "grid.tpl",
            "completePath": "elements/Material-UI/grid.tpl",
            "children": [{
                "path": "typography.tpl",
                "completePath": "elements/Material-UI/typography.tpl",
                "children": [{
                    "path": "MaterialIcon.tpl",
                    "completePath": "elements/Material-UI/MaterialIcon.tpl",
                    "type": "element",
                    "icon": "ico-icon-button",
                    "helpText": "Shows a material icon from the list",
                    "children": [],
                    "options": [{
                        "name": "icon",
                        "display": "Icon",
                        "type": "text",
                        "options": "Access"
                      },
                      {
                        "name": "color",
                        "display": "Color",
                        "type": "dropdown",
                        "options": "default;primary;secondary;action;disabled"
                      },
                      {
                        "name": "className",
                        "display": "className",
                        "type": "text"
                      }
                    ],
                    "open": false,
                    "name": "MaterialIcon",
                    "cascades": false,
                    "value": "MaterialIcon",
                    "values": {
                      "icon": "LocationOn",
                      "color": "primary"
                    },
                    "prevent_delete": false
                  },
                  {
                    "path": "text.tpl",
                    "completePath": "elements/Basic/text.tpl",
                    "type": "element",
                    "icon": "ico-text",
                    "helpText": "Insert simple text anywhere. Can hold variables, code, and anything of your choice",
                    "sourceType": "javascript",
                    "options": [{
                        "name": "Content",
                        "display": "Content",
                        "type": "text",
                        "options": ""
                      },
                      {
                        "name": "ClassName",
                        "display": "ClassName",
                        "type": "text",
                        "options": ""
                      }
                    ],
                    "children": [],
                    "open": false,
                    "name": "Text Content",
                    "cascades": false,
                    "value": "text",
                    "values": {
                      "Content": "{lang?.WhereAreWe}"
                    },
                    "prevent_delete": false
                  }
                ],
                "icon": "ico-typography",
                "helpText": "Renders different typographic html elements",
                "calculatedName": "function (ele) { \n  try {\n    return ele.values.tag\n  } catch(e) {\n    return 'Typography'\n  }\n}",
                "options": [{
                  "name": "tag",
                  "display": "Tag",
                  "type": "dropdown",
                  "options": "h1;h2;h3;h4;h5;h6;subtitle1;subtitle2;body1;body2;caption;button;overline;srOnly;inherit"
                }],
                "childs": [{
                  "name": "Text Content",
                  "element": "text"
                }],
                "open": false,
                "name": "typography",
                "originalName": "typography",
                "cascades": false,
                "type": "element",
                "value": "typography",
                "values": {
                  "tag": "h3"
                },
                "prevent_delete": false
              },
              {
                "path": "div.tpl",
                "completePath": "elements/Basic/div.tpl",
                "type": "element",
                "icon": "ico-div",
                "sourceType": "javascript",
                "options": [{
                    "name": "class",
                    "display": "ClassName",
                    "type": "styles",
                    "options": ""
                  },
                  {
                    "name": "useid",
                    "display": "Use UniqueID as ID",
                    "type": "checkbox",
                    "options": ""
                  },
                  {
                    "name": "id",
                    "display": "ID",
                    "type": "text",
                    "options": ""
                  },
                  {
                    "name": "onclick",
                    "display": "On Click",
                    "type": "function",
                    "options": ""
                  },
                  {
                    "name": "ref",
                    "display": "Use Reference",
                    "type": "text",
                    "options": ""
                  },
                  {
                    "name": "style",
                    "display": "Extra Styles",
                    "type": "text",
                    "options": ""
                  }
                ],
                "children": [{
                    "path": "typography.tpl",
                    "completePath": "elements/Material-UI/typography.tpl",
                    "children": [{
                      "path": "text.tpl",
                      "completePath": "elements/Basic/text.tpl",
                      "type": "element",
                      "icon": "ico-text",
                      "helpText": "Insert simple text anywhere. Can hold variables, code, and anything of your choice",
                      "sourceType": "javascript",
                      "options": [{
                          "name": "Content",
                          "display": "Content",
                          "type": "text",
                          "options": ""
                        },
                        {
                          "name": "ClassName",
                          "display": "ClassName",
                          "type": "text",
                          "options": ""
                        }
                      ],
                      "children": [],
                      "open": false,
                      "name": "First Line",
                      "cascades": false,
                      "value": "text",
                      "values": {
                        "Content": "{lang?.address1}"
                      },
                      "prevent_delete": false
                    }],
                    "icon": "ico-typography",
                    "helpText": "Renders different typographic html elements",
                    "calculatedName": "function (ele) { \n  try {\n    return ele.values.tag\n  } catch(e) {\n    return 'Typography'\n  }\n}",
                    "options": [{
                      "name": "tag",
                      "display": "Tag",
                      "type": "dropdown",
                      "options": "h1;h2;h3;h4;h5;h6;subtitle1;subtitle2;body1;body2;caption;button;overline;srOnly;inherit"
                    }],
                    "childs": [{
                      "name": "Text Content",
                      "element": "text"
                    }],
                    "open": false,
                    "name": "typography",
                    "originalName": "typography",
                    "cascades": false,
                    "type": "element",
                    "value": "typography",
                    "values": {
                      "tag": "body1"
                    },
                    "prevent_delete": false
                  },
                  {
                    "path": "typography.tpl",
                    "completePath": "elements/Material-UI/typography.tpl",
                    "children": [{
                      "path": "text.tpl",
                      "completePath": "elements/Basic/text.tpl",
                      "type": "element",
                      "icon": "ico-text",
                      "helpText": "Insert simple text anywhere. Can hold variables, code, and anything of your choice",
                      "sourceType": "javascript",
                      "options": [{
                          "name": "Content",
                          "display": "Content",
                          "type": "text",
                          "options": ""
                        },
                        {
                          "name": "ClassName",
                          "display": "ClassName",
                          "type": "text",
                          "options": ""
                        }
                      ],
                      "children": [],
                      "open": false,
                      "name": "Second Line",
                      "cascades": false,
                      "value": "text",
                      "values": {
                        "Content": "{lang?.address2}"
                      },
                      "prevent_delete": false
                    }],
                    "icon": "ico-typography",
                    "helpText": "Renders different typographic html elements",
                    "calculatedName": "function (ele) { \n  try {\n    return ele.values.tag\n  } catch(e) {\n    return 'Typography'\n  }\n}",
                    "options": [{
                      "name": "tag",
                      "display": "Tag",
                      "type": "dropdown",
                      "options": "h1;h2;h3;h4;h5;h6;subtitle1;subtitle2;body1;body2;caption;button;overline;srOnly;inherit"
                    }],
                    "childs": [{
                      "name": "Text Content",
                      "element": "text"
                    }],
                    "open": false,
                    "name": "typography",
                    "originalName": "typography",
                    "cascades": false,
                    "type": "element",
                    "value": "typography",
                    "values": {
                      "tag": "body1"
                    },
                    "prevent_delete": false
                  },
                  {
                    "path": "typography.tpl",
                    "completePath": "elements/Material-UI/typography.tpl",
                    "children": [{
                      "path": "text.tpl",
                      "completePath": "elements/Basic/text.tpl",
                      "type": "element",
                      "icon": "ico-text",
                      "helpText": "Insert simple text anywhere. Can hold variables, code, and anything of your choice",
                      "sourceType": "javascript",
                      "options": [{
                          "name": "Content",
                          "display": "Content",
                          "type": "text",
                          "options": ""
                        },
                        {
                          "name": "ClassName",
                          "display": "ClassName",
                          "type": "text",
                          "options": ""
                        }
                      ],
                      "children": [],
                      "open": false,
                      "name": "Third Line",
                      "cascades": false,
                      "value": "text",
                      "values": {
                        "Content": "{lang?.address3}"
                      },
                      "prevent_delete": false
                    }],
                    "icon": "ico-typography",
                    "helpText": "Renders different typographic html elements",
                    "calculatedName": "function (ele) { \n  try {\n    return ele.values.tag\n  } catch(e) {\n    return 'Typography'\n  }\n}",
                    "options": [{
                      "name": "tag",
                      "display": "Tag",
                      "type": "dropdown",
                      "options": "h1;h2;h3;h4;h5;h6;subtitle1;subtitle2;body1;body2;caption;button;overline;srOnly;inherit"
                    }],
                    "childs": [{
                      "name": "Text Content",
                      "element": "text"
                    }],
                    "open": false,
                    "name": "typography",
                    "originalName": "typography",
                    "cascades": false,
                    "type": "element",
                    "value": "typography",
                    "values": {
                      "tag": "body1"
                    },
                    "prevent_delete": false
                  },
                  {
                    "path": "typography.tpl",
                    "completePath": "elements/Material-UI/typography.tpl",
                    "children": [{
                      "path": "text.tpl",
                      "completePath": "elements/Basic/text.tpl",
                      "type": "element",
                      "icon": "ico-text",
                      "helpText": "Insert simple text anywhere. Can hold variables, code, and anything of your choice",
                      "sourceType": "javascript",
                      "options": [{
                          "name": "Content",
                          "display": "Content",
                          "type": "text",
                          "options": ""
                        },
                        {
                          "name": "ClassName",
                          "display": "ClassName",
                          "type": "text",
                          "options": ""
                        }
                      ],
                      "children": [],
                      "open": false,
                      "name": "Text Content",
                      "cascades": false,
                      "value": "text",
                      "values": {
                        "Content": "{lang?.address4}"
                      },
                      "prevent_delete": false
                    }],
                    "icon": "ico-typography",
                    "helpText": "Renders different typographic html elements",
                    "calculatedName": "function (ele) { \n  try {\n    return ele.values.tag\n  } catch(e) {\n    return 'Typography'\n  }\n}",
                    "options": [{
                      "name": "tag",
                      "display": "Tag",
                      "type": "dropdown",
                      "options": "h1;h2;h3;h4;h5;h6;subtitle1;subtitle2;body1;body2;caption;button;overline;srOnly;inherit"
                    }],
                    "childs": [{
                      "name": "Text Content",
                      "element": "text"
                    }],
                    "open": false,
                    "name": "typography",
                    "originalName": "typography",
                    "cascades": false,
                    "type": "element",
                    "value": "typography",
                    "values": {
                      "tag": "body1"
                    },
                    "prevent_delete": false
                  }
                ],
                "helpText": "Basic HTML Div element",
                "open": false,
                "name": "Address",
                "cascades": false,
                "value": "div",
                "prevent_delete": false
              },
              {
                "path": "div.tpl",
                "completePath": "elements/Basic/div.tpl",
                "type": "element",
                "icon": "ico-div",
                "sourceType": "javascript",
                "options": [{
                    "name": "class",
                    "display": "ClassName",
                    "type": "styles",
                    "options": ""
                  },
                  {
                    "name": "useid",
                    "display": "Use UniqueID as ID",
                    "type": "checkbox",
                    "options": ""
                  },
                  {
                    "name": "id",
                    "display": "ID",
                    "type": "text",
                    "options": ""
                  },
                  {
                    "name": "onclick",
                    "display": "On Click",
                    "type": "function",
                    "options": ""
                  },
                  {
                    "name": "ref",
                    "display": "Use Reference",
                    "type": "text",
                    "options": ""
                  },
                  {
                    "name": "style",
                    "display": "Extra Styles",
                    "type": "text",
                    "options": ""
                  }
                ],
                "children": [{
                  "path": "LeafLet.tpl",
                  "completePath": "elements/Geo/LeafLet.tpl",
                  "type": "element",
                  "icon": "ico-leaflet",
                  "children": [{
                    "path": "Marker.tpl",
                    "completePath": "elements/Geo/Marker.tpl",
                    "type": "element",
                    "icon": "ico-marker",
                    "children": [],
                    "options": [{
                      "name": "Position",
                      "display": "Position",
                      "type": "text",
                      "options": ""
                    }],
                    "open": false,
                    "name": "Marker",
                    "cascades": false,
                    "value": "Marker",
                    "values": {
                      "Position": "{mapCoordinates}"
                    },
                    "prevent_delete": false
                  }],
                  "settings": [{
                    "name": "Packages",
                    "value": "\"react-leaflet\": \"2.8.0\",\"leaflet\": \"latest\","
                  }],
                  "open": false,
                  "name": "LeafLet",
                  "cascades": false,
                  "value": "LeafLet",
                  "prevent_delete": false
                }],
                "helpText": "Basic HTML Div element",
                "open": false,
                "name": "Map Container",
                "cascades": false,
                "value": "div",
                "values": {
                  "style": "{ width: '100%', height: '315px' }"
                },
                "prevent_delete": false
              }
            ],
            "options": [{
                "name": "container",
                "display": "Is the container",
                "type": "checkbox",
                "options": ""
              },
              {
                "name": "className",
                "display": "ClassName",
                "type": "text",
                "options": ""
              },
              {
                "name": "justify",
                "display": "Justify",
                "type": "dropdown",
                "options": "flex-start;center;flex-end;space-between;space-around;space-evenly"
              },
              {
                "name": "align",
                "display": "Align",
                "type": "dropdown",
                "options": "flex-start;center;flex-end;stretch;baseline"
              },
              {
                "name": "smallcolumns",
                "display": "Columns (small)",
                "type": "text",
                "options": "flex-start;center;flex-end;stretch;baseline"
              },
              {
                "name": "midcolumns",
                "display": "Columns (mid)",
                "type": "text",
                "options": "flex-start;center;flex-end;stretch;baseline"
              },
              {
                "name": "spacing",
                "display": "Spacing",
                "type": "text",
                "options": "flex-start;center;flex-end;stretch;baseline"
              }
            ],
            "helpText": "The Material Design responsive layout grid adapts to screen size and orientation, ensuring consistency across layouts.",
            "icon": "ico-grid",
            "open": false,
            "name": "Right Grid",
            "cascades": false,
            "type": "element",
            "value": "grid",
            "values": {
              "smallcolumns": "12",
              "midcolumns": "6"
            },
            "prevent_delete": false
          }
        ],
        "options": [{
            "name": "container",
            "display": "Is the container",
            "type": "checkbox",
            "options": ""
          },
          {
            "name": "className",
            "display": "ClassName",
            "type": "text",
            "options": ""
          },
          {
            "name": "justify",
            "display": "Justify",
            "type": "dropdown",
            "options": "flex-start;center;flex-end;space-between;space-around;space-evenly"
          },
          {
            "name": "align",
            "display": "Align",
            "type": "dropdown",
            "options": "flex-start;center;flex-end;stretch;baseline"
          },
          {
            "name": "smallcolumns",
            "display": "Columns (small)",
            "type": "text",
            "options": "flex-start;center;flex-end;stretch;baseline"
          },
          {
            "name": "midcolumns",
            "display": "Columns (mid)",
            "type": "text",
            "options": "flex-start;center;flex-end;stretch;baseline"
          },
          {
            "name": "spacing",
            "display": "Spacing",
            "type": "text",
            "options": "flex-start;center;flex-end;stretch;baseline"
          }
        ],
        "helpText": "The Material Design responsive layout grid adapts to screen size and orientation, ensuring consistency across layouts.",
        "icon": "ico-grid",
        "open": false,
        "name": "Grid Container",
        "cascades": false,
        "type": "element",
        "value": "grid",
        "values": {
          "container": true,
          "spacing": "5"
        },
        "prevent_delete": false
      }
    ],
    "open": false,
    "name": "Container",
    "cascades": false,
    "value": "Container",
    "prevent_delete": false
  }],
  "options": [{
      "name": "className",
      "display": "ClassName",
      "type": "chips",
      "options": "return aptugo.assetUtils.grabCssSelectors( aptugo.variables.retrievePageVariablesFromElement(arguments[0],'theme') )"
    },
    {
      "name": "primaryColor",
      "display": "Primary Color",
      "type": "dropdown",
      "options": "red;pink;purple;deepPurple;indigo;blue;lightBlue;cyan;teal;green;lightGreen;lime;yellow;amber;orange;deepOrange;brown;grey;blueGrey"
    }
  ],
  "open": false,
  "name": "Body",
  "cascades": false,
  "value": "b",
  "values": {
    "className": [
      "theme.pages",
      "theme.contactus"
    ],
    "primaryColor": "red"
  },
  "prevent_delete": false
}

const emptyPF = {
  "path": "pf.tpl",
  "completePath": "elements/Aptugo Internal Use/pf.tpl",
  "open": false,
  "name": "Page Footer",
  "cascades": false,
  "type": "element",
  "value": "pf",
  "prevent_delete": false,
  "children": []
}

const emptyAPR = {
  "path": "apr.tpl",
  "completePath": "elements/Aptugo Internal Use/apr.tpl",
  "children": [],
  "icon": "ico-field",
  "helpText": "After Page Render",
  "open": false,
  "name": "After Page Render",
  "cascades": false,
  "type": "element",
  "value": "apr",
  "prevent_delete": false
}

const newPage = {
  unique_id: Parameters.unique_id || aptugo.generateID(),
  name: Parameters.name || 'ContactUS',
  path: Parameters.path || '/contactus',
  filename: Parameters.filename || 'contactus.tsx',
  type: 'page',
  children: [emptyBPR, PH, B, emptyPF, emptyAPR]
}

if (Parameters.parentPage) {
  const container = aptugo.findPageInTree(Application.pages, Parameters.parentPage)
  container.children.push(newPage)
} else {
  Application.pages.push(newPage)
}

return Application