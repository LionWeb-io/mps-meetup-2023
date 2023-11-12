# Playbook for LionWeb Demo at LangDev 2023

## Meta level

1. Open project `property-demo/mps` in MPS 2021.1

2. Generate Kotlin classes for PROPS language
   ```shell
   ./gradlew generateASTClasses
   ```
3. Generate Ecore model for PROPS language
   ```shell
   ./gradlew properties-emf:run
   ```
   This creates the files `property-demo/properties-emf/src-gen/model/PROPS.ecore` and `PROPS.genmodel` in the same directory.

4. Generate Java code for PROPS language
   ```shell
   ./gradlew properties-emf:generateXtext
   ```
   This creates Java code at `property-demo/properties-emf/src-gen/java/`.

## Instance level
1. Show properties [file](properties-parser/examples/example1.props)

2. Parse properties file
   ```shell
   ./gradlew properties-parser:run --args "parse examples\example1.props"
   ```

3. Load to MPS

4. Use Freon to edit

5. Generate via EMF
   ```shell
   ./gradlew xtend-generators:emf-generator:run
   ```

6. Show HTML [file](xtend-generators/emf-generator/emf-generator-index.html)

7. Download properties file
   ```shell
   ./gradlew properties-parser:run --args "download http://127.0.0.1:63320/lionweb/bulk?modelRef=r%3A5dda8fb0-8c78-4ed5-8c46-0eb8c112a60a(import_from_json.properties.instance)"
   ```

8. Show properties [file](properties-parser/PropertyRoot.props)