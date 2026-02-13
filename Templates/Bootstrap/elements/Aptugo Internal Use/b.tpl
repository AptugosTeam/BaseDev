/*
path: b.tpl
completePath: elements/Aptugo Internal Use/b.tpl
type: file
unique_id: evkkxPDn
icon: ico-field
sourceType: javascript
internalUse: true
children: []
options:
  - name: className
    display: ClassName
    type: chips
    options: >-
      return aptugo.assetUtils.grabCssSelectors(
      aptugo.variables.retrievePageVariablesFromElement(arguments[0],'theme') )
  - name: primaryColor
    display: Primary Color
    type: dropdown
    options: >-
      red;pink;purple;deepPurple;indigo;blue;lightBlue;cyan;teal;green;lightGreen;lime;yellow;amber;orange;deepOrange;brown;grey;blueGrey
  - name: extraThemeOptions
    display: Extra Theming options
    type: text    
*/
<div className={theme.wrapper}>
  {{ content | raw }}
</div>
