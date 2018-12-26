# springboot-rest-api-archetype
An archetype which contains a sample Spring Boot REST API project

## Sample Usage

- If the project `groupId`, `artifactId`, and `version` is not specified the default values `com.hackerrank.projects`, `springboot-rest-api-sample`, and `1.0.0-SNAPSHOT` respectively are used:

    ```bash
    mvn archetype:generate \
    -DarchetypeGroupId=com.hackerrank.archetypes \
    -DarchetypeArtifactId=springboot-rest-api \
    -DarchetypeVersion=1.0.0
    ```

    The generated project strucure is:

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

    The POM configuration is:

    ```xml
    <groupId>com.hackerrank.projects</groupId>
    <artifactId>springboot-rest-api-sample</artifactId>
    <version>1.0</version>
    <packaging>jar</packaging>
    ```

- The project `groupId`, `artifactId`, and `version` could also be specified:

    ```bash
    mvn archetype:generate \
    -DarchetypeGroupId=com.hackerrank.archetypes \
    -DarchetypeArtifactId=springboot-rest-api \
    -DarchetypeVersion=1.0.0 \
    -DgroupId=my.group.id \
    -DartifactId=my-artifact-id \
    -Dversion=1.0
    ```

    ```text
    my-artifact-id
    ├── pom.xml
    └── src
        ├── main
        │   ├── java
        │   │   └── my
        │   │       └── group
        │   │           └── id
        │   │               ├── Application.java
        │   │               └── controllers
        │   │                   └── GreetingsController.java
        │   └── resources
        │       └── application.properties
        └── test
            └── java
                └── my
                    └── group
                        └── id
                            └── requests
                                └── GreetingsControllerTest.java
    ```

    The POM configuration is:

    ```xml
    <groupId>my.group.id</groupId>
    <artifactId>my-artifact-id</artifactId>
    <version>1.0</version>
    <packaging>jar</packaging>
    ```

## Archetype Testing
The archetype testing is done using the `maven archetype plugin`. The tests are present in `src/test/resources/projects` directory. The first test validates the project generation and runs code style checks and the second test validates build success by running tests on the generated project.

```text
src/test/resources/projects
├── checkstyle
│   ├── archetype.properties
│   ├── goal.txt
│   └── verify.bsh
├── package
│   ├── archetype.properties
│   ├── goal.txt
│   └── verify.bsh
└── settings.xml
```
