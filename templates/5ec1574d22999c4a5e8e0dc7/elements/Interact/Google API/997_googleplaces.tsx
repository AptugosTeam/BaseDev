/*
path: 997_googleplaces.tsx
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/5ec1574d22999c4a5e8e0dc7/elements/Interact/Google
  API/997_googleplaces.tsx
keyPath: elements/Interact/Google API/997_googleplaces.tsx
unique_id: gKXn32rU
*/
import React from 'react'
import PlacesMap from './map'
declare global {
  interface Window {
    mapsApi: any[]
  }
}

window.mapsApi = []
const AutoComplete = (props: any) => {
  const { placesKey, inputId } = props
  const ref = React.useRef(null)
  const [input, setInput] = React.useState(props.initialValue || '')

  React.useEffect(() => {
    if (ref.current) {
      ref.current.value = props.initialValue || ''
      setInput(props.initialValue || '')
    }
  }, [props.initialValue])

  const renderGoogle = () => {
    if (!document.getElementById(inputId)) {
      setTimeout(renderGoogle, 100)
    } else {
      // @ts-ignore
      window.mapsApi[inputId] = new window.google.maps.places.Autocomplete(ref.current, {})
      const handlePlaceSelect = () => {
        const output = {
          formattedAddress: '',
          latitude: null,
          longitude: null,
          streetNumber: null,
          premise: null,
          route: null,
          postalTown: null,
          street: null,
          city: null,
          country: null,
          zip: null,
        }

        const place = window.mapsApi[inputId].getPlace()
        output.formattedAddress = place.formatted_address
        output.latitude = place.geometry.location.lat()
        output.longitude = place.geometry.location.lng()

        for (const component of place.address_components) {
          const type = component.types[0]
          switch (type) {
            case 'street_number':
              output.streetNumber = component.long_name
              break
            case 'premise':
              output.premise = component.long_name
              break
            case 'route':
              output.street = component.long_name
              break
            case 'postal_town':
              output.city = component.long_name
              break
            case 'administrative_area_level_2':
              if (!output.city) output.city = component.long_name
              break
            case 'neighborhood':
              if (!output.city) output.city = component.long_name
              break
            case 'country':
              output.country = component.long_name
              break
            case 'postal_code':
              output.zip = component.zip
              break
          }
        }

        setInput(output.formattedAddress)
        callBack(output)
      }

      //listen for place change in input field
      window.mapsApi[inputId].addListener('place_changed', handlePlaceSelect)
    }
  }

  const callBack = (output) => {
    props.onChange && props.onChange(output)
  }

  React.useEffect(() => {
    window[`renderGoogle_${inputId}`] = renderGoogle
    let found = document.getElementById('placesScript') ? true : false
    if (!found) {
      const script = document.createElement('script')
      script.id = 'placesScript'
      script.src = `https://maps.googleapis.com/maps/api/js?key=${placesKey}&libraries=places&callback=renderGoogle_${inputId}`
      script.async = true
      document.body.appendChild(script)
    }
  
    if (found) {
      document.getElementById('placesScript').addEventListener('load', renderGoogle)
    }
  },[])

  return (
    <input
      ref={ref}
      id={inputId}
      type="text"
      className={props.className}
      value={input}
      onChange={(e) => setInput(e.target.value)}
      placeholder={props.placeholder || 'Enter a Location'}
      disabled={props.disabled}
    />
  )
}

export { PlacesMap }
export default AutoComplete
