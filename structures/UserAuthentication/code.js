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

const LoginPage = {
  "name": "Login Page",
  "type": "page",
  "path": "/login",
  "collapseStatus": "collapse",
  "filename": "login.tsx",
  "priority": 5,
  "children": [{
    "children": [{
      "name": "AuthService",
      "prevent_delete": false,
      "cascades": false,
      "type": "element",
      "value": "import",
      "collapseStatus": "expand",
      "values": {
        "moduleName": "AuthService",
        "modulePath": "../services/auth.service"
      },
      "children": [],
    }, {
      "name": "React-Google-Login",
      "prevent_delete": false,
      "cascades": false,
      "type": "element",
      "value": "import",
      "collapseStatus": "expand",
      "values": {
        "moduleName": "{ useGoogleLogin }",
        "modulePath": "react-google-login"
      },
      "children": [],
    }],
    "name": "Before Page Render",
    "type": "element",
    "value": "bpr",
    "prevent_delete": true,
    "cascades": false,
    "collapseStatus": "expand",
  }, {
    "children": [{
			"name": "Login Functionality",
      "prevent_delete": false,
      "cascades": false,
      "type": "element",
      "value": "dummyEncloser",
      "collapseStatus": "expand",
      "children": [{
        "name": "Login Data",
        "prevent_delete": false,
        "cascades": false,
        "type": "element",
        "value": "useState",
        "collapseStatus": "expand",
        "values": {
          "variableName": "loginData",
          "defaultValue": "{\n  Email: '',\n  Password: '',\n  RememberMe: false\n}"
        },
        "children": [],
      }, {
        "name": "Login Error",
        "prevent_delete": false,
        "cascades": false,
        "type": "element",
        "value": "useState",
        "collapseStatus": "expand",
        "values": {
          "variableName": "loginError",
          "defaultValue": "null"
        },
        "children": [],
      }, {
        "name": "onGoogleSuccess",
        "prevent_delete": false,
        "cascades": false,
        "type": "element",
        "value": "function",
        "collapseStatus": "expand",
        "values": {
          "functionName": "onGoogleSuccess",
          "functionParameters": "res",
          "functionBody": "console.log('Login Success: Current User: ', res.profileObj)"
        },
        "children": [],
      }, {
        "name": "onGoogleFailure",
        "prevent_delete": false,
        "cascades": false,
        "type": "element",
        "value": "function",
        "collapseStatus": "expand",
        "values": {
          "functionName": "onGoogleFailure",
          "functionParameters": "res",
          "functionBody": "console.log('Login Failed: res: ', res)\n    if (res.error === 'popup_closed_by_user') {\n      setloginError('You must complete the login process in order to login.')\n    }"
        },
        "children": [],
      }, {
        "name": "googleSignIn",
        "prevent_delete": false,
        "cascades": false,
        "type": "element",
        "value": "code",
        "collapseStatus": "expand",
        "values": {
          "code": "const { signIn: googleSignIn } = useGoogleLogin({\n    onSuccess: onGoogleSuccess,\n    onFailure: onGoogleFailure,\n    clientId: '185605994716-97itv5an2ligdaq8b4r3l4r8h95rlip6.apps.googleusercontent.com',\n    isSignedIn: false,\n    accessType: 'offline'\n  })"
        },
        "children": [],
      }, {
        "name": "handleLogin",
        "prevent_delete": false,
        "cascades": false,
        "type": "element",
        "value": "function",
        "collapseStatus": "expand",
        "values": {
          "functionName": "handleLogin",
          "functionBody": "AuthService.login(loginData.Email, loginData.Password).then(\n      (res) => {\n        console.log(res)\n        props.history.push('/admin')\n      },\n      (error) => {\n        setloginError(error.response.data.message)\n      }\n    )"
        },
        "children": [],
      }]
    }],
    "name": "Page Header",
    "type": "element",
    "value": "ph",
    "prevent_delete": true,
    "cascades": false,
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
                "Content": "Welcome back"
              },
              "children": [],
            }],
            "name": "Paper",
            "prevent_delete": false,
            "cascades": false,
            "type": "element",
            "value": "Paper",
            "collapseStatus": "expand",
            "values": {
              "elevation": "5",
              "variant": "elevation",
              "className": "theme.paperLeft"
            },
          }],
          "name": "Left Welcome",
          "prevent_delete": false,
          "cascades": false,
          "type": "element",
          "value": "grid",
          "collapseStatus": "collapse",
          "values": {
            "midcolumns": "3",
            "align": "stretch"
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
                "Content": "Don't have an account? "
              },
              "children": [],
            }, {
              "children": [{
                "name": "text",
                "prevent_delete": false,
                "cascades": false,
                "type": "element",
                "value": "text",
                "collapseStatus": "expand",
                "values": {
                  "Content": " Register!"
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
                "destination": "/Register",
                "className": "theme.greenText"
              },
            }],
            "name": "Register Area",
            "prevent_delete": false,
            "cascades": false,
            "type": "element",
            "value": "div",
            "collapseStatus": "collapse",
            "values": {
              "class": "theme.right"
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
                    "Content": "Sign in to Aptugo"
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
                    "Content": "Enter your details below."
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
              }],
              "name": "Heading",
              "prevent_delete": false,
              "cascades": false,
              "type": "element",
              "value": "div",
              "collapseStatus": "collapse",
            }, {
              "children": [{
                "children": [{
                  "name": "MaterialIcon",
                  "prevent_delete": false,
                  "cascades": false,
                  "type": "element",
                  "value": "MaterialIcon",
                  "collapseStatus": "expand",
                  "values": {
                    "icon": "Google",
                    "color": "default"
                  },
                  "children": [],
                }],
                "name": "button",
                "prevent_delete": false,
                "cascades": false,
                "type": "element",
                "value": "button",
                "collapseStatus": "expand",
                "values": {
                  "ButtonText": "",
                  "Variant": "outlined",
                  "className": "theme.google",
                  "Action": "googleSignIn",
                  "fullWidth": true
                },
              }, {
                "children": [{
                  "name": "MaterialIcon",
                  "prevent_delete": false,
                  "cascades": false,
                  "type": "element",
                  "value": "MaterialIcon",
                  "collapseStatus": "expand",
                  "values": {
                    "icon": "Facebook"
                  },
                  "children": [],
                }],
                "name": "button",
                "prevent_delete": false,
                "cascades": false,
                "type": "element",
                "value": "button",
                "collapseStatus": "expand",
                "values": {
                  "Action": "googleSignIn",
                  "className": "theme.facebook",
                  "Variant": "outlined",
                  "fullWidth": true
                },
              }, {
                "children": [{
                  "name": "MaterialIcon",
                  "prevent_delete": false,
                  "cascades": false,
                  "type": "element",
                  "value": "MaterialIcon",
                  "collapseStatus": "expand",
                  "values": {
                    "icon": "Twitter"
                  },
                  "children": [],
                }],
                "name": "button",
                "prevent_delete": false,
                "cascades": false,
                "type": "element",
                "value": "button",
                "collapseStatus": "expand",
                "values": {
                  "Action": "googleSignIn",
                  "ButtonText": "",
                  "className": "theme.twitter",
                  "fullWidth": true,
                  "Variant": "outlined"
                },
              }],
              "name": "div",
              "prevent_delete": false,
              "cascades": false,
              "type": "element",
              "value": "div",
              "collapseStatus": "expand",
              "values": {
                "class": "theme.externalSignIn"
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
                  "Content": "or"
                },
                "children": [],
              }],
              "name": "Separator Line",
              "prevent_delete": false,
              "cascades": false,
              "type": "element",
              "value": "div",
              "collapseStatus": "expand",
              "values": {
                "class": "theme.separatorLine"
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
                    "Content": "{loginError}"
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
                  "severity": "error",
                  "variant": "standard",
                  "title": ""
                },
              }],
              "name": "loginError Message",
              "prevent_delete": false,
              "cascades": false,
              "type": "element",
              "value": "condition",
              "collapseStatus": "expand",
              "values": {
                "condition": "loginError"
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
                "label": "Email",
                "placeholder": "Email Address",
                "margin": "normal",
                "onChange": "(e) => { setloginData({ ...loginData, Email: e.target.value }) }",
                "value": "{loginData.Email}"
              },
              "children": [],
            }, {
              "name": "uncontrolledInput",
              "prevent_delete": false,
              "cascades": false,
              "type": "element",
              "value": "uncontrolledInput",
              "collapseStatus": "expand",
              "values": {
                "variant": "outlined",
                "label": "Password",
                "margin": "normal",
                "onChange": "(e) => { setloginData({ ...loginData, Password: e.target.value }) }",
                "value": "{loginData.Password}",
                "type": "password"
              },
              "children": [],
            }, {
              "children": [{
                "name": "checkbox",
                "prevent_delete": false,
                "cascades": false,
                "type": "element",
                "value": "checkbox",
                "collapseStatus": "expand",
                "values": {
                  "Checked": "loginData.RememberMe",
                  "label": "Remember me",
                  "OnClick": "{() => { setloginData({ ...loginData, RememberMe: !loginData.RememberMe }) }}"
                },
                "children": [],
              }, {
                "children": [{
                  "name": "text",
                  "prevent_delete": false,
                  "cascades": false,
                  "type": "element",
                  "value": "text",
                  "collapseStatus": "expand",
                  "values": {
                    "Content": "Forgot password?",
                    "ClassName": "theme.greenText"
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
                  "tagToUse": "NavLink",
                  "destination": "/forgot"
                },
              }],
              "name": "div",
              "prevent_delete": false,
              "cascades": false,
              "type": "element",
              "value": "div",
              "collapseStatus": "expand",
              "values": {
                "class": "theme.flexLine"
              },
            }, {
              "name": "Submit",
              "prevent_delete": false,
              "cascades": false,
              "type": "element",
              "value": "button",
              "collapseStatus": "expand",
              "values": {
                "ButtonText": "Login",
                "Variant": "contained",
                "Color": "primary",
                "fullWidth": true,
                "Action": "handleLogin"
              },
              "children": [],
            }],
            "name": "Login Box",
            "prevent_delete": false,
            "cascades": false,
            "type": "element",
            "value": "div",
            "collapseStatus": "expand",
            "values": {
              "class": "theme.loginBox"
            },
          }],
          "name": "Main Area",
          "prevent_delete": false,
          "cascades": false,
          "type": "element",
          "value": "grid",
          "collapseStatus": "expand",
          "values": {
            "midcolumns": "9"
          },
        }],
        "name": "grid",
        "prevent_delete": false,
        "cascades": false,
        "type": "element",
        "value": "grid",
        "collapseStatus": "expand",
        "values": {
          "container": true,
          "align": "stretch"
        },
      }],
      "name": "Container",
      "prevent_delete": false,
      "cascades": false,
      "type": "element",
      "value": "Container",
      "collapseStatus": "expand",
      "values": {
        "maxWidth": "false",
        "className": "theme.loginPage"
      },
    }],
    "name": "Body",
    "type": "element",
    "value": "b",
    "prevent_delete": true,
    "cascades": false,
    "collapseStatus": "expand",
    "values": {
      "className": ["theme.pages"],
      "primaryColor": "green"
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
    "collapseStatus": "expand",
    "children": [],
  }]
}

const RegisterPage = {
  "name": "Register",
  "type": "page",
  "path": "/register",
  "filename": "register.tsx",
  "collapseStatus": "collapse",
  "children": [{
    "children": [{
      "name": "code",
      "prevent_delete": false,
      "cascades": false,
      "type": "element",
      "value": "code",
      "collapseStatus": "expand",
      "values": {
        "code": "import { addUsers } from '../store/actions/usersActions'"
      },
      "children": [],
    }, {
      "name": "React-Google-Login",
      "prevent_delete": false,
      "cascades": false,
      "type": "element",
      "value": "import",
      "collapseStatus": "expand",
      "values": {
        "moduleName": "{ useGoogleLogin }",
        "modulePath": "react-google-login"
      },
      "children": [],
    }, {
      "name": "AuthService",
      "prevent_delete": false,
      "cascades": false,
      "type": "element",
      "value": "import",
      "collapseStatus": "expand",
      "values": {
        "moduleName": "AuthService",
        "modulePath": "../services/auth.service"
      },
      "children": [],
    }, {
      "name": "IState",
      "prevent_delete": false,
      "cascades": false,
      "type": "element",
      "value": "import",
      "collapseStatus": "expand",
      "values": {
        "moduleName": "{ IState }",
        "modulePath": "../store/reducers/index"
      },
      "children": [],
    }, {
      "name": "UseSelector",
      "prevent_delete": false,
      "cascades": false,
      "type": "element",
      "value": "import",
      "collapseStatus": "expand",
      "values": {
        "moduleName": "{ useSelector }",
        "modulePath": "react-redux"
      },
      "children": [],
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
        "name": "Define usersData",
        "prevent_delete": false,
        "cascades": false,
        "type": "element",
        "value": "defineVariable",
        "collapseStatus": "expand",
        "values": {
          "variableName": "usersData",
          "variableValue": "useSelector((state: IState) => state.users)"
        },
        "children": [],
      },{
        "name": "Register Error",
        "prevent_delete": false,
        "cascades": false,
        "type": "element",
        "value": "useState",
        "collapseStatus": "expand",
        "values": {
          "variableName": "registerError",
          "defaultValue": "null"
        },
        "children": [],
      }, {
        "name": "onGoogleSuccess",
        "prevent_delete": false,
        "cascades": false,
        "type": "element",
        "value": "function",
        "collapseStatus": "expand",
        "values": {
          "functionName": "onGoogleSuccess",
          "functionParameters": "res",
          "functionBody": "console.log('Login Success: Current User: ', res.profileObj)"
        },
        "children": [],
      }, {
        "name": "onGoogleFailure",
        "prevent_delete": false,
        "cascades": false,
        "type": "element",
        "value": "function",
        "collapseStatus": "expand",
        "values": {
          "functionName": "onGoogleFailure",
          "functionParameters": "res",
          "functionBody": "console.log('Login Failed: res: ', res)\n    if (res.error === 'popup_closed_by_user') {\n      setregisterError('You must complete the login process in order to login.')\n    }"
        },
        "children": [],
      }, {
        "name": "googleSignIn",
        "prevent_delete": false,
        "cascades": false,
        "type": "element",
        "value": "code",
        "collapseStatus": "expand",
        "values": {
          "code": "const { signIn: googleSignIn } = useGoogleLogin({\n    onSuccess: onGoogleSuccess,\n    onFailure: onGoogleFailure,\n    clientId: '185605994716-97itv5an2ligdaq8b4r3l4r8h95rlip6.apps.googleusercontent.com',\n    isSignedIn: false,\n    accessType: 'offline'\n  })"
        },
        "children": [],
      }, {
        "name": "handleRegister",
        "prevent_delete": false,
        "cascades": false,
        "type": "element",
        "value": "function",
        "collapseStatus": "expand",
        "values": {
          "functionName": "handleRegister",
          "functionBody": "const data = { ...Usersdata }"
        },
        "children": [{
          "name": "saveToRedux",
          "prevent_delete": false,
          "cascades": false,
          "children": [],
          "type": "element",
          "value": "saveToRedux",
          "collapseStatus": "expand",
          "values": {
            "data": Parameters.table_unique_id
          },
        }],
      }],
      "name": "Register Functionality",
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
                "Content": "Welcome back"
              },
              "children": [],
            }],
            "name": "Paper",
            "prevent_delete": false,
            "cascades": false,
            "type": "element",
            "value": "Paper",
            "collapseStatus": "expand",
            "values": {
              "elevation": "5",
              "variant": "elevation",
              "className": "theme.paperLeft"
            },
          }],
          "name": "Left Welcome",
          "prevent_delete": false,
          "cascades": false,
          "type": "element",
          "value": "grid",
          "collapseStatus": "collapse",
          "values": {
            "midcolumns": "3",
            "align": "stretch"
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
                "Content": "Have an account? "
              },
              "children": [],
            }, {
              "children": [{
                "name": "text",
                "prevent_delete": false,
                "cascades": false,
                "type": "element",
                "value": "text",
                "collapseStatus": "expand",
                "values": {
                  "Content": " Login!"
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
                "destination": "/Login",
                "className": "theme.greenText"
              },
            }],
            "name": "Login Area",
            "prevent_delete": false,
            "cascades": false,
            "type": "element",
            "value": "div",
            "collapseStatus": "collapse",
            "values": {
              "class": "theme.right"
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
                    "Content": "Register in to Aptugo"
                  },
                  "children": [],
                }],
                "name": "typography",
                "prevent_delete": false,
                "cascades": false,
                "type": "element",
                "value": "typography",
                "collapseStatus": "collapse",
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
                    "Content": "Enter your details below."
                  },
                  "children": [],
                }],
                "name": "typography",
                "prevent_delete": false,
                "cascades": false,
                "type": "element",
                "value": "typography",
                "collapseStatus": "collapse",
                "values": {
                  "tag": "body1"
                },
              }],
              "name": "Heading",
              "prevent_delete": false,
              "cascades": false,
              "type": "element",
              "value": "div",
              "collapseStatus": "collapse",
            }, {
              "children": [{
                "children": [{
                  "name": "MaterialIcon",
                  "prevent_delete": false,
                  "cascades": false,
                  "type": "element",
                  "value": "MaterialIcon",
                  "collapseStatus": "expand",
                  "values": {
                    "icon": "Google",
                    "color": "default"
                  },
                  "children": [],
                }],
                "name": "button",
                "prevent_delete": false,
                "cascades": false,
                "type": "element",
                "value": "button",
                "collapseStatus": "expand",
                "values": {
                  "ButtonText": "",
                  "Variant": "outlined",
                  "className": "theme.google",
                  "Action": "googleSignIn",
                  "fullWidth": true
                },
              }, {
                "children": [{
                  "name": "MaterialIcon",
                  "prevent_delete": false,
                  "cascades": false,
                  "type": "element",
                  "value": "MaterialIcon",
                  "collapseStatus": "expand",
                  "values": {
                    "icon": "Facebook"
                  },
                  "children": [],
                }],
                "name": "button",
                "prevent_delete": false,
                "cascades": false,
                "type": "element",
                "value": "button",
                "collapseStatus": "collapse",
                "values": {
                  "Action": "googleSignIn",
                  "className": "theme.facebook",
                  "Variant": "outlined",
                  "fullWidth": true
                },
              }, {
                "children": [{
                  "name": "MaterialIcon",
                  "prevent_delete": false,
                  "cascades": false,
                  "type": "element",
                  "value": "MaterialIcon",
                  "collapseStatus": "expand",
                  "values": {
                    "icon": "Twitter"
                  },
                  "children": [],
                }],
                "name": "button",
                "prevent_delete": false,
                "cascades": false,
                "type": "element",
                "value": "button",
                "collapseStatus": "collapse",
                "values": {
                  "Action": "googleSignIn",
                  "ButtonText": "",
                  "className": "theme.twitter",
                  "fullWidth": true,
                  "Variant": "outlined"
                },
              }],
              "name": "Social SignUp",
              "prevent_delete": false,
              "cascades": false,
              "type": "element",
              "value": "div",
              "collapseStatus": "collapse",
              "values": {
                "class": "theme.externalSignIn"
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
                  "Content": "or"
                },
                "children": [],
              }],
              "name": "Separator Line",
              "prevent_delete": false,
              "cascades": false,
              "type": "element",
              "value": "div",
              "collapseStatus": "collapse",
              "values": {
                "class": "theme.separatorLine"
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
                    "Content": "{registerError}"
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
                  "severity": "error",
                  "variant": "standard",
                  "title": ""
                },
              }],
              "name": "registerError Message",
              "prevent_delete": false,
              "cascades": false,
              "type": "element",
              "value": "condition",
              "collapseStatus": "collapse",
              "values": {
                "condition": "registerError"
              },
            }, {
              "name": "Profile Picture",
              "prevent_delete": false,
              "cascades": false,
              "children": [],
              "type": "element",
              "value": "field",
              "collapseStatus": "expand",
              "values": {
                "Field": userTable.fields[4].unique_id,
                "Type": "edit",
                "margin": "normal",
                "variant": "outlined"
              },
            }, {
              "name": "FirstName",
              "prevent_delete": false,
              "cascades": false,
              "children": [],
              "type": "element",
              "value": "field",
              "collapseStatus": "expand",
              "values": {
                "margin": "normal",
                "Field": userTable.fields[0].unique_id,
                "Type": "edit",
                "variant": "outlined"
              },
            }, {
              "name": "LastName",
              "prevent_delete": false,
              "cascades": false,
              "children": [],
              "type": "element",
              "value": "field",
              "collapseStatus": "expand",
              "values": {
                "margin": "normal",
                "Field": userTable.fields[1].unique_id,
                "Type": "edit",
                "variant": "outlined"
              },
            }, {
              "name": "Email",
              "prevent_delete": false,
              "cascades": false,
              "children": [],
              "type": "element",
              "value": "field",
              "collapseStatus": "expand",
              "values": {
                "Field": userTable.fields[2].unique_id,
                "Type": "edit",
                "margin": "normal",
                "variant": "outlined"
              },
            }, {
              "name": "Password",
              "prevent_delete": false,
              "cascades": false,
              "children": [],
              "type": "element",
              "value": "field",
              "collapseStatus": "expand",
              "values": {
                "variant": "outlined",
                "margin": "normal",
                "Field": userTable.fields[3].unique_id,
                "Type": "edit"
              },
            }, {
              "name": "Submit",
              "prevent_delete": false,
              "cascades": false,
              "type": "element",
              "value": "button",
              "collapseStatus": "expand",
              "values": {
                "ButtonText": "Register",
                "Variant": "contained",
                "Color": "primary",
                "fullWidth": true,
                "Action": "handleRegister"
              },
              "children": [],
            }],
            "name": "Register Box",
            "prevent_delete": false,
            "cascades": false,
            "type": "element",
            "value": "div",
            "collapseStatus": "expand",
            "values": {
              "class": "theme.loginBox"
            },
          }],
          "name": "Main Area",
          "prevent_delete": false,
          "cascades": false,
          "type": "element",
          "value": "grid",
          "collapseStatus": "expand",
          "values": {
            "midcolumns": "9"
          },
        }],
        "name": "grid",
        "prevent_delete": false,
        "cascades": false,
        "type": "element",
        "value": "grid",
        "collapseStatus": "expand",
        "values": {
          "container": true,
          "align": "stretch"
        },
      }],
      "name": "Container",
      "prevent_delete": false,
      "cascades": false,
      "type": "element",
      "value": "Container",
      "collapseStatus": "expand",
      "values": {
        "maxWidth": "false",
        "className": "theme.loginPage"
      },
    }],
    "name": "Body",
    "type": "element",
    "value": "b",
    "prevent_delete": true,
    "cascades": false,
    "collapseStatus": "expand",
    "values": {
      "className": ["theme.pages"],
      "primaryColor": "green"
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
				"smpthost": Parameters.smpthost,
				"smptport": Parameters.smtpport,
				"smptuser": Parameters.smtpuser,
				"smptpass": Parameters.smtppass,
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
							"tag": "h4"
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
							"fullWidth": true,
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
							"tag": "h4"
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
							"fullWidth": true,
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
				"maxWidth": "false"
			},
		}],
		"name": "Body",
		"type": "element",
		"value": "b",
		"prevent_delete": true,
		"cascades": false,
		"collapseStatus": "expand",
		"values": {
			"primaryColor": "green",
			"className": ["theme.pages"]
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

dmz.children.push(LoginPage, RegisterPage, ForgotPage)

const secureZone = {
  "name": "Restricted Zone",
	"type": "page",
	"path": "",
	"filename": "",
	"parent": false,
	"collapseStatus": "expand",
	"children": [{
		"children": [{
			"name": "authHeaders",
			"prevent_delete": false,
			"cascades": true,
			"children": [],
			"type": "element",
			"value": "import",
			"collapseStatus": "expand",
			"values": {
				"moduleName": "authHeaders",
				"modulePath": "../services/auth-header"
			}
		}, {
			"name": "AuthService",
			"prevent_delete": false,
			"cascades": true,
			"children": [],
			"type": "element",
			"value": "import",
			"collapseStatus": "expand",
			"values": {
				"moduleName": "AuthService",
				"modulePath": "../services/auth.service"
			}
		}],
		"name": "Before Page Render",
		"type": "element",
		"value": "bpr",
		"prevent_delete": true,
		"cascades": false,
		"collapseStatus": "expand"
	}, {
		"children": [{
			"name": "useState",
			"prevent_delete": false,
			"cascades": true,
			"type": "element",
			"value": "useState",
			"collapseStatus": "expand",
			"values": {
				"variableName": "profileMenuAnchor",
				"defaultValue": "null"
			},
			"children": [],
		}, {
			"name": "code",
			"prevent_delete": false,
			"cascades": true,
			"type": "element",
			"value": "code",
			"values": {
				"code": "if (!authHeaders()) { \n  props.history.push(\"/Login\")\n}"
			},
			"collapseStatus": "expand",
			"children": []
		}, {
			"name": "useState",
			"prevent_delete": false,
			"cascades": true,
			"type": "element",
			"value": "useState",
			"collapseStatus": "expand",
			"values": {
				"defaultValue": "AuthService.getCurrentUser()",
				"variableName": "currentUser"
			},
			"children": []
		}],
		"name": "Page Header",
		"type": "element",
		"value": "ph",
		"prevent_delete": true,
		"cascades": false,
		"collapseStatus": "expand"
	}, {
		"name": "Body",
		"type": "element",
		"value": "b",
		"prevent_delete": true,
		"cascades": false,
		"collapseStatus": "expand",
		"children": [{
			"children": [{
				"children": [{
					"children": [{
						"name": "image",
						"prevent_delete": false,
						"cascades": false,
						"type": "element",
						"value": "image",
						"collapseStatus": "expand",
						"values": {
							"path": "/img/${currentUser.ProfilePic}",
							"ClassName": []
						},
						"children": [],
					}],
					"name": "IconButton",
					"prevent_delete": false,
					"cascades": false,
					"type": "element",
					"value": "IconButton",
					"collapseStatus": "expand",
					"values": {
						"className": "theme.profilePicture",
						"Action": "(event) => { setprofileMenuAnchor(event.currentTarget) }"
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
								"Content": "{currentUser.FirstName} {currentUser.LastName}"
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
							"class": "theme.menuProfileDetails"
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
								"Content": "Profile"
							},
							"children": [],
						}],
						"name": "MenuItem",
						"prevent_delete": false,
						"cascades": false,
						"type": "element",
						"value": "MenuItem",
						"collapseStatus": "expand",
					}, {
						"children": [{
							"name": "text",
							"prevent_delete": false,
							"cascades": false,
							"type": "element",
							"value": "text",
							"collapseStatus": "expand",
							"values": {
								"Content": "Logout"
							},
							"children": [],
						}],
						"name": "MenuItem",
						"prevent_delete": false,
						"cascades": false,
						"type": "element",
						"value": "MenuItem",
						"collapseStatus": "expand",
						"values": {
							"onclick": "(params) => { AuthService.logout(); props.history.push('/') }"
						},
					}],
					"name": "Menu",
					"prevent_delete": false,
					"cascades": false,
					"type": "element",
					"value": "Menu",
					"collapseStatus": "expand",
					"values": {
						"anchorElement": "profileMenuAnchor",
						"onClose": "(params) => { setprofileMenuAnchor(null)}"
					},
				}],
				"name": "navbar",
				"prevent_delete": false,
				"cascades": true,
				"type": "element",
				"value": "navbar",
				"collapseStatus": "expand",
				"values": {
					"Title": "",
					"Color": "transparent",
					"Position": "absolute",
					"Elevation": "3"
				},
			}],
			"name": "condition",
			"prevent_delete": false,
			"cascades": true,
			"type": "element",
			"value": "condition",
			"collapseStatus": "expand",
			"values": {
				"condition": "currentUser"
			},
		}]
	}, {
		"name": "Page Footer",
		"type": "element",
		"value": "pf",
		"prevent_delete": true,
		"cascades": false,
		"collapseStatus": "expand",
		"children": []
	}, {
		"name": "After Page Render",
		"type": "element",
		"value": "apr",
		"prevent_delete": true,
		"cascades": false,
		"collapseStatus": "collapse",
		"children": []
	}]
}

Application.pages[0].children.push(dmz)
Application.pages[0].children.push(secureZone)

return Application