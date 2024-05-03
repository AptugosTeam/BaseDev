/*
path: linkedInShare.tpl
type: file
unique_id: NCe9g0Jv
icon: ico-linkedin
helpText: 'Share on LinkedIn (use meta for content: og:title / og:image / og:description)'
sourceType: javascript
children: []
*/
{% set bpr %}
import LinkedInIcon from '@mui/icons-material/LinkedIn'
import IconButton from '@mui/material/IconButton'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<IconButton onClick={() => { window.open (`https://www.linkedin.com/sharing/share-offsite/?url=${window.location.href}`, "mywindow","menubar=0,resizable=1,width=500,height=615") }}>
  <LinkedInIcon />
</IconButton>