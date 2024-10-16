/*
path: Autocomplete.tsx
completePath: >-
  /Users/Shared/Dev/BaseDev/Templates/Next/src/components/Autocomplete/Autocomplete.tsx
keyPath: src/components/Autocomplete/Autocomplete.tsx
unique_id: nd2fxWPD
*/
import Autocomplete from '@mui/material/Autocomplete'
import CircularProgress from '@mui/material/CircularProgress'
import TextField from '@mui/material/TextField'
import * as React from 'react'

function debounce(fn, delay) {
  let timeoutId
  return (...args) => {
    clearTimeout(timeoutId)
    timeoutId = setTimeout(() => fn(...args), delay)
  }
}

export default function Asynchronous(props) {
  const [open, setOpen] = React.useState(false)
  const [options, setOptions] = React.useState([])
  const loading = open && options.length === 0

  const handleInputChange = (e) => {
    if (!e) return
    const newValue = e.target.value
    if (newValue) {
      const inputValue = newValue.replace(/\W /g, '')
      return inputValue
    }
  }

  const debouncedFunction = debounce(handleInputChange, 1000)

  const onChange = (newValue) => {
    props.onChange(newValue)
  }

  React.useEffect(() => {
    if (!open) {
      setOptions([])
    } else {
      props.onType('').then((result) => {
        setOptions(result)
      })
    }
  }, [open])

  return (
    <Autocomplete
      multiple={props.chips}
      fullWidth
      onInputChange={debouncedFunction}
      value={props.value}
      onChange={(_event: any, newValue: string | null) => {
        onChange(newValue)
      }}
      open={open}
      onOpen={() => {
        setOpen(true)
      }}
      onClose={() => {
        setOpen(false)
      }}
      isOptionEqualToValue={(option, value) => option?.label === value}
      getOptionLabel={(option) => option?.label || option || ''}
      options={options}
      loading={loading}
      renderInput={(params) => (
        <TextField
          {...params}
          label={props.label}
          InputProps={ {
            ...params.InputProps,
            endAdornment: (
              <React.Fragment>
                {loading ? <CircularProgress color="inherit" size={20} /> : null}
                {params.InputProps.endAdornment}
              </React.Fragment>
            ),
          }}
        />
      )}
    />
  )
}
