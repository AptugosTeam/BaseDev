/*
path: NotificationBanner.tpl
keyPath: elements/15_Programming/Snippets/NotificationBanner.tpl
unique_id: N6KVqIF8
options:
  - name: value
    display: Notification Value
    type: text
extraFiles:
  - source: 'elements/99_ExtraFiles/NotificationBannerIndex.tsx'
    destination: 'src/components/NotificationBanner/index.tsx'
  - source: 'elements/99_ExtraFiles/NotificationBannerService.tsx'
    destination: 'src/components/NotificationBanner/notificationService.tsx'
settings:
  - name: Packages
    value: '"expo-haptics": "~15.0.7",'
*/
{% set appImports %}import NotificationBanner from '@components/NotificationBanner'{% endset %}{{ add_setting('AppImports', appImports) }}
{% set SWBS %}<NotificationBanner />{% endset %}{{ add_setting('SiteWideWrapEnd', SWBS) }}
{% set bpr %}import { showNotification } from '@components/NotificationBanner/notificationService'{% endset %}{{ save_delayed('bpr',bpr)}}
showNotification({{ element.values.value }})