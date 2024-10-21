/*
path: div.tpl
name: Cards
display: 3 Cards
styledIcon: f:../z-images/cards.jpg
double: true
keyPath: elements/Wireframes/cards.tpl
unique_id: 3NS8Iaxn
options:
  - name: class
    display: ClassName
    type: text
    settings:
      default: 'theme.cards'
childs:
  - name: Cards Holder
    element: div
    values: {
      class: 'theme.cardsHolder'
    }
    childs:
      - name: First Element
        element: simpleLink
        values: {
          destination: '#',
          className: 'theme.card'
        }
        childs:
          - name: Image
            element: image
            values: {
              path: 'https://picsum.photos/id/29/200/300',
              width: 200
            }
          - name: Main Text
            element: typography
            values: {
              tag: 'h3'
            }
            childs:
              - name: Text
                element: text
                values: {
                  Content: 'Main text for card' 
                }
          - name: Secondary Text
            element: typography
            values: {
              tag: 'h5'
            }
            childs:
              - name: Text
                element: text
                values: {
                  Content: 'Sub text for card' 
                }
      - name: Second Element
        element: simpleLink
        values: {
          destination: '#',
          className: 'theme.card'
        }
        childs:
          - name: Image
            element: image
            values: {
              path: 'https://picsum.photos/id/28/200/300',
              width: 200
            }
          - name: Main Text
            element: typography
            values: {
              tag: 'h3'
            }
            childs:
              - name: Text
                element: text
                values: {
                  Content: 'Main text for card' 
                }
          - name: Secondary Text
            element: typography
            values: {
              tag: 'h5'
            }
            childs:
              - name: Text
                element: text
                values: {
                  Content: 'Sub text for card' 
                }
      - name: Third Element
        element: simpleLink
        values: {
          destination: '#',
          className: 'theme.card'
        }
        childs:
          - name: Image
            element: image
            values: {
              path: 'https://picsum.photos/id/27/200/300',
              width: 200
            }
          - name: Main Text
            element: typography
            values: {
              tag: 'h3'
            }
            childs:
              - name: Text
                element: text
                values: {
                  Content: 'Main text for card' 
                }
          - name: Secondary Text
            element: typography
            values: {
              tag: 'h5'
            }
            childs:
              - name: Text
                element: text
                values: {
                  Content: 'Sub text for card' 
                }
*/
