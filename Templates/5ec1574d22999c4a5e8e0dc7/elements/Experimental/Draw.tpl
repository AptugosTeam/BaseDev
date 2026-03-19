/*
path: Draw.tpl
type: file
unique_id: 0drawnoH
icon: f:ContentEditor.svg
children: []
settings:
  - name: Packages
    value: '"react-canvas-draw": "^1.2.1",'
*/
{% set bpr %}
import CanvasDraw from "react-canvas-draw"
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% include includeTemplate('useRef.tpl') with { element: { values: { 'variableName': 'canvasRef' } } } %}
{% include includeTemplate('useState.tpl') with { element: { values: { 'variableName': 'canvasProps', 'defaultValue': '{ canvasWidth: 1024, canvasHeight: 768, brushRadius: 5 }'}}} %}
<CanvasDraw {...canvasProps} ref={canvasRef} />