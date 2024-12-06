/*
path: Autocomplete.tsx
keyPath: src/components/Autocomplete/Autocomplete.tsx
unique_id: nd2fxWPD
*/
import * as React from 'react'
import { fetcher } from '@lib/fetch'
import Autocomplete, { createFilterOptions } from '@mui/material/Autocomplete'
import TextField from '@mui/material/TextField'

interface OptionType {
  inputValue?: string
  value?: string
  label: string
}

function debounce(fn, delay) {
  let timeoutId
  return (...args) => {
    clearTimeout(timeoutId)
    timeoutId = setTimeout(() => fn(...args), delay)
  }
}

const filter = createFilterOptions<OptionType>()

export default function AptugoAutocomplete(props) {
  const [value, setValue] = React.useState<OptionType | null>(null)
  const [options, setOptions] = React.useState([])

  const handleInputChange = (e) => {
    typeInSearch(e.target?.value || '').then((result) => {
      setOptions(result)
    })
  }

  const debouncedFunction = debounce(handleInputChange, 1000)

  const typeInSearch = async (typedIn) => {
    const authorOptions = await fetcher('/api/users').then((arc) => {
      return arc?.data?.docs?.map((ac) => {
        return { value: ac._id, label: ac[props.labelProperty] }
      })
    })
    return authorOptions
  }

  React.useEffect(() => {
    handleInputChange('')
  }, [])

  return (
    <Autocomplete
      value={value}
      onChange={(event, newValue) => {
        let theValue = newValue

        if (typeof newValue === 'string') theValue = { label: newValue }
        else if (theValue && theValue.inputValue) theValue = { label: newValue.inputValue }
        setValue(theValue)
        props.onChange(theValue)
      }}
      filterOptions={(options, params) => {
        const filtered = filter(options, params)
        const { inputValue } = params
        const isExisting = options.some((option) => inputValue === option.label)
        if (inputValue !== '' && !isExisting) {
          filtered.push({
            inputValue,
            label: `Add "${inputValue}"`,
          })
        }

        return filtered
      }}
      selectOnFocus
      clearOnBlur
      handleHomeEndKeys
      options={options}
      getOptionLabel={(option) => {
        if (typeof option === 'string') return option
        if (option.inputValue) return option.inputValue
        return option.label
      }}
      renderOption={(props, option) => {
        const { key, ...optionProps } = props
        return (
          <li key={key} {...optionProps}>
            {option.label}
          </li>
        )
      }}
      freeSolo
      onInputChange={debouncedFunction}
      renderInput={(params) => <TextField {...params} label={props.label} />}
    />
  )
}
