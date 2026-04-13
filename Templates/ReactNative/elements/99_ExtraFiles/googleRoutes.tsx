export type LatLngPoint = {
  lat: number
  lng: number
}

export type RouteCoordinate = {
  latitude: number
  longitude: number
}

type ComputeRouteParams = {
  origin: LatLngPoint
  destinations: LatLngPoint[]
}

type ComputeRouteResult = {
  coordinates: RouteCoordinate[]
  distanceMeters: number | null
  durationSeconds: number | null
}

const GOOGLE_ROUTES_API_URL = 'https://routes.googleapis.com/directions/v2:computeRoutes'

const GOOGLE_ROUTES_FIELD_MASK = ['routes.distanceMeters', 'routes.duration', 'routes.polyline.encodedPolyline'].join(',')

export const getGoogleMapsApiKey = () =>
  process.env.EXPO_PUBLIC_GOOGLE_MAPS_API_KEY?.trim() || process.env.GOOGLE_MAPS_API_KEY?.trim() || ''

const decodePolylineValue = (encodedPolyline: string) => {
  const coordinates: RouteCoordinate[] = []
  let latitude = 0
  let longitude = 0
  let index = 0

  while (index < encodedPolyline.length) {
    let result = 0
    let shift = 0
    let byte = 0

    do {
      byte = encodedPolyline.charCodeAt(index++) - 63
      result |= (byte & 0x1f) << shift
      shift += 5
    } while (byte >= 0x20)

    latitude += result & 1 ? ~(result >> 1) : result >> 1

    result = 0
    shift = 0

    do {
      byte = encodedPolyline.charCodeAt(index++) - 63
      result |= (byte & 0x1f) << shift
      shift += 5
    } while (byte >= 0x20)

    longitude += result & 1 ? ~(result >> 1) : result >> 1

    coordinates.push({
      latitude: latitude / 1e5,
      longitude: longitude / 1e5,
    })
  }

  return coordinates
}

const parseDurationSeconds = (duration: string | undefined) => {
  if (!duration) return null

  const durationMatch = duration.match(/([\d.]+)s/)

  if (!durationMatch) return null

  const parsedDuration = Number(durationMatch[1])

  return Number.isFinite(parsedDuration) ? parsedDuration : null
}

const buildWaypoint = (point: LatLngPoint) => ({
  location: {
    latLng: {
      latitude: point.lat,
      longitude: point.lng,
    },
  },
})

export const computeDrivingRoute = async ({ origin, destinations }: ComputeRouteParams): Promise<ComputeRouteResult> => {
  const apiKey = getGoogleMapsApiKey()

  if (!apiKey) {
    throw new Error('Missing Google Maps API key')
  }

  if (!destinations.length) {
    return {
      coordinates: [],
      distanceMeters: null,
      durationSeconds: null,
    }
  }

  const destination = destinations[destinations.length - 1]
  const intermediates = destinations.slice(0, -1)

  const response = await fetch(GOOGLE_ROUTES_API_URL, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'X-Goog-Api-Key': apiKey,
      'X-Goog-FieldMask': GOOGLE_ROUTES_FIELD_MASK,
    },
    body: JSON.stringify({
      origin: buildWaypoint(origin),
      destination: buildWaypoint(destination),
      intermediates: intermediates.map(buildWaypoint),
      travelMode: 'DRIVE',
      routingPreference: 'TRAFFIC_AWARE',
      polylineQuality: 'HIGH_QUALITY',
      polylineEncoding: 'ENCODED_POLYLINE',
      computeAlternativeRoutes: false,
      optimizeWaypointOrder: false,
    }),
  })

  const data = await response.json()

  if (!response.ok) {
    const errorMessage = data?.error?.message || 'Google Routes API request failed'
    throw new Error(errorMessage)
  }

  const route = data?.routes?.[0]
  const encodedPolyline = route?.polyline?.encodedPolyline

  if (!encodedPolyline) {
    throw new Error('Google Routes API returned no polyline')
  }

  return {
    coordinates: decodePolylineValue(encodedPolyline),
    distanceMeters: typeof route?.distanceMeters === 'number' ? route.distanceMeters : null,
    durationSeconds: parseDurationSeconds(route?.duration),
  }
}
