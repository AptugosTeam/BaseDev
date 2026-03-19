/*
path: useGSAP.tpl
keyPath: elements/Experimental/useGSAP.tpl
unique_id: Gsap0002
type: file
icon: f:gsap.svg
helpText: Hook to use animations with GSAP in a `useGSAP` effect
options: []
children: []
*/

useGSAP(() => {
  {{ content | raw }}
}, [])