/*
path: Parallax.tpl
completePath: elements/Material-UI/Parallax.tpl
unique_id: x1zn859K
icon: ico-image
sourceType: javascript
settings:
  - name: Packages
    value: '"react-parallax": "^3.5.1",'
  - name: npmScripts
    value: '"postbuild": "react-parallax",'
options:
  - name: bgImage
    display: Use an asset
    type: dropdown
    options: >-
      return [['none', 'none'],
      ...aptugo.assetUtils.images().map(image => [image.id, image.name])]
  - name: path
    display: Image Path
    type: text
    options: ''
  - name: bgImageAlt
    display: Alt Text
    type: text
    options: >-
      return aptugo.assetUtils.grabCssSelectors(
      aptugo.variables.retrievePageVariablesFromElement(arguments[0],'theme') )
  - name: className
    display: ClassName
    type: styles
  - name: height
    display: Height (in vh)
    type: text
  - name: width
    display: Width (in vw)
    type: text
  - name: strength
    display: Strength
    type: text
  - name: blurmin
    display: Blur min
    type: text
  - name: blurmax
    display: Blur Max
    type: text
  - name: Disabled
    display: Disabled?
    type: checkbox
children: []
*/
{% set bpr %}
import { Parallax, Background } from 'react-parallax'
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% set ph %}
  const mainApp = document.getElementById('app')
    mainApp.style.height = "auto";
{% endset %}
{{ save_delayed('ph',ph) }}
{% set path = element.values.path %}
{% set height = element.values.height|default('auto') %}
{% if element.values.bgImage and element.values.bgImage != 'none' %}
  {% set asset = element.values.bgImage|assetData %}
  {% if height == null %}
    {% set height = asset.height %}
  {% endif %}
  {% set path = '/img/' ~ asset.name %}
{% endif %}
<Parallax
    blur={ { min: {{ element.values.blurmin|default(0)}} , max: {{ element.values.blurmax|default(0)}} } }
    bgImage={{ path|textOrVariable }}
    bgImageAlt='{{element.values.bgImageAlt}}'
    strength={ {{ element.values.strength|default("100")}} }
    style={ { height: "{{ element.values.height|default("100")}}vh" , width: "{{ element.values.width|default("100")}}vw" } }
    {% if element.values.className %}
      className={ {{ element.values.className}} }
    {% endif %}
    {% if element.values.Disabled %}
      disabled 
    {% endif %}
>   
    {{ content | raw }}
</Parallax>