/*
path: iconPicker.tsx
completePath: >-
  C:\Users\maxi_\Aptugo\BaseDev\templates\5ec1574d22999c4a5e8e0dc7\front-end\components\IconPicker\iconPicker.tsx
keyPath: front-end\components\IconPicker\iconPicker.tsx
unique_id: kOb5tKW7
*/

import React, { useState } from 'react'
import { useFontAwesomeIconPack } from './useFontAwesomeIconPack'
import { IconButton, Popover, TextField, InputAdornment, Divider, Skeleton } from '@mui/material'
import { IconName } from '@fortawesome/fontawesome-svg-core'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import classes from './iconPicker.module.scss'
import { Edit, Search } from '@mui/icons-material'

export type FontAwesomeIconPickerProps = {
  value?: string
  onChange?: (value: string) => void
}

const FontAwesomeIconPicker = ({ value, onChange }: FontAwesomeIconPickerProps) => {
  const [searchText, setSearchText] = useState('')
  const [anchorEl, setAnchorEl] = useState<HTMLButtonElement | null>(null)
  const iconPack = useFontAwesomeIconPack()

  if (!iconPack) {
    return <Skeleton variant="rectangular" width={210} height={40} />
  }

  const iconsFiltered = iconPack.filter((icon) => {
    return icon.iconName.includes(searchText.toLowerCase())
  })

  return (
    <>
      <TextField
        fullWidth
        placeholder="Select an icon"
        value={value}
        InputProps={ {
          readOnly: true,
          endAdornment: (
            <InputAdornment position="end">
              <IconButton size="small" onClick={(e) => setAnchorEl(e.currentTarget)}>
                {value ? <FontAwesomeIcon icon={['fas', value as IconName]} color="#556ee6" /> : <Edit fontSize="small" />}
              </IconButton>
            </InputAdornment>
          ),
        }}
        variant="outlined"
        size="small"
      />
      <Popover
        className={classes.iconPicker}
        id={anchorEl ? 'iconPickerPopover' : undefined}
        open={!!anchorEl}
        anchorEl={anchorEl}
        onClose={() => setAnchorEl(null)}
        anchorOrigin={ {
          vertical: 'bottom',
          horizontal: 'center',
        }}
        transformOrigin={ {
          vertical: 'top',
          horizontal: 'center',
        }}
        PaperProps={ {
          className: classes.iconPicker__paper
        }}
      >
        <div className={classes.iconPicker__popoverContainer}>
          <div className={classes.iconPicker__popoverHeader}>
            <TextField
              fullWidth
              placeholder="Search"
              InputProps={ {
                startAdornment: (
                  <InputAdornment position="start">
                    <Search />
                  </InputAdornment>
                ),
              }}
              size="small"
              variant="outlined"
              value={searchText}
              onChange={(e) => setSearchText(e.target.value)}
            />
          </div>
          <Divider />
          <div className={classes.iconPicker__iconsContainer}>
            {iconsFiltered.map((icon) => (
              <div className={classes.iconPicker__iconWrapper} key={icon.iconName}>
                <button
                  className={`${classes.iconPicker__iconItem} ${icon.iconName === value ? classes.selected : ''}`}
                  title={icon.iconName}
                  onClick={() => onChange?.(icon.iconName)}
                >
                  <FontAwesomeIcon icon={icon} />
                </button>
              </div>
            ))}
          </div>
        </div>
      </Popover>
    </>
  )
}

export default FontAwesomeIconPicker
