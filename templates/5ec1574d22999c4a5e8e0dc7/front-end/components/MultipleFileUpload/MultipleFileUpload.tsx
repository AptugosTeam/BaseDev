/*
path: MultipleFileUpload.tsx
completePath: front-end/components/MultipleFileUpload/MultipleFileUpload.tsx
unique_id: T3LtVHwT
*/
import CloseIcon from '@mui/icons-material/Close'
import DeleteForeverIcon from '@mui/icons-material/DeleteForever'
import React, { FunctionComponent } from 'react'
import {useDropzone} from 'react-dropzone'


const resizeFile = async (file, resizeWidth) => {
  const canvas = document.createElement('canvas');
  const ctx = canvas.getContext('2d');
  const img = await createImageBitmap(file);

  const ratio = resizeWidth / img.width;
  const width = (img.width * ratio + 0.5) | 0;
  const height = (img.height * ratio + 0.5) | 0;

  canvas.width = width;
  canvas.height = height;
  ctx.drawImage(img, 0, 0, width, height);

  const blob: BlobPart = await new Promise((rs) => canvas.toBlob(rs));
  const resizedFile = new File([blob], `thumb_${file.name}`, file);

  return resizedFile;
};

const MultipleFileUpload: FunctionComponent<any> = (props) => {
  const [files, setFiles] = React.useState(props.files || [])
  const { thumbnails } = props;
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

      setFiles([...files, ...newFile]);

      if (thumbnails?.resizeWidth) {
        Promise.all(
          acceptedFiles.map(async (file) => {
            const resizedFile = await resizeFile(file, thumbnails.resizeWidth);
            Object.assign(resizedFile, {
              path: resizedFile.name,
              preview: URL.createObjectURL(resizedFile)
            })
            return resizedFile
          })
        )
          .then((thumbfiles) =>
            setFiles((prev) => {
              return [...prev, ...thumbfiles];
            })
          )
          .catch((err) => {
            console.error(err);
            throw new Error(err);
          });
      }     
    }
  })

  const removeImage = (file, e: Event) => {
    e.stopPropagation()
    const filesToRemove = files.filter((fl) => {
      if (fl?.name?.startsWith('thumb_') || fl?.Name?.startsWith('thumb_') ) {
        const originalFileName = fl?.name?.substring(6) || fl?.Name?.substring(6);
        const filename = file?.name || file?.Name;
        return originalFileName === filename || fl === file;
      } else {
        return fl === file;
      }
    });
    const newFiles = files.filter((fl) => !filesToRemove.includes(fl));
    setFiles([...newFiles])
    return false
  }

  const thumbs = files
    .filter((file) => !file?.name?.startsWith('thumb_') && !file?.Name?.startsWith('thumb_'))
    .map(file => (
      <div className="thumbnail" key={file.name} onClick={() => { sethighlight(file)} }>
        <DeleteForeverIcon className="deleteIcon" onClick={(e) => { removeImage(file, e) }}/>
        <div className="thumbnailImageContainer">
          <img
            className="thumbnailImage"
            src={file.Image ? `${file.Image}` : file.preview}
          />
        </div>
      </div>
    ));

  React.useEffect(() => {
    if (props.onChange) props.onChange(files)
  }, [files])

  React.useEffect(() => {
    setFiles(props.files)
  }, [props.files])

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
