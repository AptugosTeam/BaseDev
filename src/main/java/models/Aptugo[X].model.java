/*
path: Aptugo[X].model.java
completePath: >-
  C:\Users\Usuario\Aptugo\BaseDev\Templates\SpringBoot\src\main\java\models\Aptugo[X].model.java
keyPath: src\main\java\models\Aptugo[X].model.java
unique_id: HsAnQIXt
*/

package {{ configuration.packageName }}.models;

import jakarta.persistence.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import java.util.Date; // O LocalDate/LocalDateTime si se prefiere
import java.util.List;
import java.util.Set;
// Importar otras clases necesarias como BigDecimal, etc.

{% set friendlyTableName = table.name | friendly | pascal %}
{% set tableName = table.name | friendly | lower %}

@Entity
@Table(name = "{{ tableName }}")
@Data // Lombok para getters, setters, toString, equals, hashCode
public class {{ friendlyTableName }} {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // O GenerationType.SEQUENCE si se prefiere
    private Long id; // Asumiendo un ID Long autoincremental

    {% for field in table.fields %}
    {% set fieldInfo = field | fieldData %}
    {% set columnType = 'String' %}
    {% set columnDefinition = '' %}
    {% set annotations = [] %}
    {% if field.data_type == 'Number' %}
        {% set columnType = 'Integer' %}
        {% if field.decimals > 0 %}
            {% set columnType = 'Double' %}
        {% endif %}
    {% elseif field.data_type == 'Date' %}
        {% set columnType = 'Date' %}
        {% set annotations = annotations|merge(['@Temporal(TemporalType.DATE)']) %}
    {% elseif field.data_type == 'Datetime' %}
        {% set columnType = 'Date' %}
        {% set annotations = annotations|merge(['@Temporal(TemporalType.TIMESTAMP)']) %}
    {% elseif field.data_type == 'Boolean' %}
        {% set columnType = 'Boolean' %}
    {% elseif field.data_type == 'MultilineString' or field.data_type == 'Wysiwyg' %}
        {% set columnType = 'String' %}
        {% set columnDefinition = 'TEXT' %}
        {% set annotations = annotations|merge(['@Lob']) %}
    {% elseif field.data_type == 'Password' %}
        {% set columnType = 'String' %}
        {# Considerar no mapear directamente o usar encriptación #}
    {% elseif field.data_type == 'File' or field.data_type == 'Image' %}
        {% set columnType = 'String' %} // Guardar ruta o ID del archivo
    {% elseif field.data_type == 'Bytes' %}
        {% set columnType = 'byte[]' %}
        {% set annotations = annotations|merge(['@Lob']) %}
    {% elseif field.data_type == 'GeoPoints' %}
        // Considerar usar PostGIS o tipos espaciales, o dos campos Double
        private Double {{ field.column_name | friendly }}Latitude;
        private Double {{ field.column_name | friendly }}Longitude;
        {% set columnType = null %} // Evitar la generación estándar
    {% elseif field.data_type == 'Relationship' %}
        {% set relData = field.reference | fieldData %}
        {% set relatedEntity = relData.table.name | friendly | pascal %}
        {% set mappedByAttribute = fieldInfo.column_name | friendly %}
        {% if field.relationshipType == '1:1' %}
            {% set annotations = annotations|merge(['@OneToOne']) %}
            {% if fieldInfo.owner %}
                 {% set annotations = annotations|merge(['@JoinColumn(name = "' ~ fieldInfo.column_name | friendly ~ '_id")']) %}
            {% else %}
                 {% set annotations = annotations|merge(['@OneToOne(mappedBy = "' ~ mappedByAttribute ~ '")']) %}
            {% endif %}
            {% set columnType = relatedEntity %}
        {% elseif field.relationshipType == 'm:1' %}
            {% set annotations = annotations|merge(['@ManyToOne(fetch = FetchType.LAZY)']) %}
            {% set annotations = annotations|merge(['@JoinColumn(name = "' ~ fieldInfo.column_name | friendly ~ '_id")']) %}
            {% set annotations = annotations|merge(['@ToString.Exclude', '@EqualsAndHashCode.Exclude']) %}
            {% set columnType = relatedEntity %}
        {% elseif field.relationshipType == '1:m' %}
            {% set mappedByField = fieldInfo.referenceMapField | fieldData %}
            {% set annotations = annotations|merge(['@OneToMany(mappedBy = "' ~ (mappedByField.column_name | friendly) ~ '", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)']) %}
            {% set annotations = annotations|merge(['@ToString.Exclude', '@EqualsAndHashCode.Exclude']) %}
            {% set columnType = 'Set<' ~ relatedEntity ~ '>' %} // O List
        {% elseif field.relationshipType == 'm:n' %}
            {% set joinTable = fieldInfo.join_table | default(tableName ~ '_' ~ relData.table.name | friendly | lower) %}
            {% set joinColumn = fieldInfo.join_column | default(tableName ~ '_id') %}
            {% set inverseJoinColumn = fieldInfo.inverse_join_column | default(relData.table.name | friendly | lower ~ '_id') %}
            {% set annotations = annotations|merge(['@ManyToMany(fetch = FetchType.LAZY)']) %}
            {% set annotations = annotations|merge(['@JoinTable(name = "' ~ joinTable ~ '", joinColumns = @JoinColumn(name = "' ~ joinColumn ~ '"), inverseJoinColumns = @JoinColumn(name = "' ~ inverseJoinColumn ~ '"))']) %}
            {% set annotations = annotations|merge(['@ToString.Exclude', '@EqualsAndHashCode.Exclude']) %}
            {% set columnType = 'Set<' ~ relatedEntity ~ '>' %} // O List
        {% endif %}
    {% endif %}

    {% if columnType %}
    {% for annotation in annotations %}
    {{ annotation }}
    {% endfor %}
    @Column(name = "{{ field.column_name | friendly }}"{% if columnDefinition != '' %}, columnDefinition = "{{ columnDefinition }}"{% endif %}{% if not field.required %}, nullable = true{% endif %}{% if field.unique %}, unique = true{% endif %})
    private {{ columnType }} {{ field.column_name | friendly }};
    {% endif %}
    {% endfor %}

    // Timestamps (si se usan)
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
