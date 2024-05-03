/*
path: Autocomplete.tsx
completePath: front-end/components/Autocomplete/Autocomplete.tsx
unique_id: wpHBmu7F
*/
import * as React from 'react'
import TextField from '@mui/material/TextField'
import Autocomplete from '@mui/material/Autocomplete'
import CircularProgress from '@mui/material/CircularProgress'

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
      props.onType('').then(result => {
        setOptions(result)
      })
    }
  }, [open])

  return (
    <Autocomplete
      fullWidth
      onInputChange={debouncedFunction}
      value={props.value?.title}
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
      isOptionEqualToValue={(option, value) => option?.title === value?.title}
      getOptionLabel={(option) => option.title || option || ''}
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
