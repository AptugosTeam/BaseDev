/*
path: index.js
completePath: elements/Experimental/DataTable/index.js
unique_id: rT2Plw9G
*/
import React, { useState, useEffect } from 'react'
import DataTable from 'react-data-table-component'

function DataTables(props) {
	const [data, setData] = useState([])
	const [loading, setLoading] = useState(false)
	const [totalRows, setTotalRows] = useState(0)
	const [perPage, setPerPage] = useState(10)

	const fetchData = async () => {
		setLoading(true)
		setData(props.tableData)
		setTotalRows(props.totalDocs)
		setLoading(false)
	}

	useEffect(() => {
		fetchData()
	}, [props])

	return (
		<DataTable
			title="Users"
			columns={props.columns}
			data={data}
			progressPending={loading}
			pagination={!!props.handlePageChange}
			paginationServer
			paginationTotalRows={totalRows}
			onChangeRowsPerPage={props.handleRowsPerPageChange || null}
			onChangePage={props.handlePageChange || null}
      onSort={props.handleSortChange || null}
		/>
	)
}

export default DataTables