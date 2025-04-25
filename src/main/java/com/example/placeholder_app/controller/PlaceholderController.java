/*
path: PlaceholderController.java
completePath: >-
  C:\Users\Usuario\Aptugo\BaseDev\Templates\SpringBoot\src\main\java\com\example\placeholder_app\controller\PlaceholderController.java
keyPath: >-
  src\main\java\com\example\placeholder_app\controller\PlaceholderController.java
unique_id: WHdefTLE
*/
package com.example.placeholder_app.controller;

import com.example.placeholder_app.model.PlaceholderEntity;
import com.example.placeholder_app.repository.PlaceholderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/placeholders") // Base path can be dynamic later
public class PlaceholderController {

    @Autowired
    private PlaceholderRepository placeholderRepository;

    @GetMapping
    public List<PlaceholderEntity> getAllPlaceholders() {
        return placeholderRepository.findAll();
    }

    @PostMapping
    public PlaceholderEntity createPlaceholder(@RequestBody PlaceholderEntity placeholder) {
        return placeholderRepository.save(placeholder);
    }

    @GetMapping("/{id}")
    public ResponseEntity<PlaceholderEntity> getPlaceholderById(@PathVariable Long id) {
        return placeholderRepository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    // Add PUT, DELETE endpoints later based on template logic
}