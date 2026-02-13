/*
path: StackScreen.tpl
type: file
unique_id: SSnE4ncs
icon: ico-disqus
helpText: Add Stack Screen to your Application
options:
  - name: screeName
    display: Screen Name
    type: text
    options: ''
  - name: component
    display: Component
    type: dropdown
    required: true
    options: >-
      return aptugo.pageUtils.getAllPages()
  - name: componentText
    display: Other Component
    type: text
    options: ''
children: []
*/
<Stack.Screen
 name={{element.values.screeName | textOrVariable}}
 {% set innerParams = '' %}
 {% if element.values.component %}
  {% set pageFrom = element.values.component | elementData %}
 {% endif %}
 {% for page in application.pages | plain('type','page')  %}
  {% if page.unique_id == pageFrom.unique_id %}
    {% set innerParams = page.filename | removeExtension %}
  {% endif %}
 {% endfor %}
 component={ {%if element.values.component %}{{innerParams | capitalize}} {% else %} {{element.values.componentText}} {% endif %} }
/>