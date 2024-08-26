/*
path: Shadcn.tpl
completePath: elements/Shadcn-UI/Shadcn.tpl
type: file
unique_id: ShadcnAV
icon: f:ReactMediaPlayer.svg
options:
  - name: style
    display: Which style would you like to use?
    type: dropdown
    options: 
      return [['default', 'Default'], ['new-york', 'New York']]
  - name: baseColor
    display: Which color would you like to use as base color?
    type: dropdown
    options: 
      return [['slate', 'Slate'], ['gray', 'Gray'], ['zinc', 'Zinc'], ['neutral', 'Neutral'], ['stone', 'Stone']]
  - name: colorsVariables
    display: Would you like to use CSS variables for colors?
    type: dropdown
    options: 
      return [['true', 'Yes'], ['false', 'No']]
children: []
extraFiles:
  - source: 'elements/Shadcn-UI/components.json'
    destination: 'components.json'
settings:
  - name: npmScripts
    value: '"init-shadcn": "npx shadcn-ui@latest init",'
*/
{% set sheetJson %}
{
  "$schema": "https://ui.shadcn.com/schema.json",
  "style": "{{element.values.style|default('default')}}",
  "rsc": true,
  "tsx": true,
  "tailwind": {
    "config": "./",
    "css": "./src/components/Themes/layout.scss",
    "baseColor": "{{element.values.baseColor|default('slate')}}",
    "cssVariables": {{element.values.colorsVariables|default('false')}},
    "prefix": ""
  },
  "aliases": {
    "components": "ui",
    "utils": "@/lib/utils"
  }
}
{% endset %}
{{ add_setting('sheetJson', sheetJson)}}