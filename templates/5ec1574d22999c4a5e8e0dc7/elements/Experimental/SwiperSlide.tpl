/*
path: SwiperSlide.tpl
completePath: elements/Experimental/SwiperSlide.tpl
type: file
unique_id: oKMAl4pk
icon: f:Swiper.svg
sourceType: javascript
options:
  - name: ClassName
    display: ClassName
    type: styles 
    options: ''
  - name: keyAdd
    display: Key Addenum
    type: text 
    options: ''
children: []
*/
{% set bpr %}
import { SwiperSlide } from "swiper/react";
{% endset %}
{{ save_delayed('bpr', bpr) }}    
  <SwiperSlide key={ '{{ element.unique_id }}_' {% if element.values.keyAdd %} + {{ element.values.keyAdd }}{% endif %} }
    {% if element.values.ClassName %}
      className={ {{ element.values.ClassName }} } 
    {% endif %}
  >
    {{ content | raw }}
  </SwiperSlide>

  