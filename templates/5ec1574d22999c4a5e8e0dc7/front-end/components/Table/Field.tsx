/*
path: Field.tsx
type: file
unique_id: PA55kCUp
icon: ico-field
sourceType: typescript
children: []
*/
import React, { FunctionComponent } from 'react'
import styles from './table.module.scss'

interface fieldProps {
  value: string | Function,
  className?: any
}

const AptugoField: FunctionComponent<fieldProps> = (props) => {
  let className = styles.tableField
  if (props.className) className = [styles.tableField, props.className].join(' ')
  
  if (typeof props.value === 'string') {
    return <div className={className} dangerouslySetInnerHTML={ { __html: props.value as string } } />
  } else {
    return <div className={className}>{props.value}</div>
  }
}

export default AptugoField
