/*
path: PhaserSceneFunction.tpl
keyPath: elements/Games/PhaserSceneFunction.tpl
unique_id: qbOerz9a
icon: f:frame_source.svg
renderTag: (elem) => { return elem.values.stage }
calculatedName: >-
  function (ele) { 
    try {
      const stageName = ele.values.stage === 'other' 
                        ? ele.values.customFunctionName 
                        : ele.values.stage;
      return stageName 
             ? 'PhaserSceneFunction ' + (ele.values.stage === 'other' ? stageName : stageName.charAt(0).toUpperCase() + stageName.slice(1)) 
             : 'PhaserSceneFunction';
    } catch(e) {
      return 'PhaserSceneFunction';
    }
  }
options:
  - name: stage
    display: Stage
    type: dropdown
    options: >-
      return [['preload', 'Preload Stage'],['create', 'Create Stage'],['update', 'Update Stage'],['other', 'Custom Function']]
  - name: customFunctionName
    display: Custom Function Name
    type: text
    required: true
    settings:
      propertyCondition: stage
      condition: other
      active: true
  - name: customFunctionArguments
    display: Custom Function Arguments
    type: text
    settings:
      propertyCondition: stage
      condition: other
      active: true
*/
{{ element.values.customFunctionName|default(element.values.stage) | friendly }}({% if element.values.customFunctionArguments %}{{ element.values.customFunctionArguments }}{% endif %}) {
  {{ content | raw }}
}