/*
path: splineViewer.tpl
unique_id: ZdcUOO5n
children: []
icon: ico-image
helpText: Embeds a Spline 3D scene using the Spline Viewer component.
options:
  - name: loadingAnimType
    display: Loading Animation Type
    type: text
  - name: url
    display: Spline Scene URL
    type: text
  - name: className
    display: Class Name
    type: styles
*/
{% set ph %}
const SplineViewer = 'spline-viewer' as any;
React.useEffect(() => {
  const script = document.createElement('script');
  script.src = "https://unpkg.com/@splinetool/viewer@1.9.75/build/spline-viewer.js";
  script.type = "module";
  script.async = true;
  document.body.appendChild(script);
  return () => {
    document.body.removeChild(script);
  };
}, []);
{% endset %}
{{ save_delayed('ph',ph) }}
<SplineViewer
  {% if element.values.className %}className={ {{element.values.className}} }{% endif %}
  {% if element.values.loadingAnimType %}
    loading-anim-type={{ element.values.loadingAnimType|textOrVariable }}
  {% endif %}
  {% if element.values.url %}
    url={{ element.values.url|textOrVariable }}
  {% endif %}
>
</SplineViewer>