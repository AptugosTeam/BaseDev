/*
path: hide.tpl
type: file
unique_id: kN2kTdCL
icon: ico-hide
helpText: Hide elements based on screen size
options:
  - name: hidevalue
    display: Hide Breakpoint
    type: dropdown
    options: xsUp;xsDown;xlUp;xlDown;smUp;smDown;mdUp;mdDown;lgUp;lgDown
children: []
*/
{% set bpr %}
import Hidden from '@mui/material/Hidden'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Hidden {{ element.values.hidevalue }}>
{{ content | raw }}
</Hidden>