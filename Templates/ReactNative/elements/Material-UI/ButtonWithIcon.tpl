/*
path: ButtonWithIcon.tpl
type: file
unique_id: DXZgugbc
icon: ico-icon-button
helpText: Shows a button with an icon
children: []
options:
  - name: texto
    display: Texto del Boton
    type: text
    options: ''
  - name: icon
    display: Icono
    type: dropdown
    options: Delete;Add;Plus
*/
{% set bpr %}
import Button from '@mui/material/Button'
import {{ element.values.icon }}Icon from '@mui/icons-material/{{ element.values.icon }}'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<Button
        variant="contained"
        color="secondary"
        className={classes.button}
        startIcon={<{{ element.values.icon }}Icon />}
      >
        {{ element.values.texto }}
      </Button>