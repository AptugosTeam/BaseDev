/*
path: apr.tpl
completePath: elements/Aptugo Internal Use/apr.tpl
unique_id: LqzNhqB4
children: []
icon: ico-field
helpText: After Page Render
options:
  - name: renderPosition
    display: Render Position
    type: dropdown
    options: after;between
    settings:
      default: after
*/

{% if element.values.renderPosition == 'between' %}
</SafeAreaView>
{{ content | raw }}
</PaperProvider>)}
{% else %}
</SafeAreaView></PaperProvider>)}
{{ content | raw }}
{% endif %}
{% for delay in delayed %}
{{ delay }}
{% endfor %}

export default {{ page.name | friendly }}


