import PublishIcon from '@mui/icons-material/Publish'
import Box from '@mui/material/Box'
import FormControl from '@mui/material/FormControl'
import IconButton from '@mui/material/IconButton'
import Input from '@mui/material/Input'
import InputLabel from '@mui/material/InputLabel'
import PictureAsPdf from '@mui/icons-material/PictureAsPdf'
import React, { FunctionComponent } from 'react'

const useStyles = {
  root: {
    display: 'flex',
    alignItems: 'center',
    position: 'relative',
  },
  image: {
    maxHeight: '40px', // Tamaño de la miniatura
    marginRight: '10px', // Espacio entre la imagen y el texto
  },
  media: {
    maxHeight: '40px',
    width: '40px', // Tamaño de la imagen
    objectFit: 'cover', // Asegura que la imagen se recorte correctamente
    borderRadius: '4px', // Bordes redondeados
  },
  input: {
    display: 'none',
  },
  button: {
    position: 'absolute',
    right: 0,
    top: '50%',
    transform: 'translateY(-50%)', // Centrado verticalmente
  },
}

const AptugoImageUpload: FunctionComponent<any> = (props) => {
  const classes = useStyles
  const [state, setState] = React.useState({
    uploading: false,
    file: null,
    selectedFile: null,
    fileName: props.value,
    accept: props.accept || 'image/*',
    visual: props.variant || 'standard',
  })

  const handleUploadClick = (event) => {
    event.persist()

    const inputElement = event.target as HTMLInputElement
    const origfileList: FileList = inputElement.files
    const file = origfileList[0]
    const reader = new FileReader()

    reader.onloadend = function (e) {
      let selectedFile = [reader.result]
      setState({
        ...state,
        file: file,
        fileName: file.name,
        uploading: false,
        selectedFile: selectedFile,
      })

      props.onChange(event)
    }

    setState({
      ...state,
      uploading: true,
    })

    reader.readAsDataURL(file)
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
      <Box sx={classes.image}>
        <img style={classes.media} src={src} />
      </Box>
    )
  }

  return (
    <FormControl margin="normal" fullWidth variant="outlined">
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

export default AptugoImageUpload
