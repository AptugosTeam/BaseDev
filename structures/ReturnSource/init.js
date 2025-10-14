const sourceCall = await fetch(Parameters.url)
const source = await sourceCall.text()

return source