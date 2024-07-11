/*
path: ReactCardFlip.tpl
completePath: elements/Experimental/ReactCardFlip.tpl
type: file
unique_id: RCFj42av
icon: f:Zoom.svg
options:
  - name: cardStylesFront
    display: Card Styles Front
    type: text
    options: ''
  - name: cardStylesBack
    display: Card Styles Back
    type: text
    options: ''
  - name: cardZIndex
    display: Card Z-Index
    type: text
    options: ''
  - name: containerStyle
    display: Container Style
    type: text
    options: ''
  - name: className
    display: ClassName
    type: text
    options: ''
  - name: isFlipped
    display: isFlipped
    type: text
    options: ''
  - name: flipSpeedBackToFront
    display: Flip Speed Back To Front
    type: text
    options: ''
  - name: flipSpeedFrontToBack
    display: Flip Speed Front To Back
    type: text
    options: ''
  - name: infinite
    display: Rotate in the same direction?
    type: checkbox
    options: ''
  - name: flipDirection
    display: Flip Direction
    type: dropdown
    options: >-
      return [['horizontal', 'Horizontal'],['vertical', 'Vertical']]
children: []
settings:
  - name: Packages
    value: '"react-card-flip": "^1.2.3",'
*/
{% set bpr %}
import ReactCardFlip from 'react-card-flip'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<ReactCardFlip 
  {% if element.values.cardStylesFront or element.values.cardStylesBack %}
    cardStyles={ {
        {% if element.values.cardStylesFront %}front: {{element.values.cardStylesFront}},{% endif %}
        {% if element.values.cardStylesBack %}back: {{element.values.cardStylesBack}},{% endif %}
    }}
  {% endif %}
  {% if element.values.isFlipped %}
    isFlipped={ {{element.values.isFlipped}} }
  {% endif %}
  {% if element.values.cardZIndex %}
    cardZIndex=" {{element.values.cardZIndex}} "
  {% endif %}
  {% if element.values.containerStyle %}
    containerStyle={ {{element.values.containerStyle}} }
  {% endif %}
  {% if element.values.className %}
    className={ {{element.values.className}} }
  {% endif %}
  {% if element.values.flipSpeedBackToFront %}
    flipSpeedBackToFront={ {{element.values.flipSpeedBackToFront}} }
  {% endif %}
  {% if element.values.flipSpeedFrontToBack %}
    flipSpeedFrontToBack={ {{element.values.flipSpeedFrontToBack}} }
  {% endif %}
  {% if element.values.infinite %}
    infinite
  {% endif %}
  {% if element.values.flipDirection %}
    flipDirection="{{element.values.flipDirection}}"
  {% endif %}
>
  {{ content | raw }}
</ReactCardFlip>