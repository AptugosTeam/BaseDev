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
  - name: autoplay
    display: Autoplay
    type: checkbox
    options: ''
  - name: centeredSlides
    display: Enable Center Slides
    type: checkbox
    options: ''
    settings:
      default: false
  - name: delay
    display: Delay (ms)
    type: text
    options: ''
    settings:
      propertyCondition: autoplay
      condition: true
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
  - name: breakpoints
    display: Breakpoints
    type: text
    options: ''
  - name: effectCards
    display: Effect - Cards
    type: checkbox
    advanced: true
  - name: onSlideNextTransitionStart
    display: On Slide Next Transition Start
    type: function
    advanced: true
    settings:
      propertyCondition: navigation
      condition: false
  - name: onSlidePrevTransitionStart
    display: On Slide Previous Transition Start
    type: function
    advanced: true
    settings:
      propertyCondition: navigation
      condition: false
settings:
  - name: Packages
    value: '"swiper": "^10.0.0",'
children: []
*/
{% set bpr %}
import { Swiper, SwiperSlide } from "swiper/react";
import { Pagination as SwiperPagination, Navigation, Autoplay } from "swiper/modules";
import "swiper/css/pagination";
import "swiper/css/free-mode";
import "swiper/css/bundle";
{% if element.values.effectCards %}
import { EffectCards } from 'swiper'
{% endif %}
{% endset %}

{{ save_delayed('bpr', bpr) }}    
  <Swiper
    {% if element.values.effectCards %}
    effect={'cards'}
    grabCursor={true}
    {% endif %}
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
    {% if element.values.centeredSlides %}
      centeredSlides={true}
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
    {% if element.values.autoplay %}
      autoplay={ { 
        delay: {{ element.values.delay | default(2500) }},
        disableOnInteraction: false
      } }
    {% endif %}
   {% if element.values.breakpoints %}
      breakpoints={ {{ element.values.breakpoints }} }
    {% endif %}
    {% if element.values.onSlideNextTransitionStart %}
       onSlideNextTransitionStart={() => {
        {{element.values.onSlideNextTransitionStart}}
       }}
    {% endif %}
    {% if element.values.onSlidePrevTransitionStart %}
      onSlidePrevTransitionStart={() => {
        {{element.values.onSlidePrevTransitionStart}}
      }}
    {% endif %}
    modules={[SwiperPagination, Navigation{%if element.values.effectCards %}, EffectCards{% endif %}, Autoplay]}
  >
{% if element.values.useSwiperSlide %}
  {% for unchild in element.children %}
    <SwiperSlide key={ "{{ unchild.unique_id }}" }>
      {{ unchild.rendered | raw }}
    </SwiperSlide>
  {% endfor %}
{% else %}
  {{ content | raw }}
{% endif %}
</Swiper>

  