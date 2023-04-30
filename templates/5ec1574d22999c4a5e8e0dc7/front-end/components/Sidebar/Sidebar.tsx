/*
path: Sidebar.tsx
completePath: front-end/components/Sidebar/Sidebar.tsx
unique_id: eagUHEvx
*/
import React, { FunctionComponent, ReactElement } from 'react'
import clsx from 'clsx'
import Drawer from '@mui/material/Drawer'
import Hidden from '@mui/material/Hidden'
import IconButton from '@mui/material/IconButton'
import MenuIcon from '@mui/icons-material/Menu'

import classes from './sidebar.module.scss'

interface sidebarProps {
  handleDrawerToggle?: VoidFunction
  open: boolean
  color: string
  children?: ReactElement<any>[]
}

const Sidebar: FunctionComponent<sidebarProps> = (props) => {
  const localClasses = {
    [classes.drawerOpen]: props.open,
    [classes.drawerClose]: !props.open,
    [classes[`color${props.color}`]]: true
  }

  return (
    <Drawer
      variant="permanent"
      className={clsx(classes.drawer, localClasses)}
      classes={ {
        paper: clsx(localClasses),
      } }
    >
      {props.children}
    </Drawer>
  )
}

export default Sidebar