/*
path: grid.tpl
completePath: elements/Material-UI/grid.tpl
unique_id: 7BJs3nUt
children: []
options:
  - name: container
    display: Is the container
    type: checkbox
    options: ''
  - name: className
    display: ClassName
    type: text
    options: ''
  - name: justify
    display: Justify
    type: dropdown
    options: flex-start;center;flex-end;space-between;space-around;space-evenly
  - name: align
    display: Align
    type: dropdown
    options: flex-start;center;flex-end;stretch;baseline
  - name: smallcolumns
    display: Columns (small)
    type: text
    options: flex-start;center;flex-end;stretch;baseline
  - name: midcolumns
    display: Columns (mid)
    type: text
    options: flex-start;center;flex-end;stretch;baseline
  - name: spacing
    display: Spacing
    type: text
    options: flex-start;center;flex-end;stretch;baseline
helpText: >-
  The Material Design responsive layout grid adapts to screen size and
  orientation, ensuring consistency across layouts.
icon: ico-grid
*/
{/* Grid */}
{{ content | raw }}

