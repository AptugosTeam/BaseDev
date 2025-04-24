/*
path: thHeader.tsx
keyPath: elements/Experimental/DataTable/thHeader.tsx
unique_id: N4ewiTpp
*/
import { flexRender } from '@tanstack/react-table'
import React, { FunctionComponent } from 'react'
import styles from './table.module.scss'
import DebouncedInput from '@components/DebouncedInput'

const AptugoDataTableTH: FunctionComponent<any> = (props) => {
  const { header, onRequestSort } = props
  const secondHeaderRowRef = React.useRef(null)
  const [currentColumn, setcurrentColumn] = React.useState(props.columnInfo[header.index])
  const [isEditing, setisEditing] = React.useState(false)
  const [isFiltering, setisFiltering] = React.useState(false)

  const switchEdition = () => {
    setisEditing(!isEditing)
  }

  const switchFilterDisplay = () => {
    setisFiltering(!isFiltering)
  }

  const onBlur = (e) => {
    if (currentColumn.header !== header.column.columnDef.header) {
      props.onColumnRename(e, currentColumn)
    }
    setisEditing(false)
  }

  const allowSorting = !!props.onRequestSort
  const sortingObject = {
    asc: (
      <svg width="1em" height="1em" viewBox="0 0 10 14" xmlns="http://www.w3.org/2000/svg">
        <g fill="none" fillRule="evenodd">
          <path fillOpacity="0.01" fill="#FFF" opacity="0.01" d="M-2 0h14v14H-2z"></path>
          <g stroke="#000" strokeLinecap="round" strokeLinejoin="round">
            <path d="M.875 4.813 4.938.75 9 4.813M4.938 13.25V.75"></path>
          </g>
        </g>
      </svg>
    ),
    desc: (
      <svg width="1em" height="1em" viewBox="0 0 10 14" xmlns="http://www.w3.org/2000/svg">
        <g fill="none" fillRule="evenodd">
          <path fillOpacity="0.01" fill="#FFF" opacity="0.01" d="M-2 0h14v14H-2z"></path>
          <g stroke="#000" strokeLinecap="round" strokeLinejoin="round">
            <path d="M9.125 9.187 5.063 13.25 1 9.187M5.062.75v12.5"></path>
          </g>
        </g>
      </svg>
    ),
  }

  React.useEffect(() => {
    function handleClickOutside(event) {
      if (secondHeaderRowRef.current && !secondHeaderRowRef.current.contains(event.target)) {
        setisFiltering(false)
      }
    }

    document.addEventListener('mousedown', handleClickOutside)
    return () => {
      document.removeEventListener('mousedown', handleClickOutside)
    };
  }, [secondHeaderRowRef])

  return (
    <th key={header.id} colSpan={header.colSpan} style={ { width: header.getSize() } }>
      <div className={styles.firstHeaderRow}>
        {!header.isPlaceholder && (
          <div>
            {!!allowSorting && (sortingObject[header.column.getIsSorted() as string] ?? '')}
            <>{flexRender(header.column.columnDef.header, header.getContext())}</>
          </div>
        )}
        {!!allowSorting && <div
          className={styles.actionContainer}
          onClick={(e) => {
            onRequestSort(header.column.id)
            header.column.getToggleSortingHandler()(e)
          }}
        >
          <div className={styles.button}>
            <svg width="1em" height="1em" viewBox="0 0 14 14" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path opacity="0.01" fill="#fff" fillOpacity="0.2" d="M0 0h14v14H0z"></path>
              <path fillRule="evenodd" clipRule="evenodd" d="m7 10.5-5.5-6h11l-5.5 6Z" fill="#666"></path>
            </svg>
          </div>
        </div>}
        <div
            className={styles.actionContainer}
            onClick={switchFilterDisplay}
          >
            <div className={styles.button}>
              <svg width="1em" height="1em" viewBox="0 0 14 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                <circle cx="7" cy="2" r="1.5" fill="#666" />
                <circle cx="7" cy="7" r="1.5" fill="#666" />
                <circle cx="7" cy="12" r="1.5" fill="#666" />
              </svg>
            </div>
          </div>
        <div
          {...{
            onMouseDown: header.getResizeHandler(),
            onTouchStart: header.getResizeHandler(),
            className: `${styles.resizer} ${header.column.getIsResizing() ? styles.isResizing : ''}`,
          }}
        ></div>
      </div>
      {isFiltering && <div className={styles.secondHeaderRow} onClick={(e) => e.stopPropagation()} ref={secondHeaderRowRef}>
        <DebouncedInput
          type="number"
          value={(header.column.getFilterValue() as [number, number])?.[0] ?? ''}
          onChange={value => {
            const oldValue = (header.column.getFilterValue() as [number, number])?.[0] ?? '';
            if (value !== oldValue) {
              // header.column.setFilterValue((old: [number, number]) => [value, old?.[1]])
              props.onFilter([value, header.column.getFilterValue()?.[1] ?? ''])
            }
          }}
          placeholder={`Min`}
        />
        <DebouncedInput
          type="number"
          value={(header.column.getFilterValue() as [number, number])?.[1] ?? ''}
          onChange={value => {
            const oldValue = (header.column.getFilterValue() as [number, number])?.[1] ?? '';
            if (value !== oldValue) {
              // header.column.setFilterValue((old: [number, number]) => [old?.[0], value])
              props.onFilter([header.column.getFilterValue()?.[0] ?? '', value])
            }
          }}
          placeholder={`Max`}
        />
      </div>}
    </th>
  )
}

export default AptugoDataTableTH
