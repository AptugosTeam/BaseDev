const userTable = Application.tables.find(table => table.unique_id === Parameters.table_unique_id)

const dmz = {
	"name": "Non Restricted Zone",
	"type": "page",
	"path": "",
	"filename": "",
	"collapseStatus": "expand",
	"delays": {
		"bpr": ["import minimum from '../components/Themes/minimum.module.scss'", "import { mergeClasses } from '../services/utils'"],
		"ph": ["const theme = minimum"]
	},
	"children": [{
		"name": "Before Page Render",
		"type": "element",
		"value": "bpr",
		"prevent_delete": true,
		"cascades": false,
		"collapseStatus": "collapse",
		"children": [],
	}, {
		"name": "Page Header",
		"type": "element",
		"value": "ph",
		"prevent_delete": true,
		"cascades": false,
		"collapseStatus": "expand",
		"children": [],
	}, {
		"name": "Body",
		"type": "element",
		"value": "b",
		"prevent_delete": true,
		"cascades": false,
		"collapseStatus": "collapse",
		"children": [],
	}, {
		"name": "Page Footer",
		"type": "element",
		"value": "pf",
		"prevent_delete": true,
		"cascades": false,
		"collapseStatus": "collapse",
		"children": [],
	}, {
		"name": "After Page Render",
		"type": "element",
		"value": "apr",
		"prevent_delete": true,
		"cascades": false,
		"collapseStatus": "collapse",
		"children": [],
	}]
}

const LoginPagePH = {
	"path": "ph.tpl",
	"keyPath": "elements/Aptugo Internal Use/ph.tpl",
	"prevent_delete": true,
	"children": [
	  {
		"children": [
		  {
			"cascades": false,
			"name": "Login Data",
			"path": "useState.tpl",
			"prevent_delete": false,
			"type": "element",
			"value": "useState",
			"values": {
			  "variableName": "loginData",
			  "defaultValue": "{\n  Email: '',\n  Password: '',\n  RememberMe: false\n}"
			}
		  },
		  {
			"cascades": false,
			"name": "Login Error",
			"path": "useState.tpl",
			"prevent_delete": false,
			"type": "element",
			"value": "useState",
			"values": {
			  "variableName": "loginError",
			  "defaultValue": "null"
			}
		  },
		  {
			"children": [
			  {
				"cascades": false,
				"name": "login",
				"path": "login.tpl",
				"prevent_delete": false,
				"type": "element",
				"value": "login",
				"values": {
				  "Email": "loginData.Email",
				  "Password": "loginData.Password",
				  "OnSuccess": Parameters.mainPageID
				}
			  }
			],
			"cascades": false,
			"name": "handleLogin",
			"path": "function.tpl",
			"prevent_delete": false,
			"type": "element",
			"value": "function",
			"values": {
			  "functionName": "handleLogin",
			  "functionBody": ""
			}
		  }
		],
		"cascades": false,
		"name": "Login Functionality",
		"path": "dummyEncloser.tpl",
		"prevent_delete": false,
		"type": "element",
		"value": "dummyEncloser"
	  }
	],
	"cascades": false,
	"name": "Page Header",
	"type": "element",
	"value": "ph"
}

const LoginPageB = {
  "path": "b.tpl",
  "keyPath": "elements/Aptugo Internal Use/b.tpl",
  "type": "element",
  "internalUse": true,
  "children": [
    {
      "children": [
        {
          "children": [
            {
              "cascades": false,
              "name": "text",
              "path": "text.tpl",
              "prevent_delete": false,
              "type": "element",
              "value": "text",
              "values": {
                "Content": "Don't have an account? ",
                "ClassName": "theme.right"
              }
            },
            {
              "children": [
                {
                  "cascades": false,
                  "name": "text",
                  "path": "text.tpl",
                  "prevent_delete": false,
                  "type": "element",
                  "value": "text",
                  "values": {
                    "Content": " Register!",
                    "ClassName": "theme.textRegister"
                  }
                }
              ],
              "cascades": false,
              "name": "simpleLink",
              "path": "simpleLink.tpl",
              "prevent_delete": false,
              "type": "element",
              "value": "simpleLink",
              "values": {
                "tagToUse": "NavLink",
                "destination": "/register",
                "fromLink": "L0sgrASh"
              }
            }
          ],
          "cascades": false,
          "name": "Register Area",
          "path": "div.tpl",
          "prevent_delete": false,
          "type": "element",
          "value": "div",
          "values": {
            "class": "theme.containerLogin"
          }
        },
        {
          "children": [
            {
              "children": [
                {
                  "children": [
                    {
                      "cascades": false,
                      "name": "text",
                      "path": "text.tpl",
                      "prevent_delete": false,
                      "type": "element",
                      "value": "text",
                      "values": {
                        "Content": "Sign In",
                        "ClassName": "theme.textSignIn"
                      }
                    }
                  ],
                  "cascades": false,
                  "name": "div",
                  "path": "div.tpl",
                  "prevent_delete": false,
                  "type": "element",
                  "value": "div",
                  "values": {}
                },
                {
                  "children": [
                    {
                      "cascades": false,
                      "name": "text",
                      "path": "text.tpl",
                      "prevent_delete": false,
                      "type": "element",
                      "value": "text",
                      "values": {
                        "Content": "Enter your details below.",
                        "ClassName": "theme.textEnterBelow"
                      }
                    }
                  ],
                  "cascades": false,
                  "name": "div",
                  "path": "div.tpl",
                  "prevent_delete": false,
                  "type": "element",
                  "value": "div",
                  "values": {}
                }
              ],
              "cascades": false,
              "name": "Heading",
              "path": "div.tpl",
              "prevent_delete": false,
              "type": "element",
              "value": "div",
              "values": {
                "class": "theme.headingLogin"
              }
            },
            {
              "children": [
                {
                  "children": [
                    {
                      "cascades": false,
                      "name": "text",
                      "path": "text.tpl",
                      "prevent_delete": false,
                      "type": "element",
                      "value": "text",
                      "values": {
                        "Content": "{loginError}"
                      }
                    }
                  ],
                  "cascades": false,
                  "name": "alertMessage",
                  "path": "alertMessage.tpl",
                  "prevent_delete": false,
                  "type": "element",
                  "value": "alertMessage",
                  "values": {
                    "severity": "error",
                    "variant": "standard",
                    "title": ""
                  }
                }
              ],
              "cascades": false,
              "name": "loginError Message",
              "path": "condition.tpl",
              "prevent_delete": false,
              "type": "element",
              "value": "condition",
              "values": {
                "condition": "loginError"
              }
            },
            {
              "cascades": false,
              "name": "uncontrolledInput",
              "path": "uncontrolledInput.tpl",
              "prevent_delete": false,
              "type": "element",
              "value": "uncontrolledInput",
              "values": {
                "variant": "outlined",
                "label": "Email",
                "placeholder": "Email Address",
                "margin": "normal",
                "onChange": "(e) => { setloginData({ ...loginData, Email: e.target.value }) }",
                "value": "{loginData.Email}"
              }
            },
            {
              "cascades": false,
              "name": "uncontrolledInput",
              "path": "uncontrolledInput.tpl",
              "prevent_delete": false,
              "type": "element",
              "value": "uncontrolledInput",
              "values": {
                "variant": "outlined",
                "label": "Password",
                "margin": "normal",
                "onChange": "(e) => { setloginData({ ...loginData, Password: e.target.value }) }",
                "value": "{loginData.Password}",
                "type": "password"
              }
            },
            {
              "children": [
                {
                  "cascades": false,
                  "name": "checkbox",
                  "path": "checkbox.tpl",
                  "prevent_delete": false,
                  "type": "element",
                  "value": "checkbox",
                  "values": {
                    "Checked": "loginData.RememberMe",
                    "label": "Remember me",
                    "OnClick": "{() => { setloginData({ ...loginData, RememberMe: !loginData.RememberMe }) }}"
                  }
                },
                {
                  "children": [
                    {
                      "cascades": false,
                      "name": "text",
                      "path": "text.tpl",
                      "prevent_delete": false,
                      "type": "element",
                      "value": "text",
                      "values": {
                        "Content": "Forgot password?"
                      }
                    }
                  ],
                  "cascades": false,
                  "name": "simpleLink",
                  "path": "simpleLink.tpl",
                  "prevent_delete": false,
                  "type": "element",
                  "value": "simpleLink",
                  "values": {
                    "tagToUse": "NavLink",
                    "destination": "/forgot"
                  }
                }
              ],
              "cascades": false,
              "name": "div",
              "path": "div.tpl",
              "prevent_delete": false,
              "type": "element",
              "value": "div",
              "values": {
                "class": "theme.flexLine"
              }
            },
            {
              "children": [
                {
                  "cascades": false,
                  "name": "text",
                  "path": "text.tpl",
                  "prevent_delete": false,
                  "type": "element",
                  "value": "text",
                  "values": {
                    "ClassName": "theme.textButtonLogin",
                    "Content": "Login"
                  }
                }
              ],
              "cascades": false,
              "name": "Submit",
              "path": "button.tpl",
              "prevent_delete": false,
              "type": "element",
              "value": "button",
              "values": {
                "ButtonText": "",
                "Variant": "contained",
                "Color": "primary",
                "fullWidth": false,
                "Action": "handleLogin",
                "className": "theme.buttonLogin"
              }
            }
          ],
          "cascades": false,
          "name": "Login Box",
          "path": "div.tpl",
          "prevent_delete": false,
          "type": "element",
          "value": "div",
          "values": {
            "class": "theme.loginBox"
          }
        }
      ],
      "cascades": false,
      "name": "Container",
      "path": "Container.tpl",
      "prevent_delete": false,
      "type": "element",
      "value": "Container",
      "values": {
        "maxWidth": "md",
        "className": "theme.loginPage"
      }
    }
  ],
  "cascades": false,
  "name": "Body",
  "prevent_delete": true,
  "value": "b",
  "values": {
    "className": [
      "theme.loginBody"
    ],
    "primaryColor": "blue"
  }
}

const LoginPage = {
  "name": "Login Page",
  "type": "page",
  "path": "/login",
  "collapseStatus": "collapse",
  "filename": "login.tsx",
  "priority": 5,
  "children": [{
    "children": [],
    "name": "Before Page Render",
    "type": "element",
    "value": "bpr",
    "prevent_delete": true,
    "cascades": false,
    "collapseStatus": "expand",
  }, LoginPagePH, LoginPageB, {
    "name": "Page Footer",
    "type": "element",
    "value": "pf",
    "prevent_delete": true,
    "cascades": false,
    "collapseStatus": "expand",
    "children": [],
  }, {
    "name": "After Page Render",
    "type": "element",
    "value": "apr",
    "prevent_delete": true,
    "cascades": false,
    "collapseStatus": "expand",
    "children": [],
  }]
}

const RegisterPagePH = {
  "path": "ph.tpl",
  "keyPath": "elements/Aptugo Internal Use/ph.tpl",
  "prevent_delete": true,
  "children": [
    {
      "children": [
        {
          "path": "useState.tpl",
          "keyPath": "elements/Programming/useState.tpl",
          "type": "element",
          "children": [],
          "name": "usersData",
          "prevent_delete": false,
          "cascades": false,
          "value": "useState",
          "values": {
            "variableName": "usersData",
            "defaultValue": "{\nerrField: null,\nerrMessage: null\n}"
          }
        },
        {
          "cascades": false,
          "name": "Register Error",
          "path": "useState.tpl",
          "prevent_delete": false,
          "type": "element",
          "value": "useState",
          "values": {
            "variableName": "registerError",
            "defaultValue": "null"
          },
          "children": []
        },
        {
          "children": [
            {
              "path": "register.tpl",
              "keyPath": "elements/Programming/Snippets/register.tpl",
              "type": "element",
              "children": [],
              "name": "register",
              "prevent_delete": false,
              "cascades": false,
              "value": "register",
              "values": {
                "OnSuccess": Parameters.mainPageID,
                "Data": "data"
              }
            }
          ],
          "cascades": false,
          "name": "handleRegister",
          "path": "function.tpl",
          "prevent_delete": false,
          "type": "element",
          "value": "function",
          "values": {
            "functionName": "handleRegister",
            "functionBody": "const data = { ...Usersdata, Role: 'User' }"
          }
        }
      ],
      "cascades": false,
      "name": "Register Functionality",
      "path": "dummyEncloser.tpl",
      "prevent_delete": false,
      "type": "element",
      "value": "dummyEncloser"
    }
  ],
  "cascades": false,
  "name": "Page Header",
  "type": "element",
  "value": "ph"
}

const RegisterPageB = {
  "path": "b.tpl",
  "keyPath": "elements/Aptugo Internal Use/b.tpl",
  "type": "element",
  "internalUse": true,
  "children": [
    {
      "children": [
        {
          "children": [
            {
              "cascades": false,
              "name": "text",
              "path": "text.tpl",
              "prevent_delete": false,
              "type": "element",
              "value": "text",
              "values": {
                "Content": "Have an account? ",
                "ClassName": "theme.right"
              }
            },
            {
              "children": [
                {
                  "cascades": false,
                  "name": "text",
                  "path": "text.tpl",
                  "prevent_delete": false,
                  "type": "element",
                  "value": "text",
                  "values": {
                    "Content": " Login!",
                    "ClassName": "theme.textRegister"
                  }
                }
              ],
              "cascades": false,
              "name": "simpleLink",
              "path": "simpleLink.tpl",
              "prevent_delete": false,
              "type": "element",
              "value": "simpleLink",
              "values": {
                "tagToUse": "A",
                "destination": "/login",
                "fromLink": "T0EszUz8"
              }
            }
          ],
          "cascades": false,
          "name": "Login Area",
          "path": "div.tpl",
          "prevent_delete": false,
          "type": "element",
          "value": "div",
          "values": {
            "class": "theme.containerLogin"
          }
        },
        {
          "children": [
            {
              "children": [
                {
                  "children": [
                    {
                      "cascades": false,
                      "name": "text",
                      "path": "text.tpl",
                      "prevent_delete": false,
                      "type": "element",
                      "value": "text",
                      "values": {
                        "Content": "Register",
                        "ClassName": "theme.textSignIn"
                      }
                    }
                  ],
                  "cascades": false,
                  "name": "div",
                  "path": "div.tpl",
                  "prevent_delete": false,
                  "type": "element",
                  "value": "div",
                  "values": {}
                },
                {
                  "children": [
                    {
                      "cascades": false,
                      "name": "text",
                      "path": "text.tpl",
                      "prevent_delete": false,
                      "type": "element",
                      "value": "text",
                      "values": {
                        "Content": "Enter your details below.",
                        "ClassName": "theme.textEnterBelow"
                      }
                    }
                  ],
                  "cascades": false,
                  "name": "div",
                  "path": "div.tpl",
                  "prevent_delete": false,
                  "type": "element",
                  "value": "div",
                  "values": {}
                }
              ],
              "cascades": false,
              "name": "Heading",
              "path": "div.tpl",
              "prevent_delete": false,
              "type": "element",
              "value": "div",
              "values": {
                "class": "theme.headingLogin"
              }
            },
            {
              "children": [
                {
                  "children": [
                    {
                      "cascades": false,
                      "name": "text",
                      "path": "text.tpl",
                      "prevent_delete": false,
                      "type": "element",
                      "value": "text",
                      "values": {
                        "Content": "{registerError}"
                      }
                    }
                  ],
                  "cascades": false,
                  "name": "alertMessage",
                  "path": "alertMessage.tpl",
                  "prevent_delete": false,
                  "type": "element",
                  "value": "alertMessage",
                  "values": {
                    "severity": "error",
                    "variant": "standard",
                    "title": ""
                  }
                }
              ],
              "cascades": false,
              "name": "registerError Message",
              "path": "condition.tpl",
              "prevent_delete": false,
              "type": "element",
              "value": "condition",
              "values": {
                "condition": "registerError"
              }
            },...userTable.fields.filter(field => field.column_name !== 'Role').map(field => { return { type: 'element', cascades: false, name: field.column_name, children: [], value: 'field', values: { Field: field.unique_id, Type: 'edit', margin: 'normal', variant: 'outlined' }} }),
            {
              "cascades": false,
              "name": "Submit",
              "path": "button.tpl",
              "prevent_delete": false,
              "type": "element",
              "value": "button",
              "values": {
                "ButtonText": "Register",
                "Variant": "contained",
                "Color": "primary",
                "fullWidth": false,
                "Action": "handleRegister",
                "className": "theme.buttonLogin"
              }
            }
          ],
          "cascades": false,
          "name": "Register Box",
          "path": "div.tpl",
          "prevent_delete": false,
          "type": "element",
          "value": "div",
          "values": {
            "class": "theme.loginBox"
          }
        }
      ],
      "cascades": false,
      "name": "Container",
      "path": "Container.tpl",
      "prevent_delete": false,
      "type": "element",
      "value": "Container",
      "values": {
        "maxWidth": "md",
        "className": "theme.loginPage"
      }
    }
  ],
  "cascades": false,
  "name": "Body",
  "prevent_delete": true,
  "value": "b",
  "values": {
    "className": [
      "theme.registerBody"
    ],
    "primaryColor": "blue"
  }
}

const RegisterPage = {
  "name": "Register",
  "type": "page",
  "path": "/register",
  "filename": "register.tsx",
  "collapseStatus": "collapse",
  "children": [{
    "children": [],
    "name": "Before Page Render",
    "type": "element",
    "value": "bpr",
    "prevent_delete": true,
    "cascades": false,
    "collapseStatus": "expand",
  }, RegisterPagePH, RegisterPageB, {
    "name": "Page Footer",
    "type": "element",
    "value": "pf",
    "prevent_delete": true,
    "cascades": false,
    "collapseStatus": "expand",
    "children": [],
  }, {
    "name": "After Page Render",
    "type": "element",
    "value": "apr",
    "prevent_delete": true,
    "cascades": false,
    "collapseStatus": "collapse",
    "children": [],
  }]
}

const ForgotPage = {
	"name": "Retrieve Password",
	"type": "page",
	"path": "/forgot/:nonce?/:email?",
	"filename": "forgot.tsx",
	"collapseStatus": "collapse",
	"priority": 5,
	"children": [{
		"children": [{
			"name": "code",
			"prevent_delete": false,
			"cascades": false,
			"type": "element",
			"value": "code",
			"collapseStatus": "expand",
			"values": {
				"code": "import AuthService from '../services/auth.service'\nimport authHeaders from '../services/auth-header'\n"
			},
			"children": [],
		}, {
			"children": [{
				"children": [{
					"children": [{
						"children": [{
							"name": "text",
							"prevent_delete": false,
							"cascades": false,
							"type": "element",
							"value": "text",
							"collapseStatus": "expand",
							"values": {
								"Content": "Password reset?"
							},
							"children": [],
						}],
						"name": "typography",
						"prevent_delete": false,
						"cascades": false,
						"type": "element",
						"value": "typography",
						"collapseStatus": "expand",
						"values": {
							"tag": "h2"
						},
					}, {
						"name": "text",
						"prevent_delete": false,
						"cascades": false,
						"type": "element",
						"value": "text",
						"collapseStatus": "expand",
						"values": {
							"Content": "If you requested a password reset, use the link below to complete the process. If you didn't make this request, ignore this email.\n"
						},
						"children": [],
					}, {
						"children": [{
							"children": [{
								"name": "text",
								"prevent_delete": false,
								"cascades": false,
								"type": "element",
								"value": "text",
								"collapseStatus": "expand",
								"values": {
									"Content": "Click here to reset your password"
								},
								"children": [],
							}],
							"name": "simpleLink",
							"prevent_delete": false,
							"cascades": false,
							"type": "element",
							"value": "simpleLink",
							"collapseStatus": "expand",
							"values": {
								"tagToUse": "A",
								"destination": "/forgot/**nonce**/**email**"
							},
						}],
						"name": "div",
						"prevent_delete": false,
						"cascades": false,
						"type": "element",
						"value": "div",
						"collapseStatus": "expand",
					}],
					"name": "div",
					"prevent_delete": false,
					"cascades": false,
					"type": "element",
					"value": "div",
					"collapseStatus": "expand",
				}],
				"name": "Email Content",
				"type": "element",
				"value": "emailContent",
				"prevent_delete": false,
				"cascades": false,
				"collapseStatus": "expand",
			}],
			"name": "email",
			"prevent_delete": false,
			"cascades": false,
			"type": "element",
			"value": "email",
			"collapseStatus": "collapse",
			"values": {
				"smpthost": "",
				"smptport": "",
				"smptuser": "",
				"smptpass": "",
				"subject": "'Recover Password'",
				"functionName": "recoverPasswordFormat"
			},
		}],
		"name": "Before Page Render",
		"type": "element",
		"value": "bpr",
		"prevent_delete": true,
		"cascades": false,
		"collapseStatus": "expand",
	}, {
		"children": [{
			"children": [{
				"name": "userEmail",
				"prevent_delete": false,
				"cascades": false,
				"type": "element",
				"value": "useState",
				"collapseStatus": "expand",
				"values": {
					"variableName": "userEmail",
					"defaultValue": "''"
				},
				"children": [],
			}, {
				"name": "recoverError",
				"prevent_delete": false,
				"cascades": false,
				"type": "element",
				"value": "useState",
				"collapseStatus": "expand",
				"values": {
					"variableName": "recoverError",
					"defaultValue": "null"
				},
				"children": [],
			}, {
				"name": "recoverSuccess",
				"prevent_delete": false,
				"cascades": false,
				"type": "element",
				"value": "useState",
				"collapseStatus": "expand",
				"values": {
					"variableName": "recoverSuccess",
					"defaultValue": "null"
				},
				"children": [],
			}, {
				"name": "sendNonce",
				"prevent_delete": false,
				"cascades": false,
				"type": "element",
				"value": "function",
				"collapseStatus": "expand",
				"values": {
					"functionName": "sendNonce",
					"functionBody": "setrecoverSuccess(null)\n    setrecoverError(null)\n    AuthService.recoverPassword({ email: userEmail, subject: 'Password recovery', message: InlineLink(), name: 'pedro corica' }).then(\n      (res) => {\n        setrecoverSuccess(`Email sent to ${userEmail}`)\n      },\n      (error) => {\n        setrecoverError(error.response.data.message)\n      }\n    )"
				},
				"children": [],
			}],
			"name": "First Enter (without nonce)",
			"prevent_delete": false,
			"cascades": false,
			"type": "element",
			"value": "dummyEncloser",
			"collapseStatus": "expand",
		}, {
			"children": [{
				"name": "userData",
				"prevent_delete": false,
				"cascades": false,
				"type": "element",
				"value": "useState",
				"collapseStatus": "expand",
				"values": {
					"variableName": "userData",
					"defaultValue": "{ _id: null, Password: '' }"
				},
				"children": [],
			}, {
				"children": [{
					"name": "saveToRedux",
					"prevent_delete": false,
					"cascades": false,
					"type": "element",
					"value": "saveToRedux",
					"collapseStatus": "expand",
					"values": {
						"data": Parameters.table_unique_id
					},
					"children": [],
				}],
				"name": "saveNewPassword",
				"prevent_delete": false,
				"cascades": false,
				"type": "element",
				"value": "function",
				"collapseStatus": "expand",
				"values": {
					"functionName": "saveNewPassword",
					"functionBody": "const data = { ...userData }"
				},
			}, {
				"children": [{
					"name": "code",
					"prevent_delete": false,
					"cascades": false,
					"type": "element",
					"value": "code",
					"collapseStatus": "expand",
					"values": {
						"code": "if (props.match.params.nonce) {\n      AuthService.checkNonce(props.match.params.nonce, props.match.params.email).then(\n        (res) => {\n          authHeaders()\n          setuserData({ ...userData, _id: res })\n        },\n        (error) => {\n          console.error(error)\n        }\n      )\n    }"
					},
					"children": [],
				}],
				"name": "watchVariable",
				"prevent_delete": false,
				"cascades": false,
				"type": "element",
				"value": "watchVariable",
				"collapseStatus": "expand",
				"values": {
					"watchVariable": "props.match.params.nonce"
				},
			}],
			"name": "From Link (with nonce)",
			"prevent_delete": false,
			"cascades": false,
			"type": "element",
			"value": "dummyEncloser",
			"collapseStatus": "expand",
		}],
		"name": "Page Header",
		"type": "element",
		"value": "ph",
		"prevent_delete": true,
		"cascades": false,
		"values": {
			"localStyles": "mainPanel: {     [\"@media (min-width:960px)\"]: {       backgroundColor: \"#56baec\",       width: \"100%\",       flexGrow: 1,     },   },   loginHolder: { margin: \"5rem auto 0\", width: \"30vw\", textAlign: \"center\" },   loginArea: {     position: \"relative\",     background: \"white\",     padding: \"4rem 3rem 2rem\",     borderRadius: \"0.5rem\",     marginBottom: \"1rem\",     boxSizing: \"border-box\",     boxShadow: \"0px 3px 20px 5px #00000030\",   },   loginTitle: {     textTransform: \"uppercase\",     fontSize: \"1.2rem\",     letterSpacing: \"0.1rem\",     color: \"#3084af\",   },   image: {     width: \"5rem\",     position: \"absolute\",     top: \"-2.5rem\",     left: \"calc(15vw - (2.5rem + 2.5px))\",     border: \"5px solid white\",     borderRadius: \"5rem\",   },"
		},
		"collapseStatus": "expand",
	}, {
		"children": [{
			"children": [{
				"children": [{
					"children": [{
						"children": [{
							"name": "text",
							"prevent_delete": false,
							"cascades": false,
							"type": "element",
							"value": "text",
							"collapseStatus": "expand",
							"values": {
								"Content": "Forgot your password?"
							},
							"children": [],
						}],
						"name": "typography",
						"prevent_delete": false,
						"cascades": false,
						"type": "element",
						"value": "typography",
						"collapseStatus": "expand",
						"values": {
							"tag": "h3"
						},
					}, {
						"children": [{
							"name": "text",
							"prevent_delete": false,
							"cascades": false,
							"type": "element",
							"value": "text",
							"collapseStatus": "expand",
							"values": {
								"Content": "Please enter the email address associated with your account and we will email you a link to reset your password"
							},
							"children": [],
						}],
						"name": "typography",
						"prevent_delete": false,
						"cascades": false,
						"type": "element",
						"value": "typography",
						"collapseStatus": "expand",
						"values": {
							"tag": "body1"
						},
					}, {
						"children": [{
							"children": [{
								"name": "text",
								"prevent_delete": false,
								"cascades": false,
								"type": "element",
								"value": "text",
								"collapseStatus": "expand",
								"values": {
									"Content": "{recoverSuccess}"
								},
								"children": [],
							}],
							"name": "alertMessage",
							"prevent_delete": false,
							"cascades": false,
							"type": "element",
							"value": "alertMessage",
							"collapseStatus": "expand",
							"values": {
								"variant": "standard",
								"severity": "success"
							},
						}],
						"name": "Recover Success!",
						"prevent_delete": false,
						"cascades": false,
						"type": "element",
						"value": "condition",
						"collapseStatus": "expand",
						"values": {
							"condition": "recoverSuccess"
						},
					}, {
						"children": [{
							"children": [{
								"name": "text",
								"prevent_delete": false,
								"cascades": false,
								"type": "element",
								"value": "text",
								"collapseStatus": "expand",
								"values": {
									"Content": "{recoverError}"
								},
								"children": [],
							}],
							"name": "alertMessage",
							"prevent_delete": false,
							"cascades": false,
							"type": "element",
							"value": "alertMessage",
							"collapseStatus": "expand",
							"values": {
								"severity": "error"
							},
						}],
						"name": "Recover Error!",
						"prevent_delete": false,
						"cascades": false,
						"type": "element",
						"value": "condition",
						"collapseStatus": "collapse",
						"values": {
							"condition": "recoverError"
						},
					}, {
						"name": "uncontrolledInput",
						"prevent_delete": false,
						"cascades": false,
						"type": "element",
						"value": "uncontrolledInput",
						"collapseStatus": "expand",
						"values": {
							"variant": "outlined",
							"margin": "normal",
							"type": "text",
							"label": "Email address",
							"onChange": "(e) => { setuserEmail(e.target.value) }",
							"value": "{userEmail}"
						},
						"children": [],
					}, {
						"name": "button",
						"prevent_delete": false,
						"cascades": false,
						"type": "element",
						"value": "button",
						"collapseStatus": "expand",
						"values": {
							"Variant": "contained",
							"Color": "primary",
							"ButtonText": "Reset Password",
							"fullWidth": false,
							"Action": "sendNonce"
						},
						"children": [],
					}, {
						"children": [{
							"name": "text",
							"prevent_delete": false,
							"cascades": false,
							"type": "element",
							"value": "text",
							"values": {
								"Content": "Go back to&nbsp;"
							},
							"collapseStatus": "expand",
							"children": [],
						}, {
							"name": "Link",
							"prevent_delete": false,
							"cascades": false,
							"type": "element",
							"value": "Link",
							"values": {
								"innerText": " Login",
								"destination": "/Login"
							},
							"collapseStatus": "expand",
							"children": [],
						}],
						"name": "div",
						"prevent_delete": false,
						"cascades": false,
						"type": "element",
						"value": "div",
						"collapseStatus": "expand",
					}],
					"name": "div",
					"prevent_delete": false,
					"cascades": false,
					"type": "element",
					"value": "div",
					"collapseStatus": "expand",
					"values": {
						"class": "theme.regulatedWidth"
					},
				}],
				"name": "Without Nonce",
				"prevent_delete": false,
				"cascades": false,
				"type": "element",
				"value": "condition",
				"collapseStatus": "expand",
				"values": {
					"condition": "!props.match.params.nonce"
				},
			}, {
				"children": [{
					"children": [{
						"children": [{
							"name": "text",
							"prevent_delete": false,
							"cascades": false,
							"type": "element",
							"value": "text",
							"collapseStatus": "expand",
							"values": {
								"Content": "Reset your Password"
							},
							"children": [],
						}],
						"name": "typography",
						"prevent_delete": false,
						"cascades": false,
						"type": "element",
						"value": "typography",
						"collapseStatus": "expand",
						"values": {
							"tag": "h3"
						},
					}, {
						"children": [{
							"name": "text",
							"prevent_delete": false,
							"cascades": false,
							"type": "element",
							"value": "text",
							"collapseStatus": "expand",
							"values": {
								"Content": "Set your new password in the field below"
							},
							"children": [],
						}],
						"name": "typography",
						"prevent_delete": false,
						"cascades": false,
						"type": "element",
						"value": "typography",
						"collapseStatus": "expand",
						"values": {
							"tag": "body1"
						},
					}, {
						"name": "uncontrolledInput",
						"prevent_delete": false,
						"cascades": false,
						"type": "element",
						"value": "uncontrolledInput",
						"collapseStatus": "expand",
						"values": {
							"label": "New Password",
							"variant": "outlined",
							"margin": "normal",
							"type": "password",
							"onChange": "(e) => { setuserData({ ...userData, Password: e.target.value}) }",
							"value": "{userData.Password}"
						},
						"children": [],
					}, {
						"name": "button",
						"prevent_delete": false,
						"cascades": false,
						"type": "element",
						"value": "button",
						"collapseStatus": "expand",
						"values": {
							"Variant": "contained",
							"Color": "primary",
							"fullWidth": false,
							"ButtonText": "Reset Password!",
							"Action": "saveNewPassword"
						},
						"children": [],
					}],
					"name": "div",
					"prevent_delete": false,
					"cascades": false,
					"type": "element",
					"value": "div",
					"collapseStatus": "expand",
					"values": {
						"class": "theme.regulatedWidth"
					},
				}],
				"name": "With Nonce",
				"prevent_delete": false,
				"cascades": false,
				"type": "element",
				"value": "condition",
				"collapseStatus": "expand",
				"values": {
					"condition": "props.match.params.nonce"
				},
			}],
			"name": "Container",
			"prevent_delete": false,
			"cascades": false,
			"type": "element",
			"value": "Container",
			"collapseStatus": "expand",
			"values": {
				"className": "theme.loginPage",
				"maxWidth": "md"
			},
		}],
		"name": "Body",
		"type": "element",
		"value": "b",
		"prevent_delete": true,
		"cascades": false,
		"collapseStatus": "expand",
		"values": {
			"primaryColor": "blue",
			"className": ["theme.retrieveBody"]
		},
	}, {
		"name": "Page Footer",
		"type": "element",
		"value": "pf",
		"prevent_delete": true,
		"cascades": false,
		"collapseStatus": "expand",
		"children": [],
	}, {
		"name": "After Page Render",
		"type": "element",
		"value": "apr",
		"prevent_delete": true,
		"cascades": false,
		"collapseStatus": "collapse",
		"children": [],
	}]
}

const allPages = Application.pages[0].children.filter(child => child.type === 'page').map(page => {
  return {...page, parent: dmz.unique_id }
})
dmz.children.push(LoginPage, RegisterPage, ForgotPage, ...allPages)




Application.pages[0].children = [...Application.pages[0].children.slice(0,5), dmz]
console.log(Application.pages)

return Application