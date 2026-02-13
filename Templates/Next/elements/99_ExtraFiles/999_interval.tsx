/*
path: 999_interval.tsx
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/5ec1574d22999c4a5e8e0dc7/elements/99_ExtraFiles/999_interval.tsx
keyPath: elements/99_ExtraFiles/999_interval.tsx
unique_id: vSu0HqQi
*/
import React from 'react'

// Aptugo's Interval Hook
export default function useInterval(callback, delay) {
  const intervalRef = React.useRef(null)
  const savedCallback = React.useRef(callback)
  
  React.useEffect(() => {
    savedCallback.current = callback
  }, [callback])

  React.useEffect(() => {
    const tick = () => savedCallback.current()
    if (typeof delay === 'number') {
      intervalRef.current = window.setInterval(tick, delay)
      return () => window.clearInterval(intervalRef.current)
    }
  }, [delay])
  
  return intervalRef
}