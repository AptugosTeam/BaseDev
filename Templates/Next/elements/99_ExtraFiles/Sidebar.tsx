/*
path: Sidebar.tsx
completePath: front-end/components/Sidebar/Sidebar.tsx
unique_id: eagUHEvx
*/
import Drawer from '@mui/material/Drawer'
import clsx from 'clsx'
import React, { FunctionComponent } from 'react'

import classes from './sidebar.module.scss'

interface sidebarProps extends React.PropsWithChildren {
  handleDrawerToggle?: VoidFunction
  open: boolean
  color?: string
  className?: string
}

const Sidebar: FunctionComponent<sidebarProps> = (props) => {
  const localClasses = {
    [classes.drawerOpen]: props.open,
    [classes.drawerClose]: !props.open,
    [classes[`color${props.color}`]]: true,
  }

  return (
    <Drawer
      variant="permanent"
      className={clsx(props.className, classes.drawer, localClasses)}
      classes={ {
        paper: clsx(localClasses),
      } }
    >
      {props.children}
    </Drawer>
  )
}

export default Sidebar
