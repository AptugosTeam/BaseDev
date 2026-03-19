/*
path: downloadFile.tpl
type: file
unique_id: gS25FE
icon: f:downloadFile.svg
helpText: Allows downloading files from a specified URL
options:
  - name: variableName
    display: Function Name
    type: text
    options: ''  
settings:
  - name: Packages
    value: '"file-saver": "latest",'
children: []
*/
{% set bpr %}
import { saveAs } from 'file-saver'
import axios from 'axios'
{% endset %}
{{ save_delayed('bpr',bpr) }}

const {{ element.values.variableName }} = async (url, fileName) => {
  try {
    const response = await axios.get('/img/' + url, {
      responseType: 'blob', 
    })
    saveAs(response.data, fileName) 
  } catch (error) {
    console.error('Error al descargar el archivo:', error)
  }
}