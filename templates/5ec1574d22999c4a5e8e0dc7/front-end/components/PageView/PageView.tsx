/*
path: PageView.tsx
completePath: >-
  /Users/robrondon/Aptugo/BaseDev/templates/5ec1574d22999c4a5e8e0dc7/front-end/components/PageView/PageView.tsx
keyPath: front-end/components/PageView/PageView.tsx
unique_id: Mm2MXMCD
*/
import { useEffect } from "react";
import { useLocation } from "react-router-dom";

declare global {
  interface Window {
    dataLayer: any[];
  }
}

const PageView = () => {
  const location = useLocation()

  useEffect(()=>{
    window.dataLayer.push({
      event: 'page_view'
    })
  }, [location])

  return null
}

export default PageView