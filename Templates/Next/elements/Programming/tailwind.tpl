/*
path: tailwind.tpl
keyPath: elements/Programming/tailwind.tpl
unique_id: TJfy24xg
options:
extraFiles:
  - source: 'elements/Programming/tailwind.config.js'
    destination: 'tailwind.config.js'
  - source: 'elements/Programming/postcss.config.js'
    destination: 'postcss.config.js'
settings:
  - name: Packages
    value: '"tailwindcss": "^3.4.10","autoprefixer": "^10.4.20",'
children: []
*/
{% set directives %}
@tailwind base;
@tailwind components;
@tailwind utilities;
{% endset %}
{{ add_setting('directives', directives)}}
{{ dump(directives) }}