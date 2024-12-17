/*
path: 999_kanbanColumn.js
keyPath: elements/Experimental/Kanban/999_kanbanColumn.js
unique_id: 0Pg5OUMF
internalUse: true
*/
import React, { FunctionComponent } from 'react'
import { useDrop } from 'react-dnd'
import clsx from 'clsx'

function Column({
    columnItem,
    onDrop,
    theme,
    columnIndex,
    children,
    className,
    {{ element.values.returnProps }}
}) {
    const [{ isOver }, drop] = useDrop({
        accept: 'card',
        drop(item: any) {
            if (onDrop) {
                onDrop(item, columnItem)
            }
        },
        collect: (monitor) => ({
            isOver: monitor.isOver(),
        }),
    })

    return (
        <div ref={drop} className={className ? className : clsx(theme[columnItem.Color], columnIndex % 2 === 0 ? theme.odd : theme.even)}>
            {children({ columnItem, columnIndex, {{ element.values.returnProps }} })}
        </div>
    )
}

interface kanbanProps {
    columnInfo: any[]
    onDrop?: Function
    theme: any
    className?: any
}

const AptugoKanbanColumn: FunctionComponent<kanbanProps> = React.memo((props) => {
    const { columnInfo = [], theme, onDrop, className, {{ element.values.additionalProps }} } = props?.properties || {}

    const ref = React.useRef(null)

    return (
        <React.Fragment>
            <div ref={ref}>
                {columnInfo?.map((columnItem, columnIndex) => {
                    {{ element.values.componentCode | raw }}
                    
                    return (
                        <Column
                            key={columnIndex}
                            columnItem={columnItem}
                            onDrop={onDrop}
                            theme={theme}
                            columnIndex={columnIndex}
                            className={className}
                            {{ element.values.propsColumn | raw}}
                        >
                            {props.children}
                        </Column>
                    )
                })}
            </div>
        </React.Fragment>
    )
},
    (prevProps, nextProps) => {
        return (
            JSON.stringify(prevProps?.properties) === JSON.stringify(nextProps?.properties)
        )
    })


export default AptugoKanbanColumn