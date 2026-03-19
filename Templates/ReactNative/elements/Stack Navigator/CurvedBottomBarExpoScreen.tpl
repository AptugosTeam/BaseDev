/*
path: CurvedBottomBarExpoScreen.tpl
type: file
unique_id: cBBE4n9x
icon: ico-disqus
helpText: Add Curved Bottom Bar Screen to your Application
options:
  - name: curvedBottomBarScreen
    display: Screen Name
    type: text
    options: ''
  - name: position
    display: Position of circle button
    type: dropdown
    options: >-
      return [['LEFT','Left'],['RIGHT','Right'], ['CIRCLE', 'Circle']]
  - name: component
    display: Component
    type: dropdown
    required: true
    options: >-
      return aptugo.pageUtils.getAllPages()
children: []
*/
<CurvedBottomBarExpo.Screen 
 name={{element.values.curvedBottomBarScreen | textOrVariable}}
 {% set innerParams = '' %}
 {% if element.values.component %}
  {% set pageFrom = element.values.component | elementData %}
 {% endif %}
 {% for page in application.pages | plain('type','page')  %}
  {% if page.unique_id == pageFrom.unique_id %}
    {% set innerParams = page.filename | removeExtension %}
  {% endif %}
 {% endfor %}
 component={ {{innerParams | capitalize}} }
 position={{element.values.position | textOrVariable}} 
/>