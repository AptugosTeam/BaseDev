/*
path: TopMenu.tsx
completePath: front-end/components/TopMenu/TopMenu.tsx
unique_id: 4yBozeZw
*/
import Button from '@mui/material/Button'
import clsx from 'clsx'
import React, { FunctionComponent } from 'react'
import Link from 'next/link'
import classes from './topmenu.module.scss'

interface menuItemProps {
  children?: JSX.Element
  text: string
  link?: string
  isSubMenu?: boolean
  onClickCapture?: Function
}

interface topMenuProps {
  children?: JSX.Element
  className?: any
}

export const AptugoMenuItem: FunctionComponent<menuItemProps> = (props) => {
  const [isOpen, setOpen] = React.useState(false)
  const { text, link, isSubMenu } = props

  let buttonComponent = <Button {...props}>{text}</Button>
  let component = <div>{buttonComponent}</div>
  if (props.link) {
    if (props.link.substr(0, 4).toLowerCase() === 'http') {
      component = <a href={props.link}>{buttonComponent}</a>
    } else {
      component = <Link href={props.link}>{buttonComponent}</Link>
    }
  }

  if (props.isSubMenu) {
    return component
  } else {
    return (
      <div onMouseEnter={() => setOpen(true)} onMouseLeave={() => setOpen(false)} className={clsx("menuItem", isOpen ? classes.selectedItem : undefined)}>
        {component}
        {props.children && (
          <div className={clsx("subMenu",classes.subMenu)}>{React.Children.map(props.children, (child: any) => React.cloneElement(child, { isSubMenu: true }))}</div>
        )}
      </div>
    )
  }
}

const AptugoTopMenu: FunctionComponent<topMenuProps> = (props) => {
  const [isOpen, setOpen] = React.useState(false)

  const switchMenuView = () => {
    setOpen(!isOpen)
  }

  return (
    <div className={clsx(classes.menu, props.className)}>
      <div className={'actioner'} onClickCapture={switchMenuView}></div>
      <div className={clsx('menu', isOpen && 'isOpen')}>{props.children}</div>
    </div>
  )
}

export default AptugoTopMenu
