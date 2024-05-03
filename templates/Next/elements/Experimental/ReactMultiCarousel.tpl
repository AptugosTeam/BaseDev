/*
path: ReactMultiCarousel.tpl
completePath: elements/Experimental/ReactMultiCarousel.tpl
type: file
unique_id: RymX77gg
icon: f:Swiper.svg
sourceType: javascript
options:
  - name: className
    display: ClassName
    type: styles
    options: ''
  - name: minimumTouchDrag
    display: Distance to swipe to the next slide
    type: text
    options: ''
    settings:
      default: '50'
      active: true
  - name: separatorSlides
    display: Slides properties
    type: separator
  - name: slidesDesktop
    display: How many slides to Show in desktop (Breakpoint 5000px to 1025px)
    type: text
    options: ''
    settings:
      default: '4'
  - name: slidesToSlideDesktop
    display: How many slides to slide in desktop
    type: text
    options: ''
    settings:
      default: '2'
  - name: slidesTablet
    display: How many slides to Show in tablet (Breakpoint 1024px to 601px)
    type: text
    options: ''
    settings:
      default: '2'
  - name: slidesToSlideTablet
    display: How many slides to slide in tablet
    type: text
    options: ''
    settings:
      default: '1'
  - name: slidesMobile
    display: How many slides to Show in mobile (Breakpoint 600px to 0px)
    type: text
    options: ''
    settings:
      default: '1'
  - name: slidesToSlideMobile
    display: How many slides to slide in mobile
    type: text
    options: ''
    settings:
      default: '1'
  - name: additionalTransfrom
    display: Additional transfrom
    type: text
    options: ''
  - name: sliderClass
    display: CSS class for inner slider div (Optional)
    type: styles
    options: ''
  - name: itemClass
    display: CSS class for carousel item (Optional)
    type: styles
    options: ''
  - name: separator
    display: Autoplay properties
    type: separator
  - name: autoPlay
    display: Enable Autoplay
    type: checkbox
    options: ''
    settings:
      default: false
  - name: autoPlaySpeed
    display: Autoplay speed
    type: text
    options: ''
    settings:
      propertyCondition: autoPlay
      condition: true
      default: '3000'
      active: true
  - name: rtl
    display: Autoplay carousel direction
    type: dropdown
    options: 
      return [['true', 'Left'], ['false', 'Right']]
    settings:
      propertyCondition: autoPlay
      condition: true
      default: 'false'
  - name: pauseOnHover
    display: Pause Autoplay on hover
    type: checkbox
    options: ''
    settings:
      propertyCondition: autoPlay
      condition: true
      default: true
      active: true
  - name: shouldResetAutoplay
    display: Reset Autoplay when clicking next, previous button and the dots
    type: checkbox
    options: ''
    settings:
      propertyCondition: autoPlay
      condition: true
      default: true
      active: true
  - name: rewind
    display: Rewind the carousel when the end is reached (Infinite mode must be disabled)
    type: checkbox
    options: ''
    settings:
      propertyCondition: autoPlay
      condition: true
      default: false
      active: true
  - name: rewindWithAnimation
    display: Rewind with animation
    type: checkbox
    options: ''
    settings:
      propertyCondition: autoPlay
      condition: true
      default: false
      active: true
  - name: separatorDots
    display: Dots properties
    type: separator
  - name: showDots
    display: Show defaults dots
    type: checkbox
    options: ''
    settings:
      default: false
  - name: dotListClass
    display: ClassName for dots
    type: text
    options: ''
    settings:
      propertyCondition: showDots
      condition: true
      active: true
  - name: renderDotsOutside
    display: Show dots outside of the container
    type: checkbox
    options: ''
    settings:
      propertyCondition: showDots
      condition: true
      default: false
      active: true
  - name: separator
    display: Checkbox
    type: separator
  - name: arrows
    display: Show defaults arrows
    type: checkbox
    options: ''
    settings:
      default: true
  - name: draggable
    display: Enable dragging on desktop
    type: checkbox
    options: ''
    settings:
      default: true
  - name: centerMode
    display: Enable Center mode
    type: checkbox
    options: ''
    settings:
      default: false
  - name: infinite
    display: Enable Infinite mode
    type: checkbox
    options: ''
    settings:
      default: true
  - name: renderArrowsWhenDisabled
    display: Disabled arrows when Carousel end (Infinite mode must be disabled)
    type: checkbox
    options: ''
    settings:
      default: false
  - name: swipeable
    display: Enable swiping on mobile
    type: checkbox
    options: ''
    settings:
      default: true
settings:
  - name: Packages
    value: '"react-multi-carousel": "^2.8.4",'
children: []
*/
{% set bpr %}
import Carousel from "react-multi-carousel";
import "react-multi-carousel/lib/styles.css";
{% endset %}
{{ save_delayed('bpr', bpr) }}
<Carousel
{% if element.values.className %}
  className={ {{ element.values.className }} }
{% endif %}
{% if element.values.sliderClass %}
  sliderClass={ {{ element.values.sliderClass }} }
{% endif %}
{% if element.values.itemClass %}
  itemClass={ {{ element.values.itemClass }} }
{% endif %}
{% if element.values.arrows %}
  arrows
{% endif %}
{% if element.values.showDots %}
  showDots={true}
{% endif %}
{% if element.values.showDots and element.values.dotListClass %}
  dotListClass={ {{ element.values.dotListClass }} }
{% endif %}
{% if element.values.showDots and element.values.renderDotsOutside %}
  renderDotsOutside={true}
{% endif %}
{% if element.values.draggable %}
  draggable
{% else %}
  draggable={false}
{% endif %}
{% if element.values.centerMode %}
  centerMode={true}
{% endif %}
{% if element.values.infinite %}
  infinite={true}
{% endif %}
{% if element.values.swipeable %}
  swipeable={true}
{% endif %}
{% if element.values.minimumTouchDrag %}
  minimumTouchDrag={ {{ element.values.minimumTouchDrag|default('50') }} }
{% endif %}
{% if element.values.additionalTransfrom %}
  additionalTransfrom={ {{ element.values.additionalTransfrom|default('0') }} }
{% endif %}
{% if element.values.autoPlay %}
  autoPlay={true}
{% endif %}
{% if element.values.autoPlay and element.values.autoPlaySpeed %}
  autoPlaySpeed={ {{ element.values.autoPlaySpeed|default('3000') }} }
{% endif %}
{% if element.values.autoPlay and element.values.pauseOnHover %}
  pauseOnHover
{% endif %}
{% if element.values.autoPlay and element.values.rtl %}
  rtl={ {{ element.values.rtl|default('false') }} }
{% endif %}
{% if element.values.autoPlay and element.values.shouldResetAutoplay %}
  shouldResetAutoplay
{% endif %}
{% if not element.values.infinite and element.values.autoPlay and element.values.rewind %}
  rewind={true}
{% endif %}
{% if not element.values.infinite and element.values.autoPlay and element.values.rewind and element.values.rewindWithAnimation %}
  rewindWithAnimation={true}
{% endif %}
{% if not element.values.infinite and element.values.renderArrowsWhenDisabled %}
  renderArrowsWhenDisabled={true}
{% endif %}
  renderButtonGroupOutside={false}
  containerClass={theme.containerWithDots}
    responsive={ {
    desktop: {
      breakpoint: {
        max: 5000,
        min: 1025,
      },
      items: {{ element.values.slidesDesktop|default('4') }},
      slidesToSlide: {{ element.values.slidesToSlideDesktop|default('2') }},
      partialVisibilityGutter: 40,
    },
    tablet: {
      breakpoint: {
        max: 1024,
        min: 601,
      },
      items: {{ element.values.slidesTablet|default('2') }},
      slidesToSlide: {{ element.values.slidesToSlideTablet|default('1') }},
      partialVisibilityGutter: 30,
    },
    mobile: {
      breakpoint: {
        max: 600,
        min: 0,
      },
      items: {{ element.values.slidesMobile|default('1') }},
      slidesToSlide: {{ element.values.slidesToSlideMobile|default('1') }},
      partialVisibilityGutter: 20,
    },

  } }
>
{{ content | raw }}
</Carousel>

  