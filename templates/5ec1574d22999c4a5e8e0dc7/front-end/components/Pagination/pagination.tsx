/*
path: pagination.tsx
type: file
unique_id: UgJmibXm
icon: ico-field
children: []
*/
import ChevronLeftRoundedIcon from '@mui/icons-material/ChevronLeftRounded';
import ChevronRightRoundedIcon from '@mui/icons-material/ChevronRightRounded';
import Button from '@mui/material/Button'
import React, { FunctionComponent } from 'react'
import classes from './pagination.module.scss'

interface paginationProps {
  currentPage: number
  setPage: Function
  totalItems: number
  itemsPerPage: number
}

const Pagination: FunctionComponent<paginationProps> = (props) => {
  const totalPages = Math.ceil(props.totalItems / props.itemsPerPage)
  const pageNumbers = Array.from({ length: totalPages }, (_, i) => i + 1)
  const maxPageNumbersToShow = 5;
  return (
    <div className={classes.prevnext}>
      {props.currentPage > 1 && (
        <Button
          onClickCapture={() => {
            props.setPage(props.currentPage - 1)
          }}
        >
          <ChevronLeftRoundedIcon />
        </Button>
      )}
      <div className={classes.pagination}>
        {pageNumbers.map((pageNumber, index) => {
          if (pageNumber === 1 || pageNumber === totalPages || (pageNumber >= props.currentPage - 2 && pageNumber <= props.currentPage + 2)) {
            return (
              <Button
                key={index}
                onClickCapture={() => {
                  props.setPage(pageNumber)
                }}
                className={pageNumber === props.currentPage ? classes.activePage : ''}
              >
                {pageNumber}
              </Button>
            );
          } else if (pageNumber === props.currentPage - 3 || pageNumber === props.currentPage + 3) {
            return <div key={index}>...</div>;
          } else {
            return null;
          }
        })}
      </div>

      {props.totalItems > props.currentPage * props.itemsPerPage && (
        <Button
          onClickCapture={() => {
            props.setPage(props.currentPage + 1)
          }}
        >
          <ChevronRightRoundedIcon />
        </Button>
      )}
    </div>
  )
}

export default Pagination
