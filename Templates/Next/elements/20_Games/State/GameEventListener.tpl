/*
path: GameEventListener.tpl
keyPath: elements/Games/State/GameEventListener.tpl
icon: ico-event
unique_id: wTXtQkDT
options:
  - name: eventType
    display: Event to listen for
    type: dropdown
    options: return [['DRAG','Drag'],['DRAG_START','Start Drag'],['DROP','Drop'],['POINTER_UP','Pointer UP']]
*/
this.input.on(
  Phaser.Input.Events.{{ element.values.eventType }}, 
  (
    pointer: Phaser.Input.Pointer,
    gameObject: Phaser.GameObjects.Image
    {% if element.values.eventType == 'DROP' %},dropZone: Phaser.GameObjects.Zone{% endif %}
    {% if element.values.eventType == 'DRAG' %},dragX: number, dragY: number{% endif %}
  ) => {
    {{ content | raw }}
  }
)
