/*
path: ReactWindow.tpl
type: file
unique_id: ReactWindow
icon: f:csvImport.svg
helpText: React window works by only rendering part of a large data set
options:
  - name: size
    display: Select the size of the window
    type: dropdown
    options: FixedSizeList;VariableSizeList;FixedSizeGrid;VariableSizeGrid
  - name: height
    display: Height of the window
    type: text
    options: ''
  - name: width
    display: Width of the window
    type: text
    options: ''
  - name: itemCount
    display: Set the number of items to display
    type: text
    options: ''
  - name: itemSize
    display: Set the size of each item
    type: text
    options: ''
  - name: overscanCount
    display: Set the overscan count for the window
    type: text
    options: ''
  - name: className
    display: ClassName
    type: text
    options: ''
  - name: AutoSizer
    display: Enable auto-sizing
    type: checkbox
    options: ''
    settings: 
      default: false
  - name: code
    display: Code before render
    type: function
    options: ''
settings:
  - name: Packages
    value: '"react-window": "^1.8.10",'
  - name: Packages
    value: |-
      {% if element.values.AutoSizer %}
      "react-virtualized-auto-sizer": "^1.0.24",
      {% endif %}
children: []
*/
{% set importType = '' %}
{% if element.values.size in ['FixedSizeList', 'VariableSizeList'] %}
  {% set importType = 'List' %}
{% elseif element.values.size in ['FixedSizeGrid', 'VariableSizeGrid'] %}
  {% set importType = 'Grid' %}
{% endif %}
{% set bpr %}
import { {{element.values.size|default('FixedSizeList')}} as {{ importType | default('List')}} } from 'react-window'
{% if element.values.AutoSizer %}
import AutoSizer from "react-virtualized-auto-sizer"
{% endif %}
{% endset %}
{{ save_delayed('bpr',bpr) }}

{% if element.values.AutoSizer %}
<AutoSizer>
  {({ width, height }) => (
{% endif %}
    <{{ importType }}
      height={ {{ element.values.height | default(element.values.AutoSizer ? 'height' : '400') }} }
      width={ {{ element.values.width | default(element.values.AutoSizer ? 'width' : '300') }} }
      itemCount={ {{ element.values.itemCount | default('50') }} }
      itemSize={ {{ element.values.size in ['VariableSizeList', 'VariableSizeGrid'] 
        ? "() => " ~ element.values.itemSize | default('50') 
        : element.values.itemSize | default('50') }} }
      {% if element.values.className %}
      className={ {{ element.values.className }} }
      {% endif %}
      {% if element.values.overscanCount %}
      overscanCount={ {{ element.values.overscanCount }} }
      {% endif %}
    >
    {({ index, style }) => {
        {{element.values.code}}

      return (
         <div style={style}>
         {{ content|raw }}
         </div>
      )
      }}
    </{{ importType }}>
{% if element.values.AutoSizer %}
  )}
</AutoSizer>
{% endif %}