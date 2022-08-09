/*
path: productCardContent.tpl
completePath: elements/Material-UI/Cards/productCardContent.tpl
unique_id: M6RUSbz3
icon: ico-text
helpText: >-
  Insert simple text anywhere. Can hold variables, code, and anything of your
  choice
sourceType: javascript
options:
  - name: price
    display: Price
    type: text
    options: ''
  - name: discount
    display: Discount
    type: text
    options: ''
  - name: description
    display: Description
    type: text
    options: ''
  - name: class
    display: ClassName
    type: styles
    options: ''
*/
{% set bpr %}
import CardContent from '@mui/material/CardContent'
import ExpandMoreIcon from '@mui/icons-material/ExpandMore'
import Collapse from '@mui/material/Collapse'

import IconButton, { IconButtonProps } from '@mui/material/IconButton'
import { styled } from '@mui/material/styles'
import ExpandMore from '@mui/icons-material/ExpandMore'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set ph %}
interface ExpandMoreProps extends IconButtonProps {
  expand: boolean;
}
const ExpandMore = styled((props: ExpandMoreProps) => {
  const { expand, ...other } = props;
  return <IconButton {...other} />;
})(({ theme, expand }) => ({
  transform: !expand ? 'rotate(0deg)' : 'rotate(180deg)',
  marginLeft: 'auto',
  transition: theme.transitions.create('transform', {
  duration: theme.transitions.duration.shortest,
  }),
}));
const [expanded, setExpanded] = React.useState(false); 
const handleExpandClick = () => {
      setExpanded(!expanded);
  };
{% endset %}
{{ save_delayed('ph',ph) }}
<CardContent sx= { { display: 'flex', flexDirection: 'column', alignItems: 'flex-end' } }
{% if element.values.class %}className={ {{element.values.class}} }{% endif %}
>
{% if element.values.discount %}<span style={ { color: 'white', backgroundColor: 'red', fontWeight: '600', float: 'right', borderRadius: '10px', padding: '3px', margin: '0px 5px' } }>{{ element.values.discount }}% Off</span>{% endif %}
{% if element.values.price %}<span style={ { color: 'red', fontWeight: '600', float: 'right', padding: '3px', margin: '0px 5px' } }>{{ element.values.price }}</span>{% endif %} <br />
{% if element.values.description %}
  <ExpandMore
      expand={expanded}
      onClick={handleExpandClick}
      aria-expanded={expanded}
      aria-label="show more"
  >
    <ExpandMoreIcon />
    </ExpandMore>
<Collapse in={expanded} timeout="auto" unmountOnExit>
<span style={ { color: 'gray', fontWeight: '400' } }>{{ element.values.description }}</span>
</Collapse>
{% endif %}
{{ content | raw }}
</CardContent>