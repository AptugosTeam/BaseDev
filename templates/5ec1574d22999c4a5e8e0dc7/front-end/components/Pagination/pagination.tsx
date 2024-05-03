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
  alwaysActivePrevButton: boolean
  alwaysActiveNextButton: boolean
  disabledPrevButton: boolean
  disabledNextButton: boolean
  textInsidePrevButton: string
  textInsideNextButton: string
}

const Pagination: FunctionComponent<paginationProps> = (props) => {
  const totalPages = Math.ceil(props.totalItems / props.itemsPerPage)
  const pageNumbers = Array.from({ length: totalPages }, (_, i) => i + 1)
  const alwaysActivePrevButton = props.alwaysActivePrevButton ? props.currentPage > 0 : props.currentPage > 1
  const alwaysActiveNextButton = props.alwaysActiveNextButton ? props.totalItems : props.totalItems > props.currentPage * props.itemsPerPage
  const maxPageNumbersToShow = 5;

  return (
    <div className={classes.prevnext}>
      {alwaysActivePrevButton && (
        <Button
          onClickCapture={() => {
            props.setPage(props.currentPage - 1)
          }}
            disabled={props.disabledPrevButton}
        >
          <ChevronLeftRoundedIcon />
          {props.textInsidePrevButton}
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

      {alwaysActiveNextButton && (
        <Button
          onClickCapture={() => {
            props.setPage(props.currentPage + 1)
          }}
          disabled={props.disabledNextButton}
        >
          {props.textInsideNextButton}
          <ChevronRightRoundedIcon />
        </Button>
      )}
    </div>
  )
}

export default Pagination
