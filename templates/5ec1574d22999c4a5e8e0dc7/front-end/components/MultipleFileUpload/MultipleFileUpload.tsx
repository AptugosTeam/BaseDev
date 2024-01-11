/*
path: MultipleFileUpload.tsx
completePath: front-end/components/MultipleFileUpload/MultipleFileUpload.tsx
unique_id: T3LtVHwT
*/
import CloseIcon from '@mui/icons-material/Close'
import DeleteForeverIcon from '@mui/icons-material/DeleteForever'
import React, { FunctionComponent } from 'react'
import {useDropzone} from 'react-dropzone'

const MultipleFileUpload: FunctionComponent<any> = (props) => {
  const [files, setFiles] = React.useState(props.files || [])
  const [highlight, sethighlight] = React.useState(null)
  const {getRootProps, getInputProps} = useDropzone({
    accept: 'image/*',
    onDrop: acceptedFiles => {
      if ( props.maxFiles && files.length + acceptedFiles.length > props.maxFiles) {
        console.error('File limit exceeded!');
        return;
      }
      const newFile = acceptedFiles.map(file => Object.assign(file, {
        preview: URL.createObjectURL(file)
      }))
      files.push(...newFile)
      setFiles([...files])
    }
  })

  const removeImage = (file, e: Event) => {
    e.stopPropagation()
    const newFiles = files.filter(fl => fl !== file)
    setFiles([...newFiles])
    return false
  }

  const thumbs = files.map(file => (
    <div className="thumbnail" key={file.name} onClick={() => { sethighlight(file)} }>
      <DeleteForeverIcon className="deleteIcon" onClick={(e) => { removeImage(file, e) }}/>
      <div className="thumbnailImageContainer">
        <img className="thumbnailImage" src={file.Picture ? `/img/${file.Picture}` : file.preview} />
      </div>
    </div>
  ));

  React.useEffect(() => {
    if (props.onChange) props.onChange(files)
  }, [files])

  return <section className={props.className}>
    {highlight &&
      <div className='imageLightboxEncloser' onClick={() => { sethighlight(null)}}><div className='imageLightbox'><img className='imageHighlight' src={URL.createObjectURL(highlight)} /><CloseIcon /></div></div>
    }
    <div {...getRootProps({className: "dropzone"})}>
      <input {...getInputProps()} />
      <picture>
        <img
          src={props.src ? props.src: ""}
          alt={props.alt ? props.alt : "Image"}
          width={props.width ? props.width : "40"}
          height={props.height ? props.height : "40"}
        />
      </picture>
      <p>{props.innerText ? props.innerText : "Drag 'n' drop some files here, or click to select files"}</p>
    </div>
    <aside className="thumbsContainer" >
      {thumbs}
    </aside>
  </section>
}

export default MultipleFileUpload
