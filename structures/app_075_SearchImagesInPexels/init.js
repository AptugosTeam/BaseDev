const query = (Parameters.Query || '').trim()
if (!query) {
  throw new Error('Pexels Search requires Parameters.Query')
}

const orientation = (Parameters.Orientation || '').trim()
const size = (Parameters.Size || '').trim()
const color = (Parameters.Color || '').trim()
const mode = (Parameters.Mode || 'agentPick').trim()
const targetUse = (Parameters.TargetUse || 'generic').trim()
const page = Math.max(1, Number(Parameters.Page) || 1)
const perPage = Math.min(80, Math.max(1, Number(Parameters.PerPage) || 8))
const pickIndex = Parameters.PickIndex !== undefined && Parameters.PickIndex !== null && Parameters.PickIndex !== ''
  ? Number(Parameters.PickIndex)
  : null

const apiKey =
  Parameters.ApiKey ||
  process.env.PEXELS_API_KEY ||
  process.env.NEXT_PUBLIC_PEXELS_API_KEY ||
  (typeof aptugo !== 'undefined' && aptugo.env && aptugo.env.PEXELS_API_KEY) ||
  'EqpjvzZBiA5BpvPysQkLh4P5eCoiYvT0OTFdQqlTbTG2fRJYVd4iDhvP'

if (!apiKey) {
  throw new Error('Missing Pexels API key. Provide Parameters.ApiKey or set PEXELS_API_KEY.')
}

const params = new URLSearchParams()
params.set('query', query)
params.set('page', String(page))
params.set('per_page', String(perPage))
if (orientation) params.set('orientation', orientation)
if (size) params.set('size', size)
if (color) params.set('color', color)

const url = `https://api.pexels.com/v1/search?${params.toString()}`

const response = await fetch(url, {
  method: 'GET',
  headers: {
    Authorization: apiKey
  }
})

if (!response.ok) {
  const body = await response.text()
  throw new Error(`Pexels request failed (${response.status}): ${body}`)
}

const data = await response.json()

const photos = Array.isArray(data.photos) ? data.photos : []

const normalizePhoto = (photo) => {
  const width = Number(photo.width) || 0
  const height = Number(photo.height) || 0
  const aspectRatio = width > 0 && height > 0 ? width / height : null

  return {
    id: photo.id,
    alt: photo.alt || '',
    width,
    height,
    aspectRatio,
    url: photo.url || '',
    avg_color: photo.avg_color || '',
    photographer: photo.photographer || '',
    photographer_url: photo.photographer_url || '',
    photographer_id: photo.photographer_id || null,
    src: {
      original: photo.src?.original || '',
      large2x: photo.src?.large2x || '',
      large: photo.src?.large || '',
      medium: photo.src?.medium || '',
      small: photo.src?.small || '',
      portrait: photo.src?.portrait || '',
      landscape: photo.src?.landscape || '',
      tiny: photo.src?.tiny || ''
    },
    attribution: {
      provider: 'Pexels',
      provider_url: 'https://www.pexels.com',
      photographer_text: photo.photographer ? `Photo by ${photo.photographer} on Pexels` : 'Photo on Pexels'
    }
  }
}

const scorePhoto = (photo, { targetUse, orientation, query }) => {
  let score = 0

  const aspectRatio = photo.aspectRatio || 0
  const alt = (photo.alt || '').toLowerCase()
  const q = (query || '').toLowerCase()

  if (q && alt.includes(q)) score += 25

  if (orientation === 'landscape' && aspectRatio > 1.2) score += 20
  if (orientation === 'portrait' && aspectRatio > 0 && aspectRatio < 0.9) score += 20
  if (orientation === 'square' && aspectRatio >= 0.9 && aspectRatio <= 1.1) score += 20

  if (targetUse === 'hero') {
    if (aspectRatio >= 1.4) score += 30
    if (photo.width >= 1800) score += 20
    if (photo.src.large2x) score += 10
  }

  if (targetUse === 'card') {
    if (photo.width >= 900) score += 15
    if (aspectRatio >= 1.1 && aspectRatio <= 1.8) score += 15
  }

  if (targetUse === 'team') {
    if (aspectRatio > 0 && aspectRatio < 0.95) score += 20
    if (alt.includes('person') || alt.includes('people') || alt.includes('team')) score += 15
  }

  if (targetUse === 'background') {
    if (photo.width >= 1600) score += 20
    if (aspectRatio >= 1.5) score += 20
  }

  if (photo.avg_color) score += 2
  if (photo.photographer) score += 2

  return score
}

const candidates = photos.map(normalizePhoto).map((photo) => ({
  ...photo,
  score: scorePhoto(photo, { targetUse, orientation, query })
}))

candidates.sort((a, b) => b.score - a.score)

let selected = null

if (typeof pickIndex === 'number' && !Number.isNaN(pickIndex) && candidates[pickIndex]) {
  selected = candidates[pickIndex]
} else if (mode === 'agentPick') {
  selected = candidates[0] || null
}

return {
  provider: 'Pexels',
  provider_url: 'https://www.pexels.com',
  mode,
  query,
  page: data.page || page,
  per_page: data.per_page || perPage,
  total_results: data.total_results || candidates.length,
  next_page: data.next_page || null,
  prev_page: data.prev_page || null,
  selected,
  candidates,
  alternatives: selected ? candidates.filter(item => item.id !== selected.id).slice(0, 4) : candidates.slice(0, 4),
  guidance: {
    attribution_required: true,
    attribution_text: selected?.attribution?.photographer_text || 'Photos provided by Pexels'
  }
}