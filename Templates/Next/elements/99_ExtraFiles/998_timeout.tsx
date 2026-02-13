/*
path: 998_timeout.tsx
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/5ec1574d22999c4a5e8e0dc7/elements/99_ExtraFiles/998_timeout.tsx
keyPath: elements/99_ExtraFiles/998_timeout.tsx
unique_id: 4Cz8NRRE
*/
import React from 'react'

// Aptugo's Timeout Hook
export default function useTimeout(callback, delay) {
  const timeoutRef = React.useRef(null)
  const savedCallback = React.useRef(callback)
  
  React.useEffect(() => {
    savedCallback.current = callback
  }, [callback])

  React.useEffect(() => {
    const tick = () => savedCallback.current()
    if (typeof delay === 'number') {
      timeoutRef.current = window.setTimeout(tick, delay)
      return () => window.clearTimeout(timeoutRef.current)
    }
  }, [delay])

  return timeoutRef
}