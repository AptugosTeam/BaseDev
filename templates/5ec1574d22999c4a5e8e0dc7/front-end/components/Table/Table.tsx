/*
path: Table.tsx
completePath: front-end/components/Table/Table.tsx
unique_id: KaVZdzkg
*/
import Table from '@mui/material/Table'
import TableBody from '@mui/material/TableBody'
import TableCell from '@mui/material/TableCell'
import TableHead from '@mui/material/TableHead'
import TableSortLabel from '@mui/material/TableSortLabel'
import TableRow from '@mui/material/TableRow'
import React, { FunctionComponent } from 'react'
import styles from './table.module.scss'

interface tableProps extends React.PropsWithChildren {
  addProcedure?: Function
  addTitle?: string
  addText?: string
  rowClassName?: string
  tableData: Array<Array<string>> | Array<any>
  tableHead: string[]
  orderBy?: string
  order?: 'asc' | 'desc'
  onRequestSort?: Function
  onRowClick?: (rowData: any) => void;
}

const TableHeader = (tableProps) => {
  const { tableHead, orderBy, order, onRequestSort } = tableProps;
  const createSortHandler = (property) => (event: React.MouseEvent<unknown>) => {
    onRequestSort(event, property)
  }

  const renderHeader = (headCell) => {
    if (!onRequestSort) return headCell

    return <TableSortLabel
      active={orderBy === headCell}
      direction={orderBy === headCell ? order : 'asc'}
      onClick={createSortHandler && createSortHandler(headCell)}
    >
      {headCell}
    </TableSortLabel>
  }

  return (
    <TableHead>
      <TableRow>
        {tableHead.map((headCell, key) => (
          <TableCell
            key={key}
            sortDirection={orderBy === headCell ? order : false}
          >
            {renderHeader(headCell)}
          </TableCell>
        ))}
      </TableRow>
    </TableHead>
  );
}

const AptugoTable: FunctionComponent<tableProps> = (props) => {
  const RenderCells = (cellData: React.ReactNode[]) => {
    let children = [props.children]
    try {
      children = [...(props.children as Array<any>)]
    } catch (e) {}

    return children.filter((c) => !!c).map((child: any, index) => {
      let newProps: any = { ...child.props }

      for (const [key, value] of Object.entries(newProps)) {
        newProps[key] = typeof value === 'function' ? value(cellData) : value
      }
      if (child.props.onClickCapture)
        newProps['onClickCapture'] = (e: React.MouseEvent<HTMLButtonElement, MouseEvent>) => {
          child.props.onClickCapture({ ...e, element: cellData })
        }

      newProps.children = React.Children.map(child.props.children, (subChild) => {
        let newSubProps: any = {}
        if (subChild.props.onClickCapture)
          newSubProps['onClickCapture'] = (e: React.MouseEvent<HTMLButtonElement, MouseEvent>) => {
            subChild.props.onClickCapture({ ...e, element: cellData })
          }
        return React.cloneElement(subChild, newSubProps)
      })

      const newChild = React.cloneElement(child, newProps)
      return <TableCell className={'tableCell'} key={`child${index}`} data-label={props.tableHead[index]}>{newChild}</TableCell>
    })
  }

  return (
    <div className={styles.tableHolder}>
      <Table className={styles.table}>
        {props.tableHead !== undefined ? <TableHeader {...props} /> : null}
        <TableBody>
          {props.tableData?.map((row, key) => {
            const fields = Object.values(row)
            const rowClass = typeof props.rowClassName === 'function' ? props.rowClassName(row) : props.rowClassName
            return (
              <TableRow key={key} className={rowClass || styles.tableBodyRow} onClick={() => props.onRowClick && props.onRowClick(row)} >
                {Array.isArray(props.children)
                  ? RenderCells({...row, key})
                  : fields.map((field:React.ReactNode, subkey) => (
                      <TableCell className={styles.tableCell} key={subkey}>
                        {field}
                      </TableCell>
                    ))}
              </TableRow>
            )
          })}
        </TableBody>
      </Table>
    </div>
  )
}

export default AptugoTable
