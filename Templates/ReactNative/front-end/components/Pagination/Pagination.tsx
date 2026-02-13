/*
path: pagination.tsx
type: file
unique_id: UgJmibXm
icon: ico-field
children: []
*/
import React, { FunctionComponent, ReactChild } from 'react'
import { Button } from 'react-native-paper'

import classes from './pagination.module.scss'

interface paginationProps {
  currentPage: number
  setPage: Function
  totalItems: number
  itemsPerPage: number
}

const Pagination: FunctionComponent<paginationProps> = (props) => {
  return (
    <div className={classes.prevnext}>
      {props.currentPage > 1 && (
        <Button
          onPress={() => {
            props.setPage(props.currentPage - 1)
          }}
        >Previous
        </Button>
      )}
      {props.totalItems > props.currentPage * props.itemsPerPage && (
        <Button
          onPress={() => {
            props.setPage(props.currentPage + 1)
          }}
        >Next
        </Button>
      )}
    </div>
  )
} 

export default Pagination