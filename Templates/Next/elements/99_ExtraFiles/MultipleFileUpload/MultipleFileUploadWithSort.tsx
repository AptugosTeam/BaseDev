/*
path: MultipleFileUploadWithSort.tsx
completePath: front-end/components/MultipleFileUpload/MultipleFileUploadWithSort.tsx
unique_id: T3LtVHwT
*/
import CloseIcon from '@mui/icons-material/Close';
import DeleteForeverIcon from '@mui/icons-material/DeleteForever';
import React, { FunctionComponent } from 'react';
import { useDropzone } from 'react-dropzone';
import { DragDropContext, Droppable, Draggable } from 'react-beautiful-dnd';

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
  const [files, setFiles] = React.useState(props.files || []);
  const { thumbnails } = props;
  const [highlight, setHighlight] = React.useState(null);
  const { getRootProps, getInputProps } = useDropzone({
    accept: 'image/*',
    onDrop: (acceptedFiles) => {
      if (props.maxFiles && files.length + acceptedFiles.length > props.maxFiles) {
        console.error('File limit exceeded!');
        return;
      }
      const newFile = acceptedFiles.map((file) =>
        Object.assign(file, {
          id: `${file.name}-${file.lastModified}`,
          preview: URL.createObjectURL(file),
        })
      )

      setFiles([...files, ...newFile])

      if (thumbnails?.resizeWidth) {
        Promise.all(
          acceptedFiles.map(async (file) => {
            const resizedFile = await resizeFile(file, thumbnails.resizeWidth)
            Object.assign(resizedFile, {
              id: `${resizedFile.name}-${resizedFile.lastModified}`,
              path: resizedFile.name,
              preview: URL.createObjectURL(resizedFile),
            })
            return resizedFile
          })
        )
          .then((thumbFiles) => setFiles((prev) => {
            return [...prev, ...thumbFiles]
          }))
          .catch((err) => {
            console.error(err);
            throw new Error(err);
          });
      }
    },
  });

  const removeImage = (file, e) => {
    e.stopPropagation();
    const newFiles = files.filter((fl) => fl.id !== file.id);
    setFiles(newFiles);
  };

  const handleOnDragEnd = (result) => {
    if (!result.destination) return;

    const reorderedFiles = Array.from(files);
    const [movedFile] = reorderedFiles.splice(result.source.index, 1);
    reorderedFiles.splice(result.destination.index, 0, movedFile);

    setFiles(reorderedFiles);

    if (props.onOrderChange) props.onOrderChange(reorderedFiles);
  };

  React.useEffect(() => {
    if (props.onChange) props.onChange(files);
  }, [files]);

  React.useEffect(() => {
    setFiles(props.files || []);
  }, [props.files]);

  return (
    <section className={props.className}>
      {highlight && (
        <div
          className="imageLightboxEncloser"
          onClick={() => {
            setHighlight(null);
          }}
        >
          <div className="imageLightbox">
            <img className="imageHighlight" src={URL.createObjectURL(highlight)} />
            <CloseIcon />
          </div>
        </div>
      )}
      <div {...getRootProps({ className: 'dropzone' })}>
        <input {...getInputProps()} />
        <picture>
          <img
            src={props.src ? props.src : ''}
            alt={props.alt ? props.alt : 'Image'}
            width={props.width ? props.width : '40'}
            height={props.height ? props.height : '40'}
          />
        </picture>
        <p>{props.innerText ? props.innerText : "Drag 'n' drop some files here, or click to select files"}</p>
      </div>
      <DragDropContext onDragEnd={handleOnDragEnd}>
        <Droppable droppableId="files" direction="horizontal">
          {(provided) => (
            <aside className="thumbsContainer" {...provided.droppableProps} ref={provided.innerRef}>
              {files
                .filter((file) => !file?.name?.startsWith('thumb_') && !file?.Name?.startsWith('thumb_'))
                .map((file, index) => (
                  <Draggable key={file.id} draggableId={file.id} index={index}>
                    {(provided) => (
                      <div
                        className="thumbnail"
                        ref={provided.innerRef}
                        {...provided.draggableProps}
                        {...provided.dragHandleProps}
                        onClick={() => {
                          setHighlight(file);
                        }}
                      >
                        <DeleteForeverIcon
                          className="deleteIcon"
                          onClick={(e) => {
                            removeImage(file, e);
                          }}
                        />
                        <div className="thumbnailImageContainer">
                          <img className="thumbnailImage" src={file.Image ? `/img/${file.Image}` : file.preview} onClick={(e) => e.stopPropagation()} />
                        </div>
                      </div>
                    )}
                  </Draggable>
                ))}
              {provided.placeholder}
            </aside>
          )}
        </Droppable>
      </DragDropContext>
    </section>
  );
};

export default MultipleFileUpload;