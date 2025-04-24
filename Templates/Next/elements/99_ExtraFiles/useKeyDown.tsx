/*
path: useKeyDown.tsx
completePath: /Users/Shared/Dev/BaseDev/Templates/Next/elements/99_ExtraFiles/useKeyDown.tsx
keyPath: elements/99_ExtraFiles/useKeyDown.tsx
unique_id: SRBSTHfU
*/
import { useEffect } from 'react'

const UseKeyDown = (callback, keys) => {
  const onKeyDown = (event) => {
    const wasAnyKeyPressed = keys.some((key) => event.key === key)
    if (wasAnyKeyPressed) {
      event.preventDefault()
      callback()
    }
  }
  
  useEffect(() => {
    document.addEventListener('keydown', onKeyDown)
    return () => {
      document.removeEventListener('keydown', onKeyDown)
    }
  }, [onKeyDown])
}

export default UseKeyDown