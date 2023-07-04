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
children: []
*/
{% set bpr %}
import { SwiperSlide } from "swiper/react";
{% endset %}
{{ save_delayed('bpr', bpr) }}    
  <SwiperSlide
    {% if element.values.ClassName %}
      className={ {{ element.values.ClassName }} } 
    {% endif %}
  >
    {{ content | raw }}
  </SwiperSlide>

  