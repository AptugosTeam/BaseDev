/*
path: FileUpload.tsx
completePath: >-
  /Users/ari/Aptugo/BaseDev/Templates/5ec1574d22999c4a5e8e0dc7/front-end/components/FileUpload/FileUpload.tsx
keyPath: front-end/components/FileUpload/FileUpload.tsx
unique_id: 5tKTDLUI
*/
import PublishIcon from '@mui/icons-material/Publish'
import Box from '@mui/material/Box'
import FormControl from '@mui/material/FormControl'
import IconButton from '@mui/material/IconButton'
import Input from '@mui/material/Input'
import InputLabel from '@mui/material/InputLabel'
import PictureAsPdf from '@mui/icons-material/PictureAsPdf'
import React, { FunctionComponent } from 'react'

const useStyles = {
  container: {
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'space-between',
    borderRadius: '6px',
    padding: '10px',
    cursor: 'pointer',
    position: 'relative',
    margin: '13px 0px',
  },
  image: {
    maxHeight: '40px',
    maxWidth: '40px',
    objectFit: 'cover',
    borderRadius: '4px',
    marginRight: '10px',
  },
  label: {
    flex: 1,
    fontSize: '16px',
  },
  hiddenInput: {
    display: 'none',
  },
  button: {
    backgroundColor: 'transparent',
  },
}

const AptugoImageUpload: FunctionComponent<any> = (props) => {
  const classes = useStyles;
  const [file, setFile] = React.useState<File | null>(null);
  const [preview, setPreview] = React.useState<string | null>(null);

  // Extraemos los props antes del return
  const { value, onChange, borderColor, labelColor, label, iconColor } = props;

  React.useEffect(() => {
    if (value) {
      setPreview(value.startsWith("http") ? value : `/img/${value}`);
    }
  }, [value]);

  const handleUploadClick = (event: React.ChangeEvent<HTMLInputElement>) => {
    if (!event.target.files || event.target.files.length === 0) return;
  
    const selectedFile = event.target.files[0];
    console.log("Archivo seleccionado:", selectedFile);
  
    const reader = new FileReader();
  
    reader.onload = () => {
      const result = reader.result;
      
      console.log("Contenido de reader.result:", result);
      
      if (!result || typeof result !== "string") {
        console.error("Error: reader.result es inválido", result);
        return;
      }
    
      console.log("Actualizando preview...");
      setFile(selectedFile);
      setPreview(result);
    };
    
    
  
    reader.onerror = (error) => console.error("Error al leer el archivo:", error);
  
    reader.readAsDataURL(selectedFile);
  };
  

  // Generamos los estilos dinámicos antes del return
  const dynamicStyles = {
    container: {
      ...classes.container,
      border: `1px solid ${borderColor || 'rgb(147, 147, 147)'}`,
    },
    label: {
      ...classes.label,
      color: labelColor || 'rgb(147, 147, 147)',
    },
    icon: {
      color: iconColor || 'rgb(147, 147, 147)', // Azul por defecto
    },
  };

  return (
    <Box sx={dynamicStyles.container} onClick={() => document.getElementById("file-input")?.click()}>
      {typeof preview === "string" && preview.length > 0 && (
  <img src={preview} alt="Preview" style={classes.image} />
)}


      <span style={dynamicStyles.label}>{label || "Selecciona un archivo"}</span>

      <IconButton component="span" sx={classes.button}>
        <PublishIcon sx={dynamicStyles.icon} />
      </IconButton>

      <input
        type="file"
        id="file-input"
        style={classes.hiddenInput}
        accept="image/*"
        onChange={handleUploadClick}
      />
    </Box>
  );
};

export default AptugoImageUpload;

