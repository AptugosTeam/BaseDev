/*
path: Interval.tpl
keyPath: elements/Programming/Snippets/Interval.tpl
unique_id: MhedvSAw
options:
  - name: Interval
    display: Interval in MS
    type: text
extraFiles:
  - source: 'elements/99_ExtraFiles/999_interval.tsx'
    destination: 'front-end/Components/Interval/index.tsx'
*/
{% set bpr %}
import useInterval from '@components/Interval'
{% endset %}
{{ save_delayed('bpr',bpr)}}
useInterval(() => {
  {{ content | raw }}
}, {{ element.values.Interval }})