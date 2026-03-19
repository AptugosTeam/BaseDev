const tableId = Parameters.unique_id

if (!tableId) {
  throw new Error('Sync ABM Pages From Table requires parameter: unique_id')
}

if (!Application.tables || !Array.isArray(Application.tables)) {
  throw new Error('Application has no tables')
}

if (!Application.pages || !Array.isArray(Application.pages)) {
  return Application
}

return Application