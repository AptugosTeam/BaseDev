/*
path: Swiper.tpl
completePath: elements/Experimental/Swiper.tpl
type: file
unique_id: oKJIl4pk
icon: f:Swiper.svg
sourceType: javascript
options:
  - name: ClassName
    display: ClassName
    type: styles 
    options: ''
  - name: slidesPerView
    display: Slides Per View
    type: text
    options: ''
  - name: slidesPerGroup
    display: Slides Per Group
    type: text
    options: ''
  - name: spaceBetween
    display: Space Between
    type: text
    options: ''
  - name: loop
    display: Cancel loop
    type: checkbox
    advanced: true
    options: ''
  - name: loopFillGroupWithBlank
    display:  Cancel blanks
    type: checkbox
    advanced: true
    options: ''
  - name: navigation
    display: Delete Arrows
    type: checkbox
    options: ''
  - name: pagination
    display: Delete Pagination
    type: checkbox
    options: ''
  - name: useSwiperSlide
    display: Use SwiperSlide?
    type: checkbox
    advanced: true
    settings:
      default: true
    options: ''
  - name: onSwiper
    display: When Loaded
    type: text
  - name: onChange
    display: When Active Index Changes
    type: text
settings:
  - name: Packages
    value: '"swiper": "^8.0.0",'
children: []
*/
{% set bpr %}
import { Swiper, SwiperSlide } from "swiper/react";
import { Pagination, Navigation } from "swiper";
import "swiper/css/pagination";
import "swiper/css/free-mode";
import "swiper/css/bundle";
{% endset %}

{{ save_delayed('bpr', bpr) }}    
  <Swiper
    {% if element.values.ClassName %}
      className={ {{ element.values.ClassName }} } 
    {% endif %}
    {% if element.values.slidesPerView %}
      slidesPerView={ {{ element.values.slidesPerView }} }
    {% endif %}
    {% if element.values.spaceBetween %}
      spaceBetween={ {{ element.values.spaceBetween }} } 
    {% endif %}
    {% if element.values.slidesPerGroup %}
      slidesPerGroup={ {{ element.values.slidesPerGroup }} }
    {% endif %}
    {% if element.values.loop %}
    {% else %}
      loop={true}
    {% endif %}
    {% if element.values.navigation %}
    {% else %}
      navigation={true}
    {% endif %}
    {% if element.values.pagination %}
    {% else %}
      pagination= { {clickable: true} }
    {% endif %}
    {% if element.values.loopFillGroupWithBlank %}
    {% else %}
      loopFillGroupWithBlank={true}
    {% endif %}
    {% if element.values.onSwiper %}
      onSwiper={ {{ element.values.onSwiper }} } 
    {% endif %}
    {% if element.values.onChange %}
      onActiveIndexChange={ {{ element.values.onChange }} } 
    {% endif %}
    modules={[Pagination, Navigation]}
  >
{% if element.values.useSwiperSlide %}
  {% for unchild in element.children %}
    <SwiperSlide>
      {{ unchild.rendered | raw }}
    </SwiperSlide>
  {% endfor %}
{% else %}
  {{ content | raw }}
{% endif %}
</Swiper>

  