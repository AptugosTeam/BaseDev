/*
path: TimeoutGame.tpl
keyPath: elements/ProgramToGame/TimeoutGame.tpl
unique_id: IcPG22JL
icon: f:asset-loader.svg
options:
  - name: valuesTimes
    display: Times to set
    type: text
*/
setTimeout(() => {
            {{content | raw }}
        }, {{element.values.valuesTimes}});