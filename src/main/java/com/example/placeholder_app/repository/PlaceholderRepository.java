/*
path: PlaceholderRepository.java
completePath: >-
  C:\Users\Usuario\Aptugo\BaseDev\Templates\SpringBoot\src\main\java\com\example\placeholder_app\repository\PlaceholderRepository.java
keyPath: >-
  src\main\java\com\example\placeholder_app\repository\PlaceholderRepository.java
unique_id: OnIlDLWS
*/
package com.example.placeholder_app.repository;

import com.example.placeholder_app.model.PlaceholderEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PlaceholderRepository extends JpaRepository<PlaceholderEntity, Long> {
    // Métodos de consulta personalizados pueden ir aquí
}