/*
path: Parallax.tpl
completePath: elements/Material-UI/Parallax.tpl
unique_id: x1zn859K
*/
{% set bpr %}
import { Parallax } from 'react-parallax'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<Parallax
    blur={1}
    bgImage='{{element.values.bgImage}}'
    bgImageAlt="the cat"
    strength={500}
    style={ { height: '{{ element.values.height }}' } }
    {% if element.values.className %}className={ {{ element.values.className}} }{% endif %}
>
    {{ content | raw }}
</Parallax>