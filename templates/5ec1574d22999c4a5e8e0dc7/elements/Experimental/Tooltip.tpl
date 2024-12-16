/*
path: Tooltip.tpl
type: file
unique_id: tooltip9481
icon: f:Tooltip.svg
helpText: Display informative text when users hover over, focus on, or tap an element.
children: []
options:
  - name: content
    display: Content
    type: text
    options: ''  
  - name: placement
    display: Placement
    type: dropdown
    options: top;top-start;top-end;left;left-start;left-end;right;right-start;right-end;bottom;bottom-start;bottom-end
  - name: arrow
    display: Use Arrow Tooltip
    type: checkbox
    settings:
      default: false
      condition: ''
  - name: disableInteractive
    display: Disable Interactive
    type: checkbox
    settings:
      default: false
      condition: ''  
  - name: transition
    display: Transition
    type: dropdown
    options: Grow;Zoom;Fade
    settings:
      default: Grow
  - name: transitionDuration
    display: Fade Duration (milliseconds)
    type: text
    options: ''
    settings:
      propertyCondition: transition
      condition: Fade
  - name: enterDelay
    display: Enter Delay (milliseconds)
    type: text
    options: ''
  - name: leaveDelay
    display: Leave Delay (milliseconds)
    type: text
    options: ''
  - name: followCursor
    display: Follow Cursor
    type: checkbox
    settings:
      default: false
      condition: ''
  - name: open
    display: Control Open State
    type: variable
    options: ''
childs:
  - name: Button
    element: button
*/

{% set bpr %}
import Tooltip from '@mui/material/Tooltip'
{% if element.values.transition == "Zoom" %}import Zoom from '@mui/material/Zoom'{% endif %}
{% if element.values.transition == "Fade" %}import Fade from '@mui/material/Fade'{% endif %}
{% endset %}
{{ save_delayed('bpr',bpr) }}

{% set arrow = element.values.arrow|default(false) %}
{% set disableInteractive = element.values.disableInteractive|default(false) %}
{% set followCursor = element.values.followCursor|default(false) %}

<Tooltip
    title={{ element.values.content | textOrVariable }}
    {% if element.values.placement %}placement='{{ element.values.placement }}'{% endif %}
    {% if arrow %}arrow{% endif %}
    {% if disableInteractive %}disableInteractive{% endif %}
    {% if element.values.transition == "Zoom" %}TransitionComponent={ {{ element.values.transition }} }{% endif %}
    {% if element.values.transition == "Fade" %}TransitionComponent={ {{ element.values.transition }} } TransitionProps={ { timeout: {{element.values.transitionDuration}} } }{% endif %}
    {% if element.values.enterDelay %}enterDelay={ {{ element.values.enterDelay }} }{% endif %}
    {% if element.values.leaveDelay %}leaveDelay={ {{ element.values.leaveDelay }} }{% endif %}
    {% if followCursor %}followCursor={ {{element.values.followCursor}} }{% endif %}
    {% if element.values.open%}open={ {{ element.values.open }} }{% endif %}>
{{ content | raw }} 
</Tooltip>