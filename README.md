# springboot-rest-api-archetype
An archetype which contains a sample Spring Boot REST API project

## Sample Usage
```bash
mvn archetype:generate \
-DarchetypeGroupId=com.hackerrank.archetypes \
-DarchetypeArtifactId=springboot-rest-api \
-DarchetypeVersion=1.0.0-SNAPSHOT
```

The generated project structure:

```text
springboot-rest-api-sample
├── pom.xml
└── src
    ├── main
    │   ├── java
    │   │   └── com
    │   │       └── hackerrank
    │   │           └── projects
    │   │               ├── Application.java
    │   │               └── controllers
    │   │                   └── GreetingsController.java
    │   └── resources
    │       └── application.properties
    └── test
        └── java
            └── com
                └── hackerrank
                    └── projects
                        └── requests
                            └── GreetingsControllerTest.java
```
