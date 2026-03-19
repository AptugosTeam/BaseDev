try {
  const tableRef = Parameters.Table
  const action = (Parameters.Action || '').toLowerCase()

  if (!tableRef) return { error: 'Missing parameter: Table' }
  if (!action) return { error: 'Missing parameter: Action' }

  if (!Application.tables || !Array.isArray(Application.tables)) {
    return { error: 'Application has no tables loaded' }
  }

  const findTableIndex = (ref) => {
    return Application.tables.findIndex((table) =>
      table.unique_id === ref ||
      table._id === ref ||
      table.name === ref
    )
  }

  const tableIndex = findTableIndex(tableRef)
  if (tableIndex === -1) return { error: `Table not found: ${tableRef}` }

  const table = Application.tables[tableIndex]
  if (!table.definedRoutes) table.definedRoutes = []

  const parseRoutePayload = () => {
    console.log('Parsing Route Payload')
    console.log(Parameters)
    if (!Parameters.RoutePayload) return {}
    try {
      return JSON.parse(Parameters.RoutePayload)
    } catch (e) {
      throw new Error('RoutePayload must be valid JSON')
    }
  }

  const findRouteIndex = (ref) => {
    return table.definedRoutes.findIndex((route) =>
      route.unique_id === ref ||
      route.route_name === ref ||
      route.route_path === ref
    )
  }

  if (action === 'addroute') {
    const payload = parseRoutePayload()

    const newRoute = {
      unique_id: payload.unique_id || aptugo.generateID(),
      ...payload
    }

    if (!newRoute.route_name && Parameters.RouteName) newRoute.route_name = Parameters.RouteName
    if (!newRoute.route_method && Parameters.RouteMethod) newRoute.route_method = Parameters.RouteMethod
    if (!newRoute.route_path && Parameters.RoutePath) newRoute.route_path = Parameters.RoutePath
    if (!newRoute.route_template && Parameters.RouteTemplate) newRoute.route_template = Parameters.RouteTemplate
    if (typeof newRoute.route_active === 'undefined' && typeof Parameters.RouteActive === 'boolean') {
      newRoute.route_active = Parameters.RouteActive
    }
    if (!newRoute.route_code && typeof Parameters.RouteCode !== 'undefined') newRoute.route_code = Parameters.RouteCode

    if (!newRoute.route_name) return { error: 'Missing route_name' }
    if (!newRoute.route_method) return { error: 'Missing route_method' }
    if (!newRoute.route_path) return { error: 'Missing route_path' }

    if (typeof newRoute.route_active === 'undefined') newRoute.route_active = true
    if (typeof newRoute.route_template === 'undefined') newRoute.route_template = null
    if (typeof newRoute.route_code === 'undefined') newRoute.route_code = null

    table.definedRoutes.push(newRoute)
  }

  else if (action === 'updateroute') {
    if (!Parameters.Route) return { error: 'Missing parameter: Route' }

    const routeIndex = findRouteIndex(Parameters.Route)
    if (routeIndex === -1) return { error: `Route not found: ${Parameters.Route}` }

    const payload = parseRoutePayload()
    const patch = { ...payload }

    if (Parameters.RouteName) patch.route_name = Parameters.RouteName
    if (Parameters.RouteMethod) patch.route_method = Parameters.RouteMethod
    if (Parameters.RoutePath) patch.route_path = Parameters.RoutePath
    if (Parameters.RouteTemplate) patch.route_template = Parameters.RouteTemplate
    if (typeof Parameters.RouteActive === 'boolean') patch.route_active = Parameters.RouteActive
    if (typeof Parameters.RouteCode !== 'undefined') patch.route_code = Parameters.RouteCode

    table.definedRoutes[routeIndex] = {
      ...table.definedRoutes[routeIndex],
      ...patch
    }
  }

  else if (action === 'removeroute') {
    if (!Parameters.Route) return { error: 'Missing parameter: Route' }

    const before = table.definedRoutes.length
    table.definedRoutes = table.definedRoutes.filter((route) =>
      route.unique_id !== Parameters.Route &&
      route.route_name !== Parameters.Route &&
      route.route_path !== Parameters.Route
    )

    if (table.definedRoutes.length === before) {
      return { error: `Route not found: ${Parameters.Route}` }
    }
  }

  else {
    return { error: `Unsupported action: ${Parameters.Action}` }
  }

  table.updatedAt = new Date().toISOString()
  Application.tables[tableIndex] = table
} catch (e) {
  console.log('ERROR', e)
  throw e
}

return Application