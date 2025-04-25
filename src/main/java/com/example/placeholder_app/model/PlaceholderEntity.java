/*
path: PlaceholderEntity.java
completePath: >-
  C:\Users\Usuario\Aptugo\BaseDev\Templates\SpringBoot\src\main\java\com\example\placeholder_app\model\PlaceholderEntity.java
keyPath: src\main\java\com\example\placeholder_app\model\PlaceholderEntity.java
unique_id: nkqc7ltK
*/
package com.example.placeholder_app.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Entity
@Table(name = "placeholder_table")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PlaceholderEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String placeholderField;

    // Add more fields based on template logic later
}