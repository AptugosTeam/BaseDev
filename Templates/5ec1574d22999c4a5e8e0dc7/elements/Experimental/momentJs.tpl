/*
path: momentJs.tpl
type: file
unique_id: itDI19JL
icon: ico-moment
options:
  - name: variableName
    display: Variable Name to Assign
    type: text
    options: ''
  - name: arrayVariable
    display: Array to Format
    type: text
    options: ''
*/
const {{ element.values.variableName }} = {{ element.values.arrayVariable }}.map((reserva, index) => {
const fechaISO = reserva.Fecha.split('T')[0] // '2024-07-19'
const partes = fechaISO.split('-') // ['2024', '07', '19']
const fechaInvertida = `${partes[2]}-${partes[1]}-${partes[0]}` // '19-07-2024'
return fechaInvertida})