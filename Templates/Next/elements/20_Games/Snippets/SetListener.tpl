/*
path: SetListener.tpl
keyPath: elements/20_Games/Snippets/SetListener.tpl
icon: ico-event
unique_id: 5wo3ZyJt
options:
  - name: event
    display: Event to listen for
    type: dropdown
    options: >-
      return [
        ['pointerdown','Pointer Down'],
        ['pointerup','Pointer Up']
      ]
    settings:
      default: pointerdown
*/
.setInteractive().on('{{ element.values.event }}', () => {
  {{ content | raw }}
})