/*
path: FileUpload.tsx
completePath: front-end/components/FileUpload/FileUpload.tsx
unique_id: QZm2nTtL
*/
import PublishIcon from '@mui/icons-material/Publish'
import Box from '@mui/material/Box'
import FormControl from '@mui/material/FormControl'
import IconButton from '@mui/material/IconButton'
import Input from '@mui/material/Input'
import InputLabel from '@mui/material/InputLabel'

import PictureAsPdf from '@mui/icons-material/PictureAsPdf'
import SearchIcon from '@mui/icons-material/Search'
import React, { FunctionComponent, ReactEventHandler } from 'react'

const useStyles = {
  root: {
    display: 'flex',
    alignItems: 'center',
  },
  image: {
    maxHeight: '48px',
    margin: '5px 5px 0 0',
  },
  media: {
    maxHeight: '48px',
  },
  input: {
    display: 'none',
  },
  button: {
    position: 'absolute',
    right: 0,
    top: '-8px',
  },
  altVisual: {},
}

const altStyles = {
  root: {
    display: 'flex',
    alignItems: 'center',
    '& label': {
      transform: 'none !important',
      position: 'absolute',
      left: '50px',
      top: '22px',
    },
  },
  image: {
    maxHeight: '48px',
    margin: '5px 4px 5px auto',
    borderRadius: '5px',
    overflow: 'hidden'
  },
  media: {
    maxHeight: '48px',
  },
  media: {},
  input: {
    display: 'none',
  },
  altVisual: {
    background: '#f9f9f9',
    borderRadius: '5px',
    height: '56px',
    width: '100%',
    border: '1px solid rgb(196 196 196)',
    '&:after': {
      content: 'none',
    },
    '&:before': {
      content: 'none',
    },
    '& label': {
      left: '0px',
      top: '13px',
      '& p': {
        position: 'absolute',
        left: '50px',
        whiteSpace: 'nowrap',
        top: '6px',
        margin: '0',
        color: '#808080',
      },
    },
    '& input': {
      width: '1px',
      overflow: 'hidden',
      textIndent: '10px',
    },
  },
  button: {
    position: 'absolute',
    top: '-8px',
  },
}

function FileListItem(a) {
  a = [].slice.call(Array.isArray(a) ? a : arguments)
  for (var c, b = c = a.length, d = !0; b-- && d;) d = a[b] instanceof File
  if (!d) throw new TypeError("expected argument to FileList is File or array of File objects")
  for (b = (new ClipboardEvent("")).clipboardData || new DataTransfer; c--;) b.items.add(a[c])
  return b.files
}

const AptugoImageUpload: FunctionComponent<any> = (props) => {
  const classes = props.visual === 'standard' ? useStyles : altStyles

  const [state, setState] = React.useState({
    uploading: false,
    file: null,
    selectedFile: null,
    fileName: props.value,
    accept: props.accept || 'image/*',
    visual: props.visual || 'staandard',
  })

  const handleUploadClick = (event) => {
    event.persist()

    const inputElement = event.target as HTMLInputElement
    const origfileList:FileList = inputElement.files
    const file = origfileList[0]
    const reader = new FileReader()

    reader.onloadend = async function (e) {
      let selectedFile = [reader.result]
      if (resizeWidth && typeof resizeWidth === 'number') {
        const canvas = document.createElement('canvas')
        const ctx = canvas.getContext('2d')
        const img = await createImageBitmap(file)
          
        const ratio = resizeWidth / img.width
        const width = img.width * ratio + .5 | 0
        const height = img.height * ratio + .5 | 0
      
        canvas.width = width
        canvas.height = height
        ctx.drawImage(img, 0, 0, width, height)
          
        const blob:BlobPart = await new Promise(rs => canvas.toBlob(rs))
        const resizedFile = new File([blob], file.name, file)
        
        const fileList = FileListItem([resizedFile])
        
        event.target.onchange = null
        event.target.files = fileList
        event.target.onchange = handleUploadClick
      }

      setState({
        ...state,
        file: file,
        fileName: file.name,
        uploading: false,
        selectedFile: [selectedFile],
      })
      
      props.onChange(event)
    }

    setState({
      ...state,
      uploading: true,
    })

    reader.readAsDataURL(file)
  }

  const imageResetHandler = () => {
    setState({
      ...state,
      selectedFile: null,
    })
  }

  const renderUploadedState = () => {
    if (!state.selectedFile && !state.fileName && !props.value) return null
    if (state.file && state.file.type === 'application/pdf') return <PictureAsPdf sx={classes.image} />
    var src = state.selectedFile || `/img/${state.fileName}`
    if (!state.selectedFile && !state.fileName) {
      if (Object.keys(props.value).length === 0) return
      src = `/img/${props.value}`
    }
    return (
      <Box sx={classes.image} onClick={imageResetHandler}>
        <img style={classes.media} src={src} />
      </Box>
    )
  }

  const standardVisual = () => {
    return (
      <Box className={props.className && props.className} sx={classes.root}>
        {renderUploadedState()}
        <FormControl margin="normal" fullWidth variant={props.variant}>
          <InputLabel htmlFor="component-upload">{props.label}</InputLabel>
          <Input
            value={state.fileName || ''}
            id="component-upload-standard"
            placeholder={props.placeholder || null}
            endAdornment={
              <label>
                <input accept={state.accept} style={classes.input} multiple type="file" onChange={handleUploadClick} />
                <IconButton component="span" sx={classes.button} aria-label="Search">
                  <SearchIcon />
                </IconButton>
              </label>
            }
          />
        </FormControl>
      </Box>
    )
  }

  const alternativeVisual = () => {
    return (
      <FormControl margin="normal" fullWidth variant={props.variant} sx={classes.root}>
        <Input
          sx={classes.altVisual}
          value={state.fileName || ''}
          id="component-upload-alternate"
          placeholder={props.placeholder || null}
          startAdornment={
            <label>
              <input accept={state.accept} style={classes.input} multiple type="file" onChange={handleUploadClick} />
              <IconButton component="span" sx={classes.button} aria-label="Search">
                <PublishIcon color="primary" />
              </IconButton>
              <p>{props.label}</p>
            </label>
          }
          endAdornment={renderUploadedState()}
        />
      </FormControl>
    )
  }

  return state.visual === 'standard' ? standardVisual() : alternativeVisual()
}

export default AptugoImageUpload
