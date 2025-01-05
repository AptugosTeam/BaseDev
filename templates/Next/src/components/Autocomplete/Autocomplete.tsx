/*
path: Autocomplete.tsx
keyPath: src/components/Autocomplete/Autocomplete.tsx
unique_id: nd2fxWPD
*/
import { fetcher } from '@lib/fetch'
import Autocomplete, { createFilterOptions } from '@mui/material/Autocomplete'
import TextField from '@mui/material/TextField'
import * as React from 'react'

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
  const [value, setValue] = React.useState<any>(props.chips ? [] : {})
  const [options, setOptions] = React.useState([])

  const handleInputChange = (e) => {
    if (e) {
      typeInSearch(e.target?.value || '').then((result) => {
        setOptions(result)
      })
    }
  }

  React.useEffect(() => {
    let newValue: any = { value: props.value._id, label: props.value[props.labelProperty] }
    if (props.chips) {
      if (props.value.length) {
        newValue = props.value.map((v) => {
          return { value: v._id, label: v[props.labelProperty] }
        })
      } else {
        newValue = []
      }
    }
    setValue(newValue)
  }, [props.value])

  const debouncedFunction = debounce(handleInputChange, 250)

  const typeInSearch = async (typedIn) => {
    const authorOptions = await fetcher(props.endpointLocation).then((arc) => {
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
      multiple={props.chips}
      value={value}
      onChange={(_event, newValue) => {
        let theValue = newValue
        if (props.chips) {
          if (!Array.isArray(theValue)) theValue = [theValue]

          theValue = theValue.map((value) => {
            if (typeof value === 'string') return { label: newValue }
            else if (value && value.inputValue) return { value: null, label: value.inputValue }
            return value
          })
          let formatedValue = theValue.map((v) => {
            if (v.inputValue) return { _id: null, [props.labelProperty]: v.inputValue }
            return { _id: v.value, [props.labelProperty]: v.label }
          })
          props.onChange(formatedValue)
        } else {
          let formatedValue = theValue?.value ? { _id: theValue.value, [props.labelProperty]: theValue.label } : null
          if (theValue && theValue.inputValue) formatedValue = { _id: null, [props.labelProperty]: theValue.inputValue }
          props.onChange(formatedValue)
        }
        setValue(theValue)
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
        if (option?.inputValue) return option.inputValue
        return option?.label || ''
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
      renderInput={(params) => {
        params.inputProps.autoComplete = 'do-not-autofill'
        return <TextField {...params} label={props.label} />
      }}
    />
  )
}
