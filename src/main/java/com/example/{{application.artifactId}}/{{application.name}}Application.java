/*
path: '{{application.name}}Application.java'
completePath: >-
  C:\Users\Usuario\Aptugo\BaseDev\Templates\SpringBoot\src\main\java\com\example\{{application.artifactId}}\{{application.name}}Application.java
keyPath: >-
  src\main\java\com\example\{{application.artifactId}}\{{application.name}}Application.java
unique_id: sgJbulSb
*/
package com.example.{{application.artifactId}};

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class {{application.name}}Application {

	public static void main(String[] args) {
		SpringApplication.run({{application.name}}Application.class, args);
	}

}