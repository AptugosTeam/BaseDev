// Application

// Backwards compatibility
if (State.usersReducer) {
  if (State.usersReducer.apps.find(app => app.settings.name === Parameters.Name)) {
    const error = 'Application with the same name exists (reducer)'
    Store.dispatch({ type: "SET_ERROR", error: error })
    return false
  }
} else if (State.apps) {
  if (State.apps.find(app => app.settings.name === Parameters.Name)) {
    Parameters.name = Parameters.name + '_' + aptugo.generateID()
  }
}

// Backwards compatibility
let defaultTemplate

try {
  if (State.templatesReducer) {
    defaultTemplate = State.templatesReducer.templates.filter(template => template.default )
    State.templatesReducer.loadedTemplate = defaultTemplate[0]
  } else {
    defaultTemplate = State.templates.filter(template => template.default)
  }
} catch(e) {
  console.log('Erorr when definining template', e)
  const error = 'Something wrong with the templates'
  Store.dispatch({ type: "SET_ERROR", error: error })
}


const username = aptugo.friendly(State.auth.user.name)
const dbpassword = aptugo.generateID() + aptugo.generateID()
const appname = aptugo.friendly(Parameters.Name)
const dbusername = username + appname
Application.createdAt = Date.now(),
Application.settings = {
    name: Parameters.Name || 'Untitled Application',
    icon: Parameters.icon || null,
    lastSaved: null,
    lastBuild: null,
    development: {
      apiURL: `http://127.0.0.1:4567`,
      type: 'Local',
      folder: appname,
      template: defaultTemplate ? defaultTemplate[0]._id : '',
      url: `https://${appname.toLowerCase()}${aptugo.friendly(aptugo.ls.getItem('license'))}.aptugo.com`,
      dbconnectstring: `mongodb://127.0.0.1:27017/${appname.toLowerCase()}`
    },
    stagging: {
      apiURL: `https://${appname.toLowerCase()}${aptugo.friendly(aptugo.ls.getItem('license'))}.aptugo.app`,
      type: 'Local',
      folder: `${appname}_stagging`,
      template: defaultTemplate ? defaultTemplate[0]._id : '',
      url: `https://${appname.toLowerCase()}${aptugo.friendly(aptugo.ls.getItem('license'))}.aptugo.com`,
      dbconnectstring: `mongodb://127.0.0.1:27017/${appname.toLowerCase()}`
    },
    production: {
      apiURL: `https://${appname.toLowerCase()}${aptugo.friendly(aptugo.ls.getItem('license'))}.backend.aptugo.app`,
      type: 'Remote (Aptugo)',
      folder: appname,
      template: defaultTemplate ? defaultTemplate[0]._id : '',
      url: `https://${appname.toLowerCase()}${aptugo.friendly(aptugo.ls.getItem('license'))}.aptugo.app`,
      dbconnectstring: `mongodb://127.0.0.1:27017/${appname.toLowerCase()}`
    }
}

// aptugo.createdbuser({ dbName: username, user: dbusername, pwd: dbpassword })

Application._id = aptugo.generateID(16)
return Application
