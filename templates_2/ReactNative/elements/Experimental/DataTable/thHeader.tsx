/*
path: thHeader.tsx
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/5ec1574d22999c4a5e8e0dc7/elements/Experimental/DataTable/thHeader.tsx
keyPath: elements/Experimental/DataTable/thHeader.tsx
unique_id: N4ewiTpp
*/
import { flexRender } from '@tanstack/react-table'
import React, { FunctionComponent } from 'react'
import styles from './table.module.scss'

const AptugoDataTableTH: FunctionComponent<any> = (props) => {
  const { header, onRequestSort } = props

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
      {header.isPlaceholder ? null : flexRender(header.column.columnDef.header, header.getContext())}
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