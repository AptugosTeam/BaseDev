/*
path: gsapRegister.tpl
keyPath: elements/Experimental/GSAPRegister.tpl
unique_id: Gsap0001
type: file
icon: f:import.svg
helpText: Importa y registra plugins de GSAP
options:
  - name: useScrollTrigger
    display: ScrollTrigger
    type: checkbox
  - name: useSplitText
    display: SplitText
    type: checkbox
  - name: useDraggable
    display: Draggable
    type: checkbox
  - name: useMotionPath
    display: MotionPathPlugin
    type: checkbox
  - name: useScrollTo
    display: ScrollToPlugin
    type: checkbox
  - name: Flip
    display: Flip
    type: checkbox
  - name: useGSAP
    display: useGSAP (React Plugin)
    type: checkbox  
  - name: gsapVersion 
    display: GSAP version
    type: text
    advanced: true
    settings:
      default: ''
settings:
  - name: Packages
    value: |
      {% if element.values.gsapVersion %}
      "gsap": "{{ element.values.gsapVersion }}",
      {% else %}
      "gsap": "^3.12.2",
      {% endif %}
      {% if element.values.useGSAP %}
      "@gsap/react": "^1.0.0",
      {% endif %}
children: []
*/

{% set importBlock %}
import gsap from "gsap"
{% if element.values.useScrollTrigger %}import { ScrollTrigger } from "gsap/ScrollTrigger"{% endif %}
{% if element.values.useSplitText %}import { SplitText } from "gsap/SplitText"{% endif %}
{% if element.values.useDraggable %}import { Draggable } from "gsap/Draggable"{% endif %}
{% if element.values.useMotionPath %}import { MotionPathPlugin } from "gsap/MotionPathPlugin"{% endif %}
{% if element.values.useScrollTo %}import { ScrollToPlugin } from "gsap/ScrollToPlugin"{% endif %}
{% if element.values.useFlip %}import { Flip } from "gsap/Flip"{% endif %}
{% if element.values.useGSAP %}import { useGSAP } from "@gsap/react"{% endif %}
{% endset %}

{{ save_delayed('bpr', importBlock) }}

{% set registrationBlock %}
gsap.registerPlugin(
{% if element.values.useScrollTrigger %}ScrollTrigger,{% endif %}
{% if element.values.useSplitText %}SplitText,{% endif %}
{% if element.values.useDraggable %}Draggable,{% endif %}
{% if element.values.useMotionPath %}MotionPathPlugin,{% endif %}
{% if element.values.useScrollTo %}ScrollToPlugin,{% endif %}
{% if element.values.useFlip %}Flip,{% endif %}
{% if element.values.useGSAP %}useGSAP{% endif %}
)
{% endset %}

{{ save_delayed('bpr', registrationBlock) }}