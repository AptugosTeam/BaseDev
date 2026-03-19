/*
path: particleImage.tpl
type: file
unique_id: SLLIbhlu
icon: ico-field
children: []
helpText: Converts my logo into particles
settings:
  - name: Packages
    value: '"react-particle-image":"latest",'
options:
  - name: image
    display: Image
    type: text
    options: ''
  - name: useAsset
    display: Use An Asset
    type: dropdown
    options: return aptugo.assetUtils.images().map(image => [image.id, image.name])
*/
{% if element.values.useAsset %}
  {% set path = '/img/' ~ (element.values.useAsset|assetData).name %}
{% else %}
  {% set path =element.values.image %}
{% endif %}
{% set bpr %}
import ParticleImage, { ParticleOptions, Vector, forces, ParticleForce } from "react-particle-image"
{% endset %}
{{ save_delayed('bpr', bpr) }}

{% set ph %}
const particleOptions: ParticleOptions = {
  filter: ({ x, y, image }) => {
    // Get pixel
    const pixel = image.get(x, y);
    // Make a particle for this pixel if blue > 50 (range 0-255)
    return pixel.a > 10;
  },
  mass: () => 40,
  friction: () => 0.15,
  color: ({ x, y, image }) => { 
    const pixel = image.get(x,y);
    return `rgb(${pixel.r}, ${pixel.g}, ${pixel.b})`
  }
}
{% endset %}
{{ save_delayed('ph',ph) }}

<ParticleImage
    src={{ path|textOrVariable }}
    scale={0.75}
    entropy={10}
    maxParticles={4200}
    mouseMoveForce={(x,y) => forces.disturbance(x, y, 5)}
    particleOptions={particleOptions}
    backgroundColor="#FFF"
/>