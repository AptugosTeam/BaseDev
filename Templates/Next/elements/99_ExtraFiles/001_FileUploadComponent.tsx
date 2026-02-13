/*
path: index.tsx
completePath: front-end/components/FileUpload/index.tsx
unique_id: QZm2nTtL
*/
import React, { FunctionComponent } from 'react'
import { MuiFileInput } from 'mui-file-input'

import PublishIcon from '@mui/icons-material/Publish'
import CloseIcon from '@mui/icons-material/Close'

const AptugoImageUpload: FunctionComponent<any> = (props) => {
  const [value, setValue] = React.useState(props.value || null)

  const resize = async (imageObject, size) => {
    if (size && typeof size === 'number') {
      const canvas = document.createElement('canvas')
      const ctx = canvas.getContext('2d')
      const img = await createImageBitmap(imageObject)

      const ratio = size / img.width
      const width = (img.width * ratio + 0.5) | 0
      const height = (img.height * ratio + 0.5) | 0

      canvas.width = width
      canvas.height = height
      ctx.drawImage(img, 0, 0, width, height)

      const blob: BlobPart = await new Promise((rs) => canvas.toBlob(rs))
      const resizedFile = new File([blob], imageObject.name, imageObject)
      return resizedFile
    } else {
      return imageObject
    }
  }

  const handleChange = (newValue) => {
    if (props.resizeWidth) newValue = resize(newValue, props.resizeWidth)
    setValue(newValue)
    props.onChange(newValue)
  }

  return <MuiFileInput
    variant={props.variant}
    fullWidth
    placeholder={props.placeholder || props.label || null}
    value={value}
    InputProps={ {
      startAdornment: props.value && typeof props.value === 'string' ? <img src={props.value} style={ { width: '2rem' }} /> : <PublishIcon color="primary" />
    }}
    clearIconButtonProps={ {
      title: "Remove",
      children: <CloseIcon fontSize="small" />
    }}
    onChange={handleChange}
  />
}

export default AptugoImageUpload
