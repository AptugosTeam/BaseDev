/*
path: dataTable.tsx
keyPath: elements/Experimental/DataTable/dataTable.tsx
unique_id: zcBmqA6e
*/
import React, { FunctionComponent } from 'react'
import {
  ColumnResizeMode,
  createColumnHelper,
  flexRender,
  getCoreRowModel,
  getSortedRowModel,
  SortingState,
  useReactTable,
} from '@tanstack/react-table'
import AptugoDataTableTH from './thHeader'
import styles from './table.module.scss'

interface tableProps {
  tableData: Array<Array<string>> | Array<any>
  columnInfo: any[]
  onRequestEdit: Function
  onRequestRemove: Function
  onRequestSort: Function
}



const AptugoDataTable: FunctionComponent<tableProps> = (props) => {
  const [sorting, setSorting] = React.useState<SortingState>([])
  const columnHelper = createColumnHelper()

  const columns = props.columnInfo.map((column) => {
    return columnHelper.accessor(column.id, {
      cell: (info) => (column.renderValue ? column.renderValue(info) : info.getValue()),
      footer: (info) => column.id,
      size: column.size || null,
      header: column.header ? column.header : column.id,
    })
  })

  const [columnResizeMode, setColumnResizeMode] = React.useState<ColumnResizeMode>('onChange')

  const table = useReactTable({
    data: props.tableData,
    state: {
      sorting,
    },
    columns,
    columnResizeMode,
    onSortingChange: setSorting,
    getCoreRowModel: getCoreRowModel(),
    getSortedRowModel: getSortedRowModel(),
  })

  return (
    <div className={styles.tableHolder}>
      <table className={styles.table}>
        <thead className={styles.tableHead}>
          {table.getHeaderGroups().map((headerGroup) => (
            <tr key={headerGroup.id} className={styles.tableHeadTR}>
              {headerGroup.headers.map((header) => (
                <AptugoDataTableTH key={`__${header.id}`} header={header} {...props} />
              ))}
            </tr>
          ))}
        </thead>
        <tbody>
          {table.getRowModel().rows.map((row, rowIndex) => (
            <tr key={row.id}>
              {row.getVisibleCells().map((cell, cellIndex) => {
                const toRender = row.getValue(cell.column.id) ? flexRender(cell.column.columnDef.cell, cell.getContext()) : '---'
                return (
                  <td key={cell.id} style={ { width: cell.column.getSize() } }>
                    {toRender}
                  </td>
                )
              })}
              <td className={styles.actionContainer}>
                <div
                  className={styles.button}
                  onClick={() => {
                    props.onRequestEdit(props.tableData[rowIndex])
                  }}
                >
                  <svg width="1em" height="1em" viewBox="0 0 14 14" xmlns="http://www.w3.org/2000/svg">
                    <g fill="none" fillRule="evenodd">
                      <path fillOpacity="0.01" fill="#FFF" opacity="0.01" d="M0 0h14v14H0z"></path>
                      <g stroke="#000" strokeLinejoin="round">
                        <path d="M4.377 12.209.5 13.349l1.14-3.877L8.482 2.63l2.737 2.737z"></path>
                        <path
                          d="M8.482 2.63 10.346.766a.915.915 0 0 1 1.29 0l1.447 1.447a.915.915 0 0 1 0 1.29l-1.864 1.864"
                          strokeLinecap="round"
                        ></path>
                      </g>
                    </g>
                  </svg>
                </div>
                <div
                  className={styles.button}
                  onClick={() => {
                    props.onRequestRemove(props.tableData[rowIndex])
                  }}
                >
                  <svg width="12" height="14" viewBox="0 0 12 14" xmlns="http://www.w3.org/2000/svg" className="svg-md valign-middle mg-r-5">
                    <g fill="none" fillRule="evenodd">
                      <path fillOpacity=".01" fill="#FFF" opacity=".01" d="M-1 0h14v14H-1z"></path>
                      <g stroke="#000" strokeLinecap="round" strokeLinejoin="round">
                        <path d="M.042 3.1H11.742M10.442 3.1v9.1a1.3 1.3 0 0 1-1.3 1.3h-6.5a1.3 1.3 0 0 1-1.3-1.3V3.1M3.292 3.1V1.8a1.3 1.3 0 0 1 1.3-1.3h2.6a1.3 1.3 0 0 1 1.3 1.3v1.3M4.592 6.35v3.9M7.192 6.35v3.9"></path>
                      </g>
                    </g>
                  </svg>
                </div>
              </td>
            </tr>
          ))}
        </tbody>
        <tfoot>
          {table.getFooterGroups().map((footerGroup) => (
            <tr key={footerGroup.id}>
              {footerGroup.headers.map((header) => (
                <th key={header.id}>{header.isPlaceholder ? null : flexRender(header.column.columnDef.footer, header.getContext())}</th>
              ))}
            </tr>
          ))}
        </tfoot>
      </table>
    </div>
  )
}

export default AptugoDataTable
