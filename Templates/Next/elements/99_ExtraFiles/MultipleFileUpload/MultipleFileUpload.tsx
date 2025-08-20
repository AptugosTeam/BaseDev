/*
path: MultipleFileUpload.tsx
completePath: >-
  /Users/Shared/Dev/BaseDev/Templates/Next/elements/99_ExtraFiles/MultipleFileUpload/MultipleFileUpload.tsx
keyPath: elements/99_ExtraFiles/MultipleFileUpload/MultipleFileUpload.tsx
unique_id: ploiIy7s
*/

import DeleteForeverIcon from '@mui/icons-material/DeleteForever'
import React, { FunctionComponent, useCallback } from 'react'
import { useDropzone } from 'react-dropzone'

const MultipleFileUpload: FunctionComponent<any> = (props) => {
  const [files, setFiles] = React.useState(props.files || [])

  React.useEffect(() => {
    if (props.onMount && props.onMount.length > 0 && Object.keys(props.onMount[0]).length > 0) {
      setFiles(props.onMount)
    }
  }, [props.onMount])

  const onDrop = useCallback((acceptedFiles) => {
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
    // console.log('Files:', [...files, ...newFile])
  }, [])

  const cleanQueue = () => {
    setFiles([])
    if (props.onCleanQueue) {
      props.onCleanQueue()
    }
  }

  const { getRootProps, getInputProps, isDragActive } = useDropzone({ onDrop })

  return (
    <section className={props.className}>
      <div {...getRootProps()}>
        <input {...getInputProps()} />
        {isDragActive ? <p>Drop the files here ...</p> : <p>{props.innerText || "Drag 'n' drop some files here, or click to select files"}</p>}
      </div>
      <aside className="thumbsContainer">
        {files.map((file, index) => {
          return (
            <div
              className="thumbnail"
              // onClick={() => { setHighlight(file) }}
            >
              <DeleteForeverIcon
                className="deleteIcon"
                onClick={(e) => {
                  cleanQueue()
                  // removeImage(file, e)
                }}
              />
              <div className="thumbnailImageContainer">
                <img className="thumbnailImage" src={file.Image ? `/img/${file.Image}` : file.preview} onClick={(e) => e.stopPropagation()} />
              </div>
            </div>
          )
        })}
      </aside>
    </section>
  )
}

export default MultipleFileUpload