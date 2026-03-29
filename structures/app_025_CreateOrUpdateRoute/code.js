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

  const hasOwn = (obj, key) => Object.prototype.hasOwnProperty.call(obj, key)

  const parseRoutePayload = () => {
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

  const buildRouteMiddlewaresFromCheckboxes = (source) => {
    const checkboxKeys = ['UseAuth', 'UseBody', 'UseUploads']
    const anyProvided = checkboxKeys.some((key) => hasOwn(source, key))

    if (!anyProvided) return undefined

    const middlewares = []
    if (source.UseAuth === true) middlewares.push('auth')
    if (source.UseBody === true) middlewares.push('body')
    if (source.UseUploads === true) middlewares.push('uploads')

    return middlewares
  }

  const buildSingleRoutePatch = (source, basePayload = {}) => {
    const patch = { ...basePayload }

    if (source.RouteName) patch.route_name = source.RouteName
    if (source.RouteMethod) patch.route_method = source.RouteMethod
    if (source.RoutePath) patch.route_path = source.RoutePath
    if (source.RouteTemplate) patch.route_template = source.RouteTemplate
    if (typeof source.RouteActive === 'boolean') patch.route_active = source.RouteActive
    if (typeof source.RouteCode !== 'undefined') patch.route_code = source.RouteCode

    // Explicit route_middlewares in payload wins
    if (hasOwn(basePayload, 'route_middlewares')) {
      patch.route_middlewares = basePayload.route_middlewares
    } else {
      const checkboxMiddlewares = buildRouteMiddlewaresFromCheckboxes(source)
      if (typeof checkboxMiddlewares !== 'undefined') {
        patch.route_middlewares = checkboxMiddlewares
      }
    }

    return patch
  }

  if (action === 'addroute') {
    const payload = parseRoutePayload()
    if (Array.isArray(payload)) {
      return { error: 'RoutePayload for addroute must be a JSON object, not an array' }
    }

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
    if (!newRoute.route_code && typeof Parameters.RouteCode !== 'undefined') {
      newRoute.route_code = Parameters.RouteCode
    }

    const checkboxMiddlewares = buildRouteMiddlewaresFromCheckboxes(Parameters)
    if (!hasOwn(newRoute, 'route_middlewares') && typeof checkboxMiddlewares !== 'undefined') {
      newRoute.route_middlewares = checkboxMiddlewares
    }

    if (!newRoute.route_name) return { error: 'Missing route_name' }
    if (!newRoute.route_method) return { error: 'Missing route_method' }
    if (!newRoute.route_path) return { error: 'Missing route_path' }

    if (typeof newRoute.route_active === 'undefined') newRoute.route_active = true
    if (typeof newRoute.route_template === 'undefined') newRoute.route_template = null
    if (typeof newRoute.route_code === 'undefined') newRoute.route_code = null
    if (typeof newRoute.route_middlewares === 'undefined') newRoute.route_middlewares = []

    table.definedRoutes.push(newRoute)
  }

  else if (action === 'updateroute') {
    if (!Parameters.Route) return { error: 'Missing parameter: Route' }

    const routeIndex = findRouteIndex(Parameters.Route)
    if (routeIndex === -1) return { error: `Route not found: ${Parameters.Route}` }

    const payload = parseRoutePayload()
    if (Array.isArray(payload)) {
      return { error: 'RoutePayload for updateroute must be a JSON object, not an array' }
    }

    const patch = buildSingleRoutePatch(Parameters, payload)

    table.definedRoutes[routeIndex] = {
      ...table.definedRoutes[routeIndex],
      ...patch
    }
  }

  else if (action === 'batchupdateroutes') {
    const payload = parseRoutePayload()
    if (!Array.isArray(payload)) {
      return { error: 'RoutePayload for batchupdateroutes must be a JSON array' }
    }

    const result = {
      updated: [],
      failed: []
    }

    for (const item of payload) {
      try {
        if (!item || typeof item !== 'object') {
          result.failed.push({
            route: null,
            error: 'Each batch item must be an object'
          })
          continue
        }

        const routeRef = item.Route || item.route || item.route_name || item.route_path || item.unique_id
        if (!routeRef) {
          result.failed.push({
            route: null,
            error: 'Missing Route in batch item'
          })
          continue
        }

        const routeIndex = findRouteIndex(routeRef)
        if (routeIndex === -1) {
          result.failed.push({
            route: routeRef,
            error: `Route not found: ${routeRef}`
          })
          continue
        }

        const itemPayload =
          item.RoutePayload && typeof item.RoutePayload === 'string'
            ? JSON.parse(item.RoutePayload)
            : (item.RoutePayload && typeof item.RoutePayload === 'object'
                ? item.RoutePayload
                : { ...item })

        delete itemPayload.Route
        delete itemPayload.route
        delete itemPayload.RoutePayload

        const patch = buildSingleRoutePatch(item, itemPayload)

        table.definedRoutes[routeIndex] = {
          ...table.definedRoutes[routeIndex],
          ...patch
        }

        result.updated.push(routeRef)
      } catch (e) {
        result.failed.push({
          route: item && (item.Route || item.route || item.route_name || item.route_path || item.unique_id) || null,
          error: e.message
        })
      }
    }

    table.updatedAt = new Date().toISOString()
    Application.tables[tableIndex] = table

    return {
      ok: result.failed.length === 0,
      summary: {
        updatedCount: result.updated.length,
        failedCount: result.failed.length
      },
      ...result,
      Application
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