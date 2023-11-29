/*
path: DraggableTree.tpl
icon: f:draggableIcon.svg
keyPath: elements/Experimental/DraggableTree.tpl
unique_id: BmQXdTbm
options:
  - name: tree
    display: Tree
    type: text
  - name: onSave
    display: On Save Tree
    type: function
  - name: onUpdate
    display: On Update Node
    type: function
  - name: onDelete
    display: On Delete Node
    type: function
  - name: onChangeType
    display: On Change Node Type
    type: function
    advanced: true
  - name: ClassName
    display: ClassName
    type: styles
    options: ''
settings:
  - name: Packages
    value: '"react-dnd": "16.0.1","@minoru/react-dnd-treeview": "3.4.4",'
extraFiles:
  - source: 'elements/Experimental/DraggableTree/DraggableTree.tsx'
    destination: 'front-end/components/DraggableTree/DraggableTree.tsx'
  - source: 'elements/Experimental/DraggableTree/CustomNode.tsx'
    destination: 'front-end/components/DraggableTree/CustomNode.tsx'
  - source: 'elements/Experimental/DraggableTree/draggabletree.module.scss'
    destination: 'front-end/components/DraggableTree/draggabletree.module.scss'
  - source: 'elements/Experimental/DraggableTree/index.tsx'
    destination: 'front-end/components/DraggableTree/index.tsx'
*/
{% set bpr %}
import DraggableTree from '@components/DraggableTree'
{% endset %}
{{ save_delayed('bpr',bpr)}}
<DraggableTree
  {% if element.values.tree %}tree={ {{ element.values.tree }} }{% endif %}
  
  {% if element.values.ClassName %}className={ {{ element.values.ClassName }} } {% endif %}  
  {% if element.values.onSave %}onSave={ {{ element.values.onSave }} }{% endif %}
  {% if element.values.onSave %}onUpdate={ {{ element.values.onUpdate }} }{% endif %}
  {% if element.values.onSave %}onDelete={ {{ element.values.onDelete }} }{% endif %}
  {% if element.values.onSave %}onChangeType={ {{ element.values.onChangeType }} }{% endif %}
/>