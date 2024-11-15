/*
path: muiTable.tpl
type: file
unique_id: UoaaCs5K
icon: ico-mui-table
settings:
  - name: Packages
    value: |-
      "mui-datatables": "latest",
      "react-number-format": "latest",
children: []
*/
{% set bpr %}
import MUIDataTable, { Display, FilterType, MUIDataTableOptions, Responsive } from 'mui-datatables'
import axios from 'axios'
import Button from '@mui/material/Button'
import { NumericFormat } from 'react-number-format'
{% endset %}
{{ save_delayed('bpr',bpr) }}

{% set ph %}
const DefaultStockMuiTableOptions = {
    displayEPS: 'true',
    displayEarningDate: 'true',
    displayName: 'true',
    displayPE: 'true',
    displayRating: 'true',
    displaySector: 'true',
    searchOpen: true
  }

  const tableOptions = props.tableOptions ? props.tableOptions : {}
  const stockMuiTableOptions = { ...DefaultStockMuiTableOptions, ...tableOptions }

  const [sortDirection, setSortDirection] = React.useState('asc')
  const [sortColumn, setSortColumn] = React.useState('Symbol')

  const preparedSortDirection: 'asc' | 'desc' | 'none' = sortDirection === 'descending' || sortDirection === 'desc' ? 'desc' : 'asc'
  const sectorSortDirection: 'asc' | 'desc' | 'none' = sortColumn === 'Sector' ? preparedSortDirection : 'none'
  const symbolSortDirection: 'asc' | 'desc' | 'none' = sortColumn === 'Symbol' ? preparedSortDirection : 'none'
  const nameSortDirection: 'asc' | 'desc' | 'none' = sortColumn === 'Name' ? preparedSortDirection : 'none'
  const priceSortDirection: 'asc' | 'desc' | 'none' = sortColumn === 'Price' ? preparedSortDirection : 'none'
  const percentChangeSortDirection: 'asc' | 'desc' | 'none' = sortColumn === '% Change' ? preparedSortDirection : 'none'
  const priceEarningsSortDirection: 'asc' | 'desc' | 'none' = sortColumn === 'P/E' ? preparedSortDirection : 'none'

  const [data, setData] = React.useState([])
  const [count, setCount] = React.useState(0)
  const [page, setPage] = React.useState(1)
  const [rowsPerPage, setRowsPerPage] = React.useState(100)
  const [clickedSymbol, setClickedSymbol] = React.useState('')
  const [modalShow, setModalShow] = React.useState(false)



  const handleClick = (event: any): void => {
    const { target: { innerText } } = event
    setClickedSymbol(innerText)
    setModalShow(true)
  }

    const columns = [ // Se tendria que crear con objetos dentro de la tabla
    {
      name: 'Curso',
      options: {
        // sort: false,
        display: stockMuiTableOptions.displaySector,
        sortDirection: sectorSortDirection,
      },
    },
    {
      name: 'Clicks por usuario',
      options: {
        // display: displayFalse,
        // sort: false,
        display: stockMuiTableOptions.displayName,
        sortDirection: nameSortDirection,
      },
    },
    {
      name: 'Clicks totales',
      options: {
        // display: displayFalse,
        // sort: false,
        display: stockMuiTableOptions.displayName,
        sortDirection: nameSortDirection,
      },
    },
    {
      name: 'Quiero inscribirme',
      options: {
        // display: displayFalse,
        // sort: false,
        display: stockMuiTableOptions.displayName,
        sortDirection: nameSortDirection,
      },
    },
  ]

  const options = { 
    download: true,
    downloadOptions: {
      filename: 'table.csv',
      separator: ',', 
    },
    selectableRows: 'none', 
    pagination: false, 
    search: false, 
    filter: false, 
    print: false, 
    viewColumns: false, 
    responsive: 'simple', 
  };
{% endset %}
{{ save_delayed('ph',ph) }}
<MUIDataTable
    title={''}
    data={data}
    columns={columns}
    options={options}
/>