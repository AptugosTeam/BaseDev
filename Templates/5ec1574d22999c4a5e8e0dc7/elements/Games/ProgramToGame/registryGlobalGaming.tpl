/*
path: registryGlobalGaming.tpl
keyPath: elements/Games/ProgramToGame/registryGlobalGaming.tpl
unique_id: IcPGCcnG
icon: f:laps.svg
options:
  - name: metodoregistry
    display: Metodo Registry
    type: dropdown
    options: 
      return [['set', 'Set'],['get', 'Get'],['remove', 'Remove'],['inc', 'Increment'],['reset', 'Reset']]
    settings:
      default: set
  - name: namekey
    display: Name Key
    type: text
    options: ''
    required: true
    settings:
      active: true
      propertyCondition: metodoregistry
      condition: set
  - name: namekey
    display: Name Key
    type: text
    options: ''
    required: true
    settings:
      active: true
      propertyCondition: metodoregistry
      condition: get
  - name: namekey
    display: Name Key
    type: text
    options: ''
    required: true
    settings:
      active: true
      propertyCondition: metodoregistry
      condition: inc
  - name: namekey
    display: Name Key
    type: text
    options: ''
    required: true
    settings:
      active: true
      propertyCondition: metodoregistry
      condition: remove
  - name: valuekey
    display: Value Key
    type: text
    options: ''
    required: true
    settings:
      active: true
      propertyCondition: metodoregistry
      condition: set
  - name: valuekey
    display: Value Key
    type: text
    options: ''
    required: true
    settings:
      active: true
      propertyCondition: metodoregistry
      condition: inc
*/
{% if element.values.metodoregistry == 'reset' %}
this.registry.reset();
{% elseif element.values.metodoregistry in ['get', 'remove'] %}
this.registry.{{ element.values.metodoregistry }}('{{ element.values.namekey }}');
{% elseif element.values.metodoregistry in ['set', 'inc'] %}
this.registry.{{ element.values.metodoregistry }}('{{ element.values.namekey }}', {{ element.values.valuekey }});
{% endif %}