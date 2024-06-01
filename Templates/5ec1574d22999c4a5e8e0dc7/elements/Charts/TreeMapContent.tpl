/*
path: TreeMapContent.tpl
completePath: elements/Experimental/Charts/TreeMapContent.tpl
type: file
unique_id: 5ayjlw9r
icon: ico-chart-bar
options:
  - name: values
    display: Values
    type: text
  - name: textColor
    display: Text color
    type: text
  - name: fontSizeTitle
    display: Font size title
    type: text
  - name: fontSizeSubtitle
    display: Font size subtitle
    type: text
children: []
*/
 <g>
        <rect
          x={x}
          y={y}
          width={width}
          height={height}
          style={ 
            {
              fill:
                depth < 2
                  ? colors[index]
                  : "#ffffff00",
              stroke: "#fff",
              strokeWidth: 3 / (depth + 1e-10),
              strokeOpacity: 2 / (depth + 1e-10),
            } 
          }
        />
        {depth === 2 ? (
       
            <text
              x={x + width / 2}
              y={y + height / 2}
              textAnchor="middle"
              fill="{{ element.values.textColor }}"
              fontSize={ {{ element.values.fontSizeTitle }} }
            >
              {name}
            </text>
        ) : null}
         {depth === 2 ? (
       
       <text
         x={x + width / 2}
         y={y + height / 2 + 12}
         textAnchor="middle"
         fill="{{ element.values.textColor }}"
         fontSize={ {{ element.values.fontSizeSubtitle }} }
       >
         {category}
       </text>
   ) : null}
      </g>
