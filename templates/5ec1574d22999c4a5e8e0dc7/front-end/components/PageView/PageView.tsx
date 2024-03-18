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