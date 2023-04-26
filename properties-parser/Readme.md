# Properties Parser

This is a Parser based on Kolasu and compatible with LIonWeb.

This project can produce a fat jar (i.e., an executable jar containing all dependencies) which can be 
executed from the command line to:

1. Produce a metamodel in LIonWeb format
2. Parsing a properties file and produce an AST, in LIonWeb format

## Invoking the Command Line Interface

The CLI can be built by running:
```
./gradlew shadowJar
```

To generate the metamodel you can run:
```
java -jar properties-parser/build/libs/properties-parser-all.jar metamodel
```
You can optionally specify where to save the metamodel.


To parse a file and save the AST you can run:
```
java -jar properties-parser/build/libs/properties-parser-all.jar parse properties-parser/examples/example1.props
```
You can optionally specify where to save the model.

## Properties language

The language is defined as a variant of property files. It permits to define simple values using
strings, integers, decimals, and boolean values.

Example:
```
a = 1
b = true
c = "foo"
```