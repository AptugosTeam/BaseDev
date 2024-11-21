/*
path: callGameObjectMethod.tpl
keyPath: elements/Games/State/callGameObjectMethod.tpl
unique_id: W5vrwrUT
icon: ico-get-data
options:
  - name: method
    display: Method to call
    type: dropdown
    options: ['add','getAt','getData','getParentContainer','removeAt','setAlpha','setData','setDepth','setFrame','setPosition']
  - name: object
    display: Source Object
    type: text
  - name: dataName
    display: Source Data 
    type: text
    settings:
      propertyCondition: method
      condition: getData
  - name: indexToRetrieve
    display: Index Number
    type: text
    settings:
      propertyCondition: method
      condition: getAt
  - name: frameNumber
    display: New Frame Number
    type: text
    settings:
      propertyCondition: method
      condition: setFrame
  - name: newData
    display: Object's data
    type: code
    settings:
      propertyCondition: method
      condition: setData
  - name: newDepth
    display: Object's depth
    type: text
    settings:
      propertyCondition: method
      condition: setDepth
  - name: addObject
    display: Game Object to Add
    type: text
    settings:
      propertyCondition: method
      condition: add
  - name: removeIndex
    display: Index to remove
    type: text
    settings:
      propertyCondition: method
      condition: removeAt
  - name: newAlpha
    display: New Alpha value
    type: text
    settings:
      propertyCondition: method
      condition: setAlpha
  - name: setPosition
    display: New Position (x,y)
    type: text
    settings:
      propertyCondition: method
      condition: setPosition
  - name: destinationVariable
    display: Destination Variable
    type: text
    settings:
      propertyCondition: method
      condition: getData,getAt
*/
{% if element.values.method == 'add' %}
  {{ element.values.object }}.add({{ element.values.addObject }})
{% elseif element.values.method == 'getAt' %}
  const {{ element.values.destinationVariable }} = {{ element.values.object }}.getAt({{ element.values.indexToRetrieve }})
{% elseif element.values.method == 'getData' %}
  const {{ element.values.destinationVariable }} = {{ element.values.object }}.getData({{ element.values.dataName | textOrVariableInCode }})
{% elseif element.values.method == 'getParentContainer' %}
  const {{ element.values.destinationVariable }} = {{ element.values.object }}.parentContainer
{% elseif element.values.method == 'removeAt' %}
  {{ element.values.object }}.removeAt({{ element.values.removeIndex }})
{% elseif element.values.method == 'setAlpha' %}
  {{ element.values.object }}.setAlpha({{ element.values.newAlpha }})
{% elseif element.values.method == 'setData' %}
  {{ element.values.object }}.setData({{ element.values.newData }})
{% elseif element.values.method == 'setDepth' %}
  {{ element.values.object }}.setDepth({{ element.values.newDepth }})
{% elseif element.values.method == 'setFrame' %}
  {{ element.values.object }}.setFrame({{ element.values.frameNumber }})
{% elseif element.values.method == 'setPosition' %}
  {{ element.values.object }}.setPosition({{ element.values.setPosition }})
{% endif %}