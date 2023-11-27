/*
path: CustomNode.tsx
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/5ec1574d22999c4a5e8e0dc7/elements/Experimental/DraggableTree/CustomNode.tsx
keyPath: elements/Experimental/DraggableTree/CustomNode.tsx
unique_id: 0AxxpVFC
*/
import React, { useState } from 'react'
import ArrowRightIcon from "@mui/icons-material/ArrowRight"
import IconButton from "@mui/material/IconButton"
import { Delete, Edit, FileCopy, Check, Close, Add } from "@mui/icons-material"
import classes from './draggabletree.module.scss'
import TextField from "@mui/material/TextField"
import { Select, MenuItem, Tooltip } from '@mui/material'

const CustomNode = ({ testIdPrefix = "", ...props }) => {
  const { id, text, className } = props.node
  const [visibleInput, setVisibleInput] = useState(props.node.nodeType === 'Input')
  const [labelText, setLabelText] = useState(text)
  const [hover, setHover] = useState(false)

  const indent = props.depth * 16

  const handleAdd = (id, e) => {
    if (!props.isOpen) props.onToggle()
    props.onAdd(id, e)
  }

  const handleShowInput = () => {
    setVisibleInput(true)
  }

  const handleCancel = () => {
    setLabelText(text)
    setVisibleInput(props.node.nodeType === 'Input')
  }

  const handleChangeText = (e) => {
    setLabelText(e.target.value)
  }

  const handleSubmit = () => {
    setVisibleInput(props.node.nodeType === 'Input')
    props.onTextChange(id, labelText)
  }

  const handleToggle = (e) => {
    e.stopPropagation()
    props.onToggle(props.node.id)
  }

  const [SelectorActive, setSelectorActive] = useState(false)
  const switchSelector = () => {
    setSelectorActive(!SelectorActive)
  }

  const toReturn = (
    <div
      className={`${classes.nodeRoot} ${className} ${props.node.nodeType} ${props.node.errored && 'errored'}`}
      style={ { paddingInlineStart: indent }}
      data-testid={`${testIdPrefix}custom-node-${id}`}
      onMouseEnter={() => setHover(true)}
      onMouseLeave={() => setHover(false)}
      onClick={(_e) => {
        if (props.node.onClick) props.node.onClick(props.node)
        else props.onClick(props.node)
      }}
    >
      <div className={classes.container}>
        {props.hasChild && (
          <div className={`${classes.arrow} ${props.isOpen ? classes.open : classes.closed}`} onClick={handleToggle}>
            <ArrowRightIcon data-testid={`arrow-right-icon-${id}`} />
          </div>
        )}
        {visibleInput ? (
          <div className={`${classes.inputWrapper} inputWrapper`}>
            <TextField
              fullWidth
              className={`${classes.textField} ${classes.nodeInput}`}
              value={labelText}
              onChange={handleChangeText}
            />
            <IconButton
              className={classes.editButton}
              onClick={handleSubmit}
              disabled={labelText === ""}
            >
              <Check className={classes.editIcon} />
            </IconButton>
            <IconButton className={classes.editButton} onClick={handleCancel}>
              <Close className={classes.editIcon} />
            </IconButton>
          </div>
        ) : (
          <div className={`${classes.inputWrapper} inputWrapper`}>
            <div className={`${classes.label} label`}>
              <div className={`${classes.nodeType ? classes.nodeType : ''} nodeType`} onClick={(e) => { props.onChangeType(id, e) }}></div>
              {props.node.text}
              {(props.node.nodeType === 'Selector' || props.node.nodeType === 'Constant') && (<div>
                {!!SelectorActive ? (
                    <Select
                      labelId="demo-simple-select-label"
                      id="demo-simple-select"
                      value={props.node.data.variableName}
                      label="Variable"
                      onChange={(e) => { props.handleChangeVar(props.node.id, e.target.value )}}
                    >
                      {props.node.neededVars?.map(nv => <MenuItem value={nv}>{nv}</MenuItem>)}
                    </Select>
                ) : (
                  <div onClick={switchSelector}>({props.node.data.VariableName || 'Not used'})</div>
                )}
              </div>)}
            </div>
            {(props.node.editable !== false && hover) && (
              <div className={classes.actionButtons}>
                <div className={classes.actionButton}>
                  <IconButton size="small" onClick={(e) => handleAdd(id, e)}>
                    <Add fontSize="small" />
                  </IconButton>
                </div>
                <div className={classes.actionButton}>
                  <IconButton size="small" onClick={handleShowInput}>
                    <Edit fontSize="small" />
                  </IconButton>
                </div>
                <div className={classes.actionButton}>
                  <IconButton size="small" onClick={() => props.onDelete(id)}>
                    <Delete fontSize="small" />
                  </IconButton>
                </div>
                <div className={classes.actionButton}>
                  <IconButton size="small" onClick={() => props.onCopy(id)}>
                    <FileCopy fontSize="small" />
                  </IconButton>
                </div>
              </div>
            )}
          </div>
        )}
      </div>
    </div>
  )

  if (props.node.tooltip) {
    return <Tooltip title={props.node.tooltip}>{toReturn}</Tooltip>
  } else {
    return toReturn
  }
}

export default CustomNode