if (!Parameters.Table) {
  return { error: 'Missing parameter: Table' }
}

if (!Parameters.Action) {
  return { error: 'Missing parameter: Action' }
}

return Application