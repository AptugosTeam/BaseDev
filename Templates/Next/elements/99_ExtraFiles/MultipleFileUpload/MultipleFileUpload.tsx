/*
path: MultipleFileUpload.tsx
keyPath: elements/99_ExtraFiles/MultipleFileUpload/MultipleFileUpload.tsx
unique_id: ploiIy7s
*/
import { Icon } from '@iconify/react/dist/iconify.js'
import DeleteForeverIcon from '@mui/icons-material/DeleteForever'
import React, { FunctionComponent, useMemo } from 'react'
import { useDropzone } from 'react-dropzone'

const MultipleFileUpload: FunctionComponent<any> = (props) => {
  const [files, setFiles] = React.useState(props.files || [])

  React.useEffect(() => {
    if (props.onMount && props.onMount.length > 0 && Object.keys(props.onMount[0]).length > 0) {
      setFiles(props.onMount)
    }
  }, [props.onMount])

  const onDrop = (acceptedFiles) => {
    const newFile = acceptedFiles.map((file) =>
      Object.assign(file, {
        id: `${file.name}-${file.lastModified}`,
        preview: URL.createObjectURL(file),
      }),
    )

    setFiles([...files, ...newFile])

    if (props.onChange) {
      props.onChange([...files, ...newFile])
    }
  }

  const cleanQueue = () => {
    setFiles([])
    if (props.onCleanQueue) {
      props.onCleanQueue()
    }
  }

  const { getRootProps, getInputProps, isDragActive } = useDropzone({ onDrop })

  const thumbnailSource = useMemo(() => {
    return files.map((file, index) => {
      if (props.matchFieldName) {
        return file[props.matchFieldName] ? file[props.matchFieldName] : file.Image ? `/img/${file.Image}` : file.preview
      } else {
        const fileType = file.type.split('/')[0]
        switch (fileType) {
          case 'image':
            const thumbURL = file.Image ? `/img/${file.Image}` : file.preview
            return <img className="thumbnailImage" src={thumbURL} onClick={(e) => e.stopPropagation()} />
          case 'audio':
            return <Icon icon="material-symbols:audio-file-outline" width="48" height="48" />
          case 'video':
            return <Icon icon="mdi:video" width="48" height="48" />
          case 'application':
            return <Icon icon="mdi:file-document" width="48" height="48" />
          default:
            return <Icon icon="mdi:file" width="48" height="48" />
        }
      }
    })
  }, [files])

  return (
    <section className={`${props.className || 'fileDropUploader'} ${isDragActive ? 'dragActive' : ''}`}>
      <div {...getRootProps()}>
        <input {...getInputProps()} />
        {isDragActive ? <p>Drop the files here ...</p> : <p>{props.innerText || "Drag 'n' drop some files here, or click to select files"}</p>}
      </div>
      <aside className="thumbsContainer">
        {thumbnailSource.map((file, index) => {
          return (
            <div className="thumbnail" key={`thumb-${index}`}>
              <DeleteForeverIcon
                className="deleteIcon"
                onClick={cleanQueue}
              />
              <div className="thumbnailImageContainer">
                {file}
              </div>
            </div>
          )
        })}
      </aside>
    </section>
  )
}

export default MultipleFileUpload
