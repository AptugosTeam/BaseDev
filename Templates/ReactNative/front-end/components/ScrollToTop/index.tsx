/*
path: index.tsx
completePath: front-end/components/ScrollToTop/index.tsx
unique_id: cxyLtE01
*/
import { useEffect } from "react";
import { useLocation } from "react-router-dom";

export default function ScrollToTop() {
  const { pathname } = useLocation();

  useEffect(() => {
    window.scrollTo(0, 0);
  }, [pathname]);

  return null;
}
