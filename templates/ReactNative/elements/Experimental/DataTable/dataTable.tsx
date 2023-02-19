/*
path: dataTable.tsx
keyPath: elements/Experimental/DataTable/dataTable.tsx
unique_id: zcBmqA6e
*/
import {
  ColumnResizeMode,
  createColumnHelper,
  flexRender,
  getCoreRowModel,
  getSortedRowModel,
  SortingState,
  PaginationState,
  useReactTable,
} from '@tanstack/react-table'
import React, { FunctionComponent } from 'react'
import styles from './table.module.scss'
import AptugoDataTableTH from './thHeader'

interface tableProps {
  tableData: Array<Array<string>> | Array<any>
  pages: number
  columnInfo: any[]
  onRequestEdit: Function
  onRequestRemove: Function
  onRequestSort: Function
  onRequestPaginate: Function
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

  const setPagination = (parameters) => {
    const result = parameters({ pageIndex, pageSize })
    props.onRequestPaginate({ page: result.pageIndex + 1, limit: result.pageSize })
    _setPagination(result)
  }

  const [{ pageIndex, pageSize }, _setPagination] =
    React.useState<PaginationState>({
      pageIndex: 0,
      pageSize: 10,
    })

  const pagination = React.useMemo(
    () => ({
      pageIndex,
      pageSize,
    }),
    [pageIndex, pageSize]
  )

  const table = useReactTable({
    data: props.tableData,
    pageCount: props.pages,
    state: {
      sorting,
      pagination,
    },
    onPaginationChange: setPagination,
    columns,
    columnResizeMode,
    manualPagination: true,
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
                  <td key={cell.id} style={ { width: cell.column.getSize() }}>
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
          {table.getFooterGroups().map((footerGroup) => {
            return (
              <tr key={footerGroup.id}>
                <td colSpan={footerGroup.headers.length} className={styles.paginationContainer}>
                  <div className={styles.leftContainer}>
                    <div className={styles.numberOfElements}>
                      Page {table.getState().pagination.pageIndex + 1} of {table.getPageCount()}
                    </div>
                    <div className={styles.actionContainer}>
                      <div className={`${styles.button} ${!table.getCanPreviousPage() ? styles.disabled : null }`} onClick={() => table.getCanPreviousPage() && table.previousPage()}><svg width="1em" height="1em" viewBox="0 0 7 14" fill="currentColor" aria-hidden="true" focusable="false" className="rs-icon" aria-label="page previous" data-category="legacy"><path d="M2.333 7l3.5-4-.583-.667L1.167 7l4.083 4.667.583-.667z"></path></svg></div>
                      {[...Array(props.pages).keys()].map(page => {
                      return (<div key={`${page}_page`} className={`${styles.button} ${pagination.pageIndex === page ? styles.currentPage : null}`} onClick={() => table.setPageIndex(page)}>{page + 1}</div>)})}
                      <div className={`${styles.button} ${!table.getCanNextPage() ? styles.disabled : null }`} onClick={() => table.getCanNextPage() && table.nextPage()}><svg width="1em" height="1em" viewBox="0 0 7 14" fill="currentColor" aria-hidden="true" focusable="false" className="rs-icon" aria-label="page next" data-category="legacy"><path d="M4.667 7l-3.5 4 .583.667L5.833 7 1.75 2.333 1.167 3z"></path></svg></div>
                    </div>
                  </div>
                  <div className={styles.rightContainer}>Showing 25 per page</div>
                </td>
              </tr>
            )
          } )}
        </tfoot>
      </table>
    </div>
  )
}

export default AptugoDataTable

