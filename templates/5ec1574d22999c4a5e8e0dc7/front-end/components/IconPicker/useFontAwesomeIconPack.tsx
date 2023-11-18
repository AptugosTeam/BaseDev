/*
path: useFontAwesomeIconPack.tsx
completePath: >-
  C:\Users\maxi_\Aptugo\BaseDev\templates\5ec1574d22999c4a5e8e0dc7\front-end\components\IconPicker\useFontAwesomeIconPack.tsx
keyPath: front-end\components\IconPicker\useFontAwesomeIconPack.tsx
unique_id: TqtlAq6r
*/

import { useState, useEffect } from 'react'
import { IconName, IconLookup, library } from '@fortawesome/fontawesome-svg-core'


export const useFontAwesomeIconPack = () => {
  const [iconPack, setIconPack] = useState<IconLookup[]>()

  useEffect(() => {
    if (!iconPack) {
      import('@fortawesome/free-solid-svg-icons').then((module) => {
        //Delete problematic icons
        const fas = { ...module.fas }
        delete fas.faCookie
        delete fas.faFontAwesomeLogoFull
        console.log(Object.keys(fas).length)

        const icons = Object.values(fas).map((icon) => ({
          prefix: icon.prefix,
          icon: icon.icon,
          iconName: icon.iconName as IconName
        }))
        library.add(...icons)
        setIconPack(icons)
      })
    }
  }, [iconPack])

  return iconPack
}
