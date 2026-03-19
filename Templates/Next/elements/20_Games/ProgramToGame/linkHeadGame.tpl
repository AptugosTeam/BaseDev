/*
path: linkHeadGame.tpl
keyPath: elements/ProgramToGame/linkHeadGame.tpl
unique_id: LinkHeadXYZ
icon: f:link.svg
options:
  - name: constName
    display: Constant Name
    type: text
    options: ''
    required: true
  - name: href
    display: URL
    type: text
    options: ''
    required: true
  - name: rel
    display: Rel Attribute
    type: text
    options: ''
    required: true
*/
const {{ element.values.constName }} = document.createElement('link');
{{ element.values.constName }}.href = '{{ element.values.href }}';
{{ element.values.constName }}.rel = '{{ element.values.rel }}';

const head = document.head;
const titleElement = document.querySelector('title');

if (titleElement) {
  head.insertBefore({{ element.values.constName }}, titleElement);
} else {
  head.appendChild({{ element.values.constName }});
}
// Add the font in the SceneText and CSS for optimal performance.