/*
path: debouncedInput.tsx
completePath: >-
  /Users/Shared/Dev/BaseDev/Templates/Next/elements/99_ExtraFiles/debouncedInput.tsx
keyPath: elements/99_ExtraFiles/debouncedInput.tsx
unique_id: uGw8PssK
*/
import React from 'react'

function DebouncedInput({
  value: initialValue,
  onChange,
  debounce = 500,
  ...props
}: {
  value: string | number
  onChange: (value: string | number) => void
  debounce?: number
} & Omit<React.InputHTMLAttributes<HTMLInputElement>, 'onChange'>) {
  const [value, setValue] = React.useState(initialValue)

  React.useEffect(() => {
    setValue(initialValue)
  }, [initialValue])

  React.useEffect(() => {
    const timeout = setTimeout(() => {
      onChange(value)
    }, debounce)

    return () => clearTimeout(timeout)
  }, [value])

  return (
    <input {...props} value={value} onChange={e => setValue(e.target.value)} />
  )
}

export default DebouncedInput