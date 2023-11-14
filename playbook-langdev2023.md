# Playbook for LionWeb Demo at LangDev 2023

## Preparation
* Open MPS 2021.1 with project `property-demo`
  * delete `example1.props`
* Open Eclipse
  1. Start terminal
  1. Switch to property-demo dir
  1. Warm up Gradle
  ```shell
  ./gradlew generateASTClasses
  ```
  1. Warm up Kotlin by opening `AST.kt`
  1. Delete `AST.kt`
  1. Warm up Xtend by opening `EmfGenerated.xtend`
  1. Warm up Ecore by opening `PROPS.ecore`
  1. Delete `PROPS.ecore`, `PROPS.genmodel`
  1. Delete `io.lionweb.propertydemo.emf.io_lionweb_PROPS`
  1. Delete `example1.lm.json`
  1. Delete `emf-generator-index.html`
  1. Delete `kotlin-generator-index.html`
  1. Delete `PropertyRoot`
* Start Freon
  ```shell
  yarn install
  yarn generate
  yarn prepare-app
  yarn dev
  ```
  * Make sure `PROPSLanguage.ts` contains the right language id `io-lionweb-props`
* Open Freon in web browser http://localhost:5000/
  * Reload

## Meta level

1. Show slide properties diagram
   * Boring language

1. Show slide language engineer flow
   * Scenario: Language defined in MPS
   * Export to Kotlin, Freon, Ecore
   * Show Kotlin and Ecore

1. Show properties language in MPS
    * Standard MPS
    * _Can_ have additional attributes for keys

1. Show `PROPSLoader.java`
   * All exporters use this utility
   * Loads language (and later model) directly from MPS

1. Copy & open url http://127.0.0.1:63320/lionweb/language?moduleRef=28832bdf-0e25-363c-b286-c7457d9f9c90(io.lionweb.PROPS)
   * Show language definition
   * Show list of entities

1. Show Kotlin generation
   * Switch to Eclipse
   ```shell
   ./gradlew generateASTClasses
   ```
   * Show file `AST.kt`

1. Show Ecore generation
   ```shell
   ./gradlew properties-emf:run
   ```
   * Show `PROPS.ecore`
   * Error because of Eclipse UI, works in generator

1. Show Java code generation
   ```shell
   ./gradlew properties-emf:generateXtext
   ```
   * Show `Io_lionweb_PROPSPackage.java`

## Instance level
1. Show slide end user flow

1. Show properties [`example1.props`](properties-parser/examples/example1.props)

1. Parse properties file
   ```shell
   ./gradlew properties-parser:run --args "parse examples\example1.props"
   ```
   * Show `example1.lm.json`

1. Load to MPS
   * Open `Import example1.lm.json`
   * Execute intention
   * Show `example1.props`
   * Copy to model `instance`

1. Use Freon to edit
   * Show Freon in browser
   * Open model
   * Edit
     * Don't use `false` booleans
     * Don't create invalid models
   * Save
   * Show `example1.props` in MPS

1. Generate via EMF
   * Show `EmfGenerated.xtend`
     * Explain sections
     * Ctrl-Click on type to show Ecore generated Java
   * Show Xtend features
     * Greyspace
     * Polymorphic dispatch
   ```shell
   ./gradlew xtend-generators:emf-generator:run
   ```
   * Open `emf-generator-index.html`

1. Show equivalent generator based on Kotlin classes
   * Show `KotlinGenerated.xtend`
   * Drawback of mixing too many languages: IDEs get to their limit
   * Works when executed
   ```shell
   ./gradlew xtend-generators:kotlin-generator:run
   ```
   * Open `kotlin-generator-index.html`

1. Download properties file
   ```shell
   ./gradlew properties-parser:run --args "download http://127.0.0.1:63320/lionweb/bulk?modelRef=r%3A5dda8fb0-8c78-4ed5-8c46-0eb8c112a60a(import_from_json.properties.instance)"
   ```
   * Open `PropertyRoot`
