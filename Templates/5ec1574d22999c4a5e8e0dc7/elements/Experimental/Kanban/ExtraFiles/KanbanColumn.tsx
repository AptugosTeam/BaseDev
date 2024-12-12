/*
path: KanbanColumn.tsx
completePath: >-
  C:\Users\Usuario\Aptugo\BaseDev\Templates\5ec1574d22999c4a5e8e0dc7\elements\Experimental\Kanban\ExtraFiles\KanbanColumn.tsx
keyPath: elements\Experimental\Kanban\ExtraFiles\KanbanColumn.tsx
unique_id: 0Pg5OUMF
*/
import React, { FunctionComponent } from 'react'
import { useDrop } from 'react-dnd'
import clsx from 'clsx'

function Column({
    columnItem,
    filteredItems,
    onDrop,
    theme,
    columnIndex,
    children,
    className,
    cardCount
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
        <div ref={drop} className={className ? className : clsx(theme[columnItem.Color], columnIndex % 2 === 0 ? theme.odd: theme.even)}>
            {children({ columnItem, columnIndex, filteredItems, cardCount })}
        </div>
    );
}

interface kanbanProps {
    columnInfo: any[]
    onDrop?: Function
    theme: any
    className?: any
  }

const AptugoComponent: FunctionComponent<kanbanProps> = React.memo((props) => {
    const { columnInfo = [], theme, onDrop, filteredItemsByColumn, className } = props?.properties || {}

    const ref = React.useRef(null)

    return (
        <React.Fragment>
            <div ref={ref}>
                {columnInfo?.map((columnItem, columnIndex) => {
                    {{ insert_setting('skibidiMacucas') | raw }}
                    const filteredItems = filteredItemsByColumn[columnIndex]
                    const cardCount = filteredItems?.length
                    return (
                        <Column
                            key={columnIndex}
                            columnItem={columnItem}
                            filteredItems={filteredItems}
                            onDrop={onDrop}
                            theme={theme}
                            columnIndex={columnIndex}
                            className={className}
                            cardCount={cardCount}
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


export default AptugoComponent