/*
path: threejsRegister.tpl
keyPath: elements/Experimental/ThreeJSRegister.tpl
unique_id: Three001
type: file
icon: f:import.svg
helpText: Importa y registra elementos y plugins de Three.js
options:
  - name: usePerspectiveCamera
    display: PerspectiveCamera
    type: checkbox
  - name: useOrbitControls
    display: OrbitControls
    type: checkbox
  - name: useGLTFLoader
    display: GLTFLoader
    type: checkbox
  - name: useLoader
    display: LoadingManager
    type: checkbox
  - name: useStats
    display: Stats
    type: checkbox
  - name: useDRACOLoader
    display: DRACOLoader
    type: checkbox
  - name: useCSS3DRenderer
    display: CSS3DRenderer
    type: checkbox
  - name: threeVersion
    display: Three.js version
    type: text
    advanced: true
    settings:
      default: ''
settings:
  - name: Packages
    value: |
      {% if element.values.threeVersion %}
      "three": "{{ element.values.threeVersion }}",
      {% else %}
      "three": "^0.150.0",
      {% endif %}
children: []
*/

{% set importBlock %}
import * as THREE from "three";
{% if element.values.usePerspectiveCamera %}import { PerspectiveCamera } from "three";{% endif %}
{% if element.values.useOrbitControls %}import { OrbitControls } from "three/examples/jsm/controls/OrbitControls";{% endif %}
{% if element.values.useGLTFLoader %}import { GLTFLoader } from "three/examples/jsm/loaders/GLTFLoader";{% endif %}
{% if element.values.useLoader %}import { LoadingManager } from "three";{% endif %}
{% if element.values.useStats %}import { Stats } from "three/examples/js/libs/stats.min";{% endif %}
{% if element.values.useDRACOLoader %}import { DRACOLoader } from "three/examples/jsm/loaders/DRACOLoader";{% endif %}
{% if element.values.useCSS3DRenderer %}import { CSS3DRenderer } from "three/examples/jsm/renderers/CSS3DRenderer";{% endif %}
{% endset %}

{{ save_delayed('bpr', importBlock) }}

{% set registrationBlock %}
const scene = new THREE.Scene()
{% if element.values.usePerspectiveCamera %}const camera = new PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);{% endif %}
{% if element.values.useOrbitControls %}const controls = new OrbitControls(camera, renderer.domElement);{% endif %}
{% if element.values.useGLTFLoader %}const loader = new GLTFLoader();{% endif %}
{% if element.values.useLoader %}const loadingManager = new LoadingManager();{% endif %}
{% if element.values.useStats %}const stats = new Stats();{% endif %}
{% if element.values.useDRACOLoader %}const dracoLoader = new DRACOLoader();{% endif %}
{% if element.values.useCSS3DRenderer %}const cssRenderer = new CSS3DRenderer();{% endif %}
{% endset %}

{{ save_delayed('bpr', registrationBlock) }}
