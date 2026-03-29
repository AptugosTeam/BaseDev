try {
  if (!Application.settings) Application.settings = {}

  const parseValue = (value) => {
    if (typeof value !== 'string') return value
    const trimmed = value.trim()
    if (!trimmed) return value

    if (
      (trimmed.startsWith('{') && trimmed.endsWith('}')) ||
      (trimmed.startsWith('[') && trimmed.endsWith(']'))
    ) {
      try {
        return JSON.parse(trimmed)
      } catch (e) {
        throw new Error('Invalid JSON value')
      }
    }

    return value
  }

  const deepMerge = (target, source) => {
    if (!source || typeof source !== 'object' || Array.isArray(source)) return target

    Object.keys(source).forEach((key) => {
      const sourceValue = source[key]

      if (
        sourceValue &&
        typeof sourceValue === 'object' &&
        !Array.isArray(sourceValue)
      ) {
        if (!target[key] || typeof target[key] !== 'object' || Array.isArray(target[key])) {
          target[key] = {}
        }
        deepMerge(target[key], sourceValue)
      } else {
        target[key] = sourceValue
      }
    })

    return target
  }

  const ensureEnvironment = (envName) => {
    if (!envName) return null
    if (!Application.settings[envName]) Application.settings[envName] = {}
    return Application.settings[envName]
  }

  // MAIN INPUT RESOLUTION

  let settingsInput =
    Parameters.SettingsPatch ||
    Parameters.settings ||
    Parameters.AppSettings ||
    Parameters

  settingsInput = parseValue(settingsInput)

  // Optional top-level app name update
  const appName =
    Parameters.Name ||
    Parameters.name ||
    settingsInput?.Name ||
    settingsInput?.name

  if (appName) {
    Application.settings.name = appName
  }

  // Environment resolution
  const environment =
    Parameters.Environment ||
    Parameters.environment ||
    settingsInput?.Environment ||
    settingsInput?.environment

  const envSettings = ensureEnvironment(environment)

  if (envSettings) {
    const url =
      Parameters.URL ||
      Parameters.url ||
      settingsInput?.URL ||
      settingsInput?.url

    const apiURL =
      Parameters.ApiURL ||
      Parameters.apiURL ||
      settingsInput?.ApiURL ||
      settingsInput?.apiURL

    const type =
      Parameters.Type ||
      Parameters.type ||
      settingsInput?.Type

    const folder =
      Parameters.Folder ||
      Parameters.folder ||
      settingsInput?.Folder

    const template =
      Parameters.Template ||
      Parameters.template ||
      settingsInput?.Template

    const dbconnectstring =
      Parameters.DbConnectString ||
      Parameters.dbconnectstring ||
      settingsInput?.DbConnectString ||
      settingsInput?.dbconnectstring

    const variables =
      Parameters.Variables ||
      Parameters.variables ||
      settingsInput?.Variables

    if (url !== undefined) envSettings.url = url
    if (apiURL !== undefined) envSettings.apiURL = apiURL
    if (type !== undefined) envSettings.type = type
    if (folder !== undefined) envSettings.folder = folder
    if (template !== undefined) envSettings.template = template
    if (dbconnectstring !== undefined) envSettings.dbconnectstring = dbconnectstring
    if (variables !== undefined) envSettings.variables = variables
  }

  // Advanced patch support
  let patch =
    Parameters.SettingsPatch ||
    Parameters.settingsPatch ||
    settingsInput?.SettingsPatch ||
    settingsInput?.settingsPatch

  patch = parseValue(patch)

  if (patch && typeof patch === 'object' && !Array.isArray(patch)) {
    deepMerge(Application.settings, patch)
  }

  Application.modifiedAt = Date.now()

} catch (e) {
  console.log('ERROR', e)
  throw e
}

return Application