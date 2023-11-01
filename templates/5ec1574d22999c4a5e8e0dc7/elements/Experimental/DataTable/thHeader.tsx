/*
path: thHeader.tsx
keyPath: elements/Experimental/DataTable/thHeader.tsx
unique_id: N4ewiTpp
*/
import { flexRender } from '@tanstack/react-table'
import React, { FunctionComponent } from 'react'
import styles from './table.module.scss'

const AptugoDataTableTH: FunctionComponent<any> = (props) => {
  const { header, onRequestSort } = props
  const [currentColumn, setcurrentColumn] = React.useState(props.columnInfo[header.index])
  const [isEditing, setisEditing] = React.useState(false)

  const switchEdition = () => {
    setisEditing(!isEditing)
  }

  const onBlur = (e) => {
    if (currentColumn.header !== header.column.columnDef.header) {
      props.onColumnRename(e, currentColumn)
    }
    setisEditing(false)
  }

  

  return (
    <th key={header.id} colSpan={header.colSpan} style={ { width: header.getSize() }}>
      { {
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
      }[header.column.getIsSorted() as string] ?? ''}
      {!header.isPlaceholder &&
        <div>
          {!!currentColumn.allowRenaming && <>{
            isEditing ? <input className="editableInput" onBlur={onBlur} onChange={(e) => { setcurrentColumn({...currentColumn, header: e.target.value }) }} value={currentColumn.header}></input> : <div onClick={switchEdition}>{flexRender(header.column.columnDef.header, header.getContext())}</div>
          }</>}
          {!currentColumn.allowRenaming && <>{flexRender(header.column.columnDef.header, header.getContext())}</>}
        </div>
      }
      <div
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
      </div>
      {!!currentColumn.allowDeletion && (
        <div className={styles.columnDeletion} onClick={(e) => props.onColumnRemoval(e, header.column)}>
          <svg width="12" height="14" viewBox="0 0 12 14" xmlns="http://www.w3.org/2000/svg" className="svg-md valign-middle mg-r-5">
            <g fill="none" fillRule="evenodd">
              <path fillOpacity=".01" fill="#FFF" opacity=".01" d="M-1 0h14v14H-1z"></path>
              <g stroke="#000" strokeLinecap="round" strokeLinejoin="round">
                <path d="M.042 3.1H11.742M10.442 3.1v9.1a1.3 1.3 0 0 1-1.3 1.3h-6.5a1.3 1.3 0 0 1-1.3-1.3V3.1M3.292 3.1V1.8a1.3 1.3 0 0 1 1.3-1.3h2.6a1.3 1.3 0 0 1 1.3 1.3v1.3M4.592 6.35v3.9M7.192 6.35v3.9"></path>
              </g>
            </g>
          </svg>
        </div>
      )}
      <div
        {...{
          onMouseDown: header.getResizeHandler(),
          onTouchStart: header.getResizeHandler(),
          className: `${styles.resizer} ${header.column.getIsResizing() ? styles.isResizing : ''}`,
        }}
      ></div>
    </th>
  )
}

export default AptugoDataTableTH
