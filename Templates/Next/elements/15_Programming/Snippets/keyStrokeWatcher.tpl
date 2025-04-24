/*
path: keyStrokeWatcher.tpl
type: file
unique_id: keyStrokeWatcher
icon: ico-keydown
sourceType: javascript
helpText: Watches for keydown events
options:
  - name: key
    display: Key to Watch
    type: dropdown
    options: 
      return [['Escape', 'Escape Key'], ['ArrowUp', 'Arrow Key UP'], ['ArrowDown', 'Arrow Key DOWN'], ['ArrowRight', 'Arrow Key RIGHT'], ['ArrowLeft', 'Arrow Key LEFT']]
children: []
extraFiles:
  - source: 'elements/99_ExtraFiles/useKeyDown.tsx'
    destination: '/src/components/UseKeyDown/index.tsx'
*/
{% set bpr %}
import useKeyDown from '@components/UseKeyDown'
{% endset %}
{{ save_delayed('bpr',bpr)}}
useKeyDown(() => {
  {{ content | raw }}
}, ['{{ element.values.key }}'])




