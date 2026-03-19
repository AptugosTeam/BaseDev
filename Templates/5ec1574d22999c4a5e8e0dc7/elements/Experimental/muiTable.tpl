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
import NumberFormat from 'react-number-format'
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

  const apiHost = 'https://api.fantasystockx.com'
  const apiEndpoint = `${apiHost}/stocks/mui`

  const handleClick = (event: any): void => {
    const { target: { innerText } } = event
    setClickedSymbol(innerText)
    setModalShow(true)
  }

  const columns = [{
    name: 'Sector',
    options: {
      // sort: false,
      display: stockMuiTableOptions.displaySector,
      sortDirection: sectorSortDirection,
    },
  }, {
    name: 'Name',
    options: {
      // display: displayFalse,
      // sort: false,
      display: stockMuiTableOptions.displayName,
      sortDirection: nameSortDirection,
    }
  }, {
    name: 'Symbol',
    options: {
      customBodyRender: (value: any, tableMeta: any, updateValue: any) => (
        <Button value={value} key={value} onClick={(event: any) => handleClick(event)}>{value}</Button>
      ),
      filter: false,
      hint: 'click ticker symbol to trade',
      // sort: t,
      sortDirection: symbolSortDirection,
    }
  }, {
    name: 'Price', options: {
      customBodyRender: (value: any, tableMeta: any, updateValue: any) => (
        <NumberFormat value={value} decimalScale={2} fixedDecimalScale={true} displayType={'text'} thousandSeparator={true} prefix={'$'} />
      ),
      sortDirection: priceSortDirection,
    },
    // sort: sortColumn === 'Price' ? true : false,
  }, {
    name: '% ∆',
    options: {
      customBodyRender: (value: any, tableMeta: any, updateValue: any) => {
        let className = ''

        if (value > 0) {
          className = 'tickerGain'
        } else if (value < 0) {
          className = 'tickerLoss'
        }

        return (
          <span className={className}>
            <NumberFormat value={value} decimalScale={2} fixedDecimalScale={true} displayType={'text'} thousandSeparator={true} suffix={'%'} />
          </span>
        )
      },
      // sort: false,
      sortDirection: percentChangeSortDirection,
    }
  }, {
    name: '$ ∆',
    options: {
      customBodyRender: (value: any, tableMeta: any, updateValue: any) => {
        let className = ''

        if (value > 0) {
          className = 'tickerGain'
        } else if (value < 0) {
          className = 'tickerLoss'
        }

        return (
          <span className={className}>
            <NumberFormat value={value} decimalScale={2} fixedDecimalScale={true} displayType={'text'} thousandSeparator={true} prefix={'$'} />
          </span>
        )
      },
      // sort: false,
      sortDirection: percentChangeSortDirection,
    }
  }, {
    name: 'Target $', options: {
      customBodyRender: (value: any, tableMeta: any, updateValue: any) => {
        if (value === 0 || value === '0') {
          return <span>-</span>
        }

        return (
          <NumberFormat value={value} decimalScale={2} fixedDecimalScale={true} displayType={'text'} thousandSeparator={true} prefix={'$'} />
        )
      },
      sort: false,
      // sortDirection: priceSortDirection,
    },
      // sortDirection: priceSortDirection,
    // },
    // sort: sortColumn === 'Price' ? true : false,
  }, {
    name: 'T High $', options: {
      customBodyRender: (value: any, tableMeta: any, updateValue: any) => {
        if (value === 0 || value === '0') {
          return <span>-</span>
        }

        return (
          <NumberFormat value={value} decimalScale={2} fixedDecimalScale={true} displayType={'text'} thousandSeparator={true} prefix={'$'} />
        )
      },
      display: false,
      sort: false,
      // sortDirection: priceSortDirection,
    },
      // sortDirection: priceSortDirection,
    // },
    // sort: sortColumn === 'Price' ? true : false,
  }, {
    name: 'T Low $', options: {
      customBodyRender: (value: any, tableMeta: any, updateValue: any) => {
        if (value === 0 || value === '0') {
          return <span>-</span>
        }

        return (
          <NumberFormat value={value} decimalScale={2} fixedDecimalScale={true} displayType={'text'} thousandSeparator={true} prefix={'$'} />
        )
      },
      display: false,
      sort: false,
      // sortDirection: priceSortDirection,
    },
      // sortDirection: priceSortDirection,
    // },
    // sort: sortColumn === 'Price' ? true : false,
  }, {
    name: 'LC $', options: {
      customBodyRender: (value: any, tableMeta: any, updateValue: any) => (
        <NumberFormat value={value} decimalScale={2} fixedDecimalScale={true} displayType={'text'} thousandSeparator={true} prefix={'$'} />
      ),
      display: false,
      sort: false,
      // sortDirection: priceSortDirection,
    },
    // sort: sortColumn === 'Price' ? true : false,
  }, {
    name: 'Earnings Date',
    options: {
      display: stockMuiTableOptions.displayEarningDate,
      sort: false,
      // sortDirection: nameSortDirection,
    }
  }, {
    name: 'Rating',
    options: {
      customBodyRender: (value: any, tableMeta: any, updateValue: any) => {
        let className = ''

        if (value === 'buy') {
          className = 'tickerBuy'
        } else if (value === 'sell') {
          className = 'tickerSell'
        }

        return (
          <span className={className}>
            {value}
          </span>
        )
      },
      display: stockMuiTableOptions.displayRating,
      sort: false,
      // sortDirection: percentChangeSortDirection,
    }
  }, {
    name: '52 Wk', options: {
      customBodyRender: (value: any, tableMeta: any, updateValue: any) => {
        const pieces = value.split(' - ')
        return (
          <span>
            <NumberFormat value={pieces[0]} decimalScale={2} fixedDecimalScale={true} displayType={'text'} thousandSeparator={true} prefix={'$'} />
             &nbsp;-&nbsp;
            <NumberFormat value={pieces[1]} decimalScale={2} fixedDecimalScale={true} displayType={'text'} thousandSeparator={true} prefix={'$'} />
          </span>
        )
      },
      sort: false,
    }
  }, {
    name: 'EPS Avg', options: {
      customBodyRender: (value: any, tableMeta: any, updateValue: any) => {
        if (value === 0 || value === '0') {
          return <span>-</span>
        }

        return (
          <NumberFormat value={value} decimalScale={2} fixedDecimalScale={true} displayType={'text'} thousandSeparator={true} prefix={'$'} />
        )
      },
      display: stockMuiTableOptions.displayEPS,
      sort: false
      // sortDirection: priceSortDirection,
    },
    // sort: sortColumn === 'Price' ? true : false,
  }, {
    name: 'P/E',
    options: {
      customBodyRender: (value: any, tableMeta: any, updateValue: any) => {
        let className = ''

        if (value === 0 || value === '0') {
          return <span>-</span>
        }

        if (value >= 30) {
          className = 'peVeryHigh'
        } else if (value >= 20) {
          className = 'peHigh'
        } else if (value >= 10 && value <= 20) {
          className = 'peNormal'
        } else if (value < 10) {
          className = 'peLow'
        }

        return (
          <span className={className}>
            <NumberFormat value={value} decimalScale={2} fixedDecimalScale={true} displayType={'text'} thousandSeparator={true} suffix={'x'} />
          </span>
        )
      },
      display: stockMuiTableOptions.displayPE,
      sortDirection: priceEarningsSortDirection,
    },
  }, {
    name: 'Vol',
    options: {
      display: false,
      sort: false,
    },
  }, {
    name: 'Shrs Out',
    options: {
      display: false,
      sort: false,
    },
  }, {
    name: 'Mkt Cap',
    options: {
      display: false,
      sort: false,
    },
  }]

  const options: MUIDataTableOptions = {
    count,
    FilterType: 'dropdown',
    onChangePage: (currentPage: number) => {
      // tslint:disable-next-line:no-console
      // console.log('onChangePage1', { currentPage, page, rowsPerPage })

      // TODO figure out a non-hack way to handle this
      if (currentPage <= 0) {
        if (currentPage < page) {
          currentPage = page - 1
        } else if (currentPage >= page) {
          currentPage = page + 1
        }
      } else if (currentPage >= page) {
        currentPage = page + 1
      } else if (currentPage < page) {
        currentPage = page - 1
      }

      setPage(currentPage)
      // tslint:disable-next-line:no-console
      // console.log('onChangePage2', { currentPage, page, rowsPerPage })

      // API.post(apiEndpoint, { searchText, page: currentPage, limit: rowsPerPage, sortColumn, sortDirection, userId }).then(response => {
      //   setData(response.data.Payload)
      //   setCount(response.data.TotalRecordCount)
      // })
    },
    onChangeRowsPerPage: (numberOfRows: number) => {
      setRowsPerPage(numberOfRows)
        // tslint:disable-next-line:no-console
        // console.log('onChangeRowsPerPage', { numberOfRows, page, rowsPerPage })

      // API.post(apiEndpoint, { searchText: '', page, limit: numberOfRows, sortColumn, sortDirection, userId }).then(response => {
      //   setData(response.data.Payload)
      //   setCount(response.data.TotalRecordCount)
      // })
    },
    onColumnSortChange: (changedColumn: string, direction: string) => {
      if (['Sector', 'Symbol', 'Name', 'Price', '% Change', 'P/E'].includes(changedColumn)) {
        setSortColumn(changedColumn)
        const columnSortDirection = direction === 'descending' ? 'desc' : 'asc'
        setSortDirection(columnSortDirection)

        // tslint:disable-next-line:no-console
        // console.log('onColumnSortChange', { changedColumn, direction })

        // API.post(apiEndpoint, { searchText, page, limit: rowsPerPage, sortColumn: changedColumn, sortDirection: direction, userId }).then(response => {
        //   setData(response.data.Payload)
        //   setCount(response.data.TotalRecordCount)
        // })
      }
    },
    onTableInit: (action, tableState) => {
      axios.post(apiEndpoint, { searchText: '', page, limit: rowsPerPage }).then(response => {
        setData(response.data.Payload)
        setCount(response.data.TotalRecordCount)
      })
    },
    page,
    Responsive: 'scrollFullHeight',
    rowHover: true,
    rowsPerPage,
    // searchOpen: tableOptions.searchOpen,
    searchPlaceholder: 'search ticker, company name or sector...',
    // searchText,
    selectableRows: 'none',
    selectableRowsHeader: false,
    serverSide: true,
  }
{% endset %}
{{ save_delayed('ph',ph) }}
<MUIDataTable
    title={''}
    data={data}
    columns={columns}
    options={options}
/>