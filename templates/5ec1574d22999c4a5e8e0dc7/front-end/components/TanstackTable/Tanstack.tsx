/*
path: Tanstack.tsx
completePath: front-end/components/TanstackTable/Tanstack.tsx
unique_id: KaVZpxkg
*/

import React, { FunctionComponent } from 'react'
import style from './index.module.scss'
import { createColumnHelper, flexRender, getCoreRowModel, useReactTable } from '@tanstack/react-table'

type Person = {
  firstName: string
  lastName: string
  age: number
  visits: number
  status: string
  progress: number
}

const defaultData: Person[] = [
  {
    firstName: 'tanner',
    lastName: 'linsley',
    age: 24,
    visits: 100,
    status: 'In Relationship',
    progress: 50,
  },
  {
    firstName: 'tandy',
    lastName: 'miller',
    age: 40,
    visits: 40,
    status: 'Single',
    progress: 80,
  },
  {
    firstName: 'joe',
    lastName: 'dirte',
    age: 45,
    visits: 20,
    status: 'Complicated',
    progress: 10,
  },
]

const columnHelper = createColumnHelper<Person>()

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
    const [data, setData] = React.useState(() => [...defaultData])
    const rerender = React.useReducer(() => ({}), {})[1]

    const table = useReactTable({
      data,
      columns,
      getCoreRowModel: getCoreRowModel(),
    })



    return (
      <div >
        <table className={style.tabla}>
          <thead>
            {table.getHeaderGroups().map(headerGroup => (
              <tr key={headerGroup.id}>
                {headerGroup.headers.map(header => (
                  <th key={header.id}>
                    {header.isPlaceholder
                      ? null
                      : flexRender(
                        header.column.columnDef.header,
                        header.getContext()
                      )}
                  </th>
                ))}
              </tr>
            ))}
          </thead>
          <tbody>
            {table.getRowModel().rows.map(row => (
              <tr key={row.id}>
                {row.getVisibleCells().map(cell => (
                  <td key={cell.id}>
                    {flexRender(cell.column.columnDef.cell, cell.getContext())}
                  </td>
                ))}
              </tr>
            ))}
          </tbody>
          <tfoot>
            {table.getFooterGroups().map(footerGroup => (
              <tr key={footerGroup.id}>
                {footerGroup.headers.map(header => (
                  <th key={header.id}>
                    {header.isPlaceholder
                      ? null
                      : flexRender(
                        header.column.columnDef.footer,
                        header.getContext()
                      )}
                  </th>
                ))}
              </tr>
            ))}
          </tfoot>
        </table>
        <button onClick={() => rerender()}>
          Rerender
        </button>
      </div>
    )
}

export default Tanstack

// import Table from '@mui/material/Table'
// import TableBody from '@mui/material/TableBody'
// import TableCell from '@mui/material/TableCell'
// import TableHead from '@mui/material/TableHead'
// import TableSortLabel from '@mui/material/TableSortLabel'
// import TableRow from '@mui/material/TableRow'
// import React, { FunctionComponent } from 'react'
// import styles from './table.module.scss'

// interface tableProps {
//   addProcedure?: Function
//   addTitle?: string
//   addText?: string
//   tableData: Array<Array<string>> | Array<any>
//   tableHead: string[]
//   orderBy?: string
//   order?: 'asc' | 'desc'
//   onRequestSort?: Function
// }

// const TableHeader = (tableProps) => {
//   const { tableHead, orderBy, order, onRequestSort } = tableProps;
//   const createSortHandler = (property) => (event: React.MouseEvent<unknown>) => {
//     onRequestSort(event, property)
//   }

//   const renderHeader = (headCell) => {
//     if (!onRequestSort) return headCell

//     return <TableSortLabel
//       active={orderBy === headCell}
//       direction={orderBy === headCell ? order : 'asc'}
//       onClick={createSortHandler && createSortHandler(headCell)}
//     >
//       {headCell}
//     </TableSortLabel>
//   }

//   return (
//     <TableHead>
//       <TableRow>
//         {tableHead.map((headCell, key) => (
//           <TableCell
//             key={key}
//             sortDirection={orderBy === headCell ? order : false}
//           >
//             {renderHeader(headCell)}
//           </TableCell>
//         ))}
//       </TableRow>
//     </TableHead>
//   );
// }

// const AptugoTable: FunctionComponent<tableProps> = (props) => {
//   const RenderCells = (cellData: React.ReactNode[]) => {
//     let children = [props.children]
//     try {
//       children = [...(props.children as Array<any>)]
//     } catch (e) {}

//     return children.map((child: any, index) => {
//       let newProps: any = { ...child.props }

//       for (const [key, value] of Object.entries(newProps)) {
//         newProps[key] = typeof value === 'function' ? value(cellData) : value
//       }
//       if (child.props.onClickCapture)
//         newProps['onClickCapture'] = (e: React.MouseEvent<HTMLButtonElement, MouseEvent>) => {
//           child.props.onClickCapture({ ...e, element: cellData })
//         }

//       newProps.children = React.Children.map(child.props.children, (subChild) => {
//         let newSubProps: any = {}
//         if (subChild.props.onClickCapture)
//           newSubProps['onClickCapture'] = (e: React.MouseEvent<HTMLButtonElement, MouseEvent>) => {
//             subChild.props.onClickCapture({ ...e, element: cellData })
//           }
//         return React.cloneElement(subChild, newSubProps)
//       })

//       const newChild = React.cloneElement(child, newProps)
//       return <TableCell className={'tableCell'} key={`child${index}`}>{newChild}</TableCell>
//     })
//   }

//   return (
//     <div className={styles.tableHolder}>
//       <Table className={styles.table}>
//         {props.tableHead !== undefined ? <TableHeader {...props} /> : null}
//         <TableBody>
//           {props.tableData?.map((row, key) => {
//             const fields = Object.values(row)
//             return (
//               <TableRow key={key} className={styles.tableBodyRow}>
//                 {Array.isArray(props.children)
//                   ? RenderCells(row)
//                   : fields.map((field, subkey) => (
//                       <TableCell className={styles.tableCell} key={subkey}>
//                         {field}
//                       </TableCell>
//                     ))}
//               </TableRow>
//             )
//           })}
//         </TableBody>
//       </Table>
//     </div>
//   )
// }

// export default AptugoTable
