/*
path: "{{ table.name |\_friendly |\_lower }}.model.java"
type: file
unique_id: fnd3TqFu
icon: ico-field
modelRelated: true
sourceType: javascript
subtype: Aptugo
children: []
*/

package {{ insert_setting('application.groupId') | default(application.settings.name | lower) }}.models;

import jakarta.persistence.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import java.util.Date;
import java.util.List;
import java.util.Set;

{% set tableSingleName = table.singleName | friendly %}
{% set tableName = table.name | friendly %}

@Entity
@Table(name = "{{ tableName }}")
@Data
public class {{ tableSingleName }} {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    {% for field in table.fields %}
        {% set data %}
            {% include includeTemplate(['Fields' ~ field.data_type ~ 'model.tpl', 'Fieldsmodel.tpl']) %}
        {% endset %}
        {% set output = data | json_decode %}
        {% if output and output.rawString is defined %}
            {% set fieldCode = output.rawString %}
            {% set indentation = '    ' %} {# 4 espacios #}
    {# Nivel 1 (4 espacios) <<< ¡¡ASEGÚRATE QUE ESTA LÍNEA EMPIECE EXACTAMENTE CON 4 ESPACIOS!! #}
    {{- fieldCode | replace({'\n': '\n' ~ indentation}) | raw -}}
        {% else %}
            {# Nivel 2 (8 espacios) - La lógica de Twig puede estar indentada #}
            {% set indentation = '    ' %}
    {# Nivel 1 (4 espacios) <<< ¡¡ASEGÚRATE QUE ESTA LÍNEA EMPIECE EXACTAMENTE CON 4 ESPACIOS!! #}
    {{- indentation }}
    {{ "" }} {# Salto de línea #}
    {{ "" }} {# Línea en blanco #}
        {% endif %}
    {# Nivel 1 (4 espacios) #}
    {% endfor %}

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created_at", nullable = false, updatable = false)
    @org.hibernate.annotations.CreationTimestamp
    private Date createdAt;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "updated_at", nullable = false)
    @org.hibernate.annotations.UpdateTimestamp
    private Date updatedAt;

    // Constructor, getters, setters, etc. (Lombok @Data se encarga)

    // Lógica adicional o métodos helper si son necesarios
}