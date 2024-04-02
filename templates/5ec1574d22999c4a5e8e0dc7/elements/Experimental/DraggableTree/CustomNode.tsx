/*
path: CustomNode.tsx
keyPath: elements/Experimental/DraggableTree/CustomNode.tsx
unique_id: 0AxxpVFC
*/
import { AddCircle, Check, Close, Delete, Edit, FileCopy, HighlightAlt, Loop, MoreVert } from '@mui/icons-material'
import ArrowRightIcon from '@mui/icons-material/ArrowRight'
import { InputAdornment, MenuItem, Select, Tooltip } from '@mui/material'
import IconButton from '@mui/material/IconButton'
import Popover from '@mui/material/Popover'
import TextField from '@mui/material/TextField'
import React, { useState } from 'react'

const CustomNode = ({ testIdPrefix = '', ...props }) => {
  const classes = props.theme
  const { id, text, className } = props.node
  const [visibleInput, setVisibleInput] = useState(props.node.nodeType === 'Input')
  const [labelText, setLabelText] = useState(text)
  const [activeMenu, setactiveMenu] = useState(null)

  const indent = props.depth * 16

  const handleAdd = (id, e) => {
    if (!props.isOpen) props.onToggle()
    props.onAdd(id, e)
    e.stopPropagation()
  }

  const handleShowInput = (e) => {
    e.stopPropagation()
    if (props.node.onEdit) props.node.onEdit(props.node)
    else {
      setactiveMenu(null)
      setVisibleInput(true)
    }
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
      className={`${classes.nodeRoot} ${className} ${classes[props.node.nodeType]} ${props.node.errored && classes.errored}`}
      style={ { paddingInlineStart: indent }}
      data-testid={`${testIdPrefix}custom-node-${id}-${props.node.nodeType}`}
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
              InputProps={ {
                startAdornment: props.node.preText ? <InputAdornment position="start">{props.node.preText}</InputAdornment> : '',
              }}
              focused
              fullWidth
              className={`${classes.textField} ${classes.nodeInput}`}
              value={labelText}
              onChange={handleChangeText}
            />
            <IconButton className={classes.editButton} onClick={handleSubmit} disabled={labelText === ''}>
              <Check className={classes.editIcon} />
            </IconButton>
            <IconButton className={classes.editButton} onClick={handleCancel}>
              <Close className={classes.editIcon} />
            </IconButton>
          </div>
        ) : (
          <div className={`${classes.inputWrapper} inputWrapper`}>
            <div className={`${classes.label} label`}>
              {props.node.text}
              {(props.node.nodeType === 'Selector' || props.node.nodeType === 'Constant') && (
                <div>
                  {!!SelectorActive ? (
                    <Select
                      labelId="demo-simple-select-label"
                      id="demo-simple-select"
                      value={props.node.data.variableName}
                      label="Variable"
                      onChange={(e) => {
                        props.handleChangeVar(props.node.id, e.target.value)
                      }}
                    >
                      {props.node.neededVars?.map((nv) => (
                        <MenuItem value={nv}>{nv}</MenuItem>
                      ))}
                    </Select>
                  ) : (
                    <div onClick={switchSelector}>
                      {' '}
                      <span>{props.node.data.VariableName || 'Not used'}</span>
                    </div>
                  )}
                </div>
              )}
              {props.node.editable && (
                <div
                  className={classes.threeVerticalDots}
                  onClick={(e) => {
                    setactiveMenu(e.currentTarget)
                    e.stopPropagation()
                  }}
                >
                  <MoreVert />
                </div>
              )}
            </div>
            {props.node.editable !== false && activeMenu && (
              <Popover
                className={classes.actionButtons}
                open={Boolean(activeMenu)}
                anchorEl={activeMenu}
                onClose={() => setactiveMenu(null)}
                anchorOrigin={ {
                  vertical: 'center',
                  horizontal: 'center',
                }}
              >
                {!!(props.node.permissions & (1 << 5)) && (
                  <div className={classes.actionButton}>
                    <IconButton size="small" onClick={handleShowInput}>
                      <HighlightAlt fontSize="small" />
                    </IconButton>
                    Assign Match
                  </div>
                )}
                {!!(props.node.permissions & (1 << 4)) && (
                  <div className={classes.actionButton} onClick={(e) => handleAdd(id, e)}>
                    <IconButton size="small">
                      <AddCircle fontSize="small" />
                    </IconButton>
                    {props.node.nodeType === 'Selector' || props.node.nodeType === 'Main' ? 'Add Value' : 'Add Child'}
                  </div>
                )}
                {!!(props.node.permissions & (1 << 3)) && (
                  <div
                    className={classes.actionButton}
                    onClick={(e) => {
                      props.onChangeType(id, e)
                    }}
                  >
                    <IconButton size="small">
                      <Loop fontSize="small" />
                    </IconButton>
                    Switch Type
                  </div>
                )}
                {!!(props.node.permissions & (1 << 2)) && !!(props.node.permissions & (1 << 1)) && <div className={classes.separator}></div>}
                {!!(props.node.permissions & (1 << 2)) && (
                  <div className={classes.actionButton} onClick={handleShowInput}>
                    <IconButton size="small">
                      <Edit fontSize="small" />
                    </IconButton>
                    Edit
                  </div>
                )}
                {!!(props.node.permissions & (1 << 1)) && (
                  <div className={classes.actionButton} onClick={() => props.onCopy(id)}>
                    <IconButton size="small">
                      <FileCopy fontSize="small" />
                    </IconButton>
                    Copy
                  </div>
                )}
                {!!(props.node.permissions & 1) && <div className={classes.separator}></div>}
                {!!(props.node.permissions & 1) && (
                  <div
                    className={classes.actionButtonDanger}
                    onClick={(e) => {
                      e.stopPropagation()
                      props.onDelete(props.node)
                    }}
                  >
                    <IconButton size="small">
                      <Delete fontSize="small" />
                    </IconButton>
                    Delete
                  </div>
                )}
              </Popover>
            )}
          </div>
        )}
      </div>
    </div>
  )

  if (props.node.tooltip) {
    return (
      <Tooltip
        enterDelay={500}
        arrow
        classes={ { popper: classes.tooltip }}
        placement="top-start"
        slotProps={ {
          popper: {
            modifiers: [
              {
                name: 'offset',
                options: {
                  offset: [0, -15],
                },
              },
            ],
          },
        }}
        title={props.node.tooltip}
      >
        {toReturn}
      </Tooltip>
    )
  } else {
    return toReturn
  }
}

export default CustomNode
