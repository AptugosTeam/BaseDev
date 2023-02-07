import { createColumnHelper, flexRender, getCoreRowModel, useReactTable } from '@tanstack/react-table'
import React, { FunctionComponent } from 'react'
import style from './index.module.scss'

interface tableProps {
  addProcedure?: Function
  addTitle?: string
  addText?: string
  tableData: Array<Array<string>> | Array<any>
  tableHead: string[]
  orderBy?: string
  order?: 'asc' | 'desc'
  onRequestSort?: Function
}

const TableHeader = (tableProps) => {
  const { tableHead, orderBy, order, onRequestSort } = tableProps
  const createSortHandler = (property) => (event: React.MouseEvent<unknown>) => {
    onRequestSort(event, property)
  }

  const renderHeader = (headCell) => {
    if (!onRequestSort) return headCell

    return (
      <TableSortLabel
        active={orderBy === headCell}
        direction={orderBy === headCell ? order : 'asc'}
        onClick={createSortHandler && createSortHandler(headCell)}
      >
        {headCell}
      </TableSortLabel>
    )
  }

  return (
    <thead>
      {tableHead.getHeaderGroups().map((headerGroup) => (
        <tr key={headerGroup.id}>
          {headerGroup.headers.map((header) => (
            <th key={header.id}>{header.isPlaceholder ? null : flexRender(header.column.columnDef.header, header.getContext())}</th>
          ))}
        </tr>
      ))}
    </thead>
  )
}
const TableBody = (tableProps) => {
  const { tableData } = tableProps
  const createSortHandler = (property) => (event: React.MouseEvent<unknown>) => {
    onRequestSort(event, property)
  }

  return (
    <tbody>
      {tableData.getRowModel().rows.map((row) => (
        <tr key={row.id}>
          {row.getVisibleCells().map((cell) => (
            <td key={cell.id}>{flexRender(cell.column.columnDef.cell, cell.getContext())}</td>
          ))}
        </tr>
      ))}
    </tbody>
  )
}
// type Person = {
//   firstName: string
//   lastName: string
//   age: number
//   visits: number
//   status: string
//   progress: number
// }

// const defaultData: Person[] = [
//   {
//     firstName: 'tanner',
//     lastName: 'linsley',
//     age: 24,
//     visits: 100,
//     status: 'In Relationship',
//     progress: 50,
//   },
//   {
//     firstName: 'tandy',
//     lastName: 'miller',
//     age: 40,
//     visits: 40,
//     status: 'Single',
//     progress: 80,
//   },
//   {
//     firstName: 'joe',
//     lastName: 'dirte',
//     age: 45,
//     visits: 20,
//     status: 'Complicated',
//     progress: 10,
//   },
// ]

const columnHelper = createColumnHelper()

const columns = [
  columnHelper.accessor('firstName', {
    cell: info => info.getValue(),
    footer: info => info.column.id,
  }),
  columnHelper.accessor(row => row.lastName, {
    id: 'lastName',
    cell: info => <i>{info.getValue()}</i>,
    header: () => <span>Last Name</span>,
    footer: info => info.column.id,
  }),
  columnHelper.accessor('age', {
    header: () => 'Age',
    cell: info => info.renderValue(),
    footer: info => info.column.id,
  }),
  columnHelper.accessor('visits', {
    header: () => <span>Visits</span>,
    footer: info => info.column.id,
  }),
  columnHelper.accessor('status', {
    header: 'Status',
    footer: info => info.column.id,
  }),
  columnHelper.accessor('progress', {
    header: 'Profile Progress',
    footer: info => info.column.id,
  }),
]

const Tanstack: FunctionComponent<tableProps> = (props) => {
  const [data, setData] = React.useState(() => [...props.tableData])
  const rerender = React.useReducer(() => ({}), {})[1]

  const table = useReactTable({
    data,
    getCoreRowModel: getCoreRowModel(),
  })

  // table.getHeaderGroups().map((headerGroup) => console.log(headerGroup))

  return (
    <div>
      <table className={style.tabla}>
        {props.tableHead !== undefined ? <TableHeader {...props} /> : null}
        <thead>
          {table.getHeaderGroups().map((headerGroup) => (
            <tr key={headerGroup.id}>
              {headerGroup.headers.map((header) => (
                <th key={header.id}>{header.isPlaceholder ? null : flexRender(header.column.columnDef.header, header.getContext())}</th>
              ))}
            </tr>
          ))}
        </thead>
        {props.tableData !== undefined ? <TableBody {...props} /> : null}
        <tbody>
          {table.getRowModel().rows.map((row) => (
            <tr key={row.id}>
              {row.getVisibleCells().map((cell) => (
                <td key={cell.id}>{flexRender(cell.column.columnDef.cell, cell.getContext())}</td>
              ))}
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
      <button onClick={() => rerender()}>Rerender</button>
    </div>
  )
}

export default Tanstack
