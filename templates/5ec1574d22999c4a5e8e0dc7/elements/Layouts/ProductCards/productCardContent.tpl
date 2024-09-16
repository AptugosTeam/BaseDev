/*
path: productCardContent.tpl
completePath: elements/Layouts/ProductCards/productCardContent.tpl
unique_id: M6RUSMX3
icon: f:productCardContent.svg
helpText: Insert simple text anywhere. Can hold variables, code, and anything of your choice
sourceType: javascript
options:
  - name: price
    display: Price
    type: text
    options: ''
  - name: discount
    display: Discount
    type: text
    options: ''
  - name: description
    display: Description
    type: text
    options: ''  
  - name: class
    display: ClassName
    type: styles
    options: ''
*/
{% set bpr %}
import CardContent from '@mui/material/CardContent'
import { styled } from '@mui/material/styles'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<CardContent sx={ { display: 'flex', flexDirection: 'column', alignItems: 'center' } }
  {% if element.values.class %}
    className={ {{ element.values.class }} }
  {% endif %}
>
  {% if element.values.price %}
    <div data-section="contentPrices">
      {% if element.values.discount %}
        <div data-section="discount">
          <span>$ { Number(`${{ element.values.discount }}`) }% Off</span>
        </div>
        <div data-section="prices">
          <div data-section="grossPrice">
            <span>$ { Number(`${{ element.values.price }}`).toFixed(2) }</span>
          </div>
          <div data-section="netPrice">
            <span>$ { ((Number(`${{ element.values.price }}`) / 100) * (100 - Number(`${{ element.values.discount }}`))).toFixed(2) }</span>
          </div>
        </div>
      {% else %}
      <div data-section="priceWithoutDiscount">
        <span>$ { Number(`${{ element.values.price }}`).toFixed(2) } </span>
      </div>
      {% endif %}
    </div>
  {% endif %} 
  <br />
  {% if element.values.description %}
    <div data-section="description">
      <span>{{ element.values.description }} </span>
    </div>
  {% endif %}
  {{ content | raw }}
</CardContent>
