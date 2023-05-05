# Properties Parser

This is a Parser based on Kolasu and compatible with LIonWeb.

This project can produce a fat jar (i.e., an executable jar containing all dependencies) which can be 
executed from the command line to:

1. Produce the Properties metamodel in LIonWeb format
2. Produce the StarLasu metamodel, on which the Properties metamodel depend 
2. Parsing a properties file and produce an AST, in LIonWeb format

## Invoking the Command Line Interface

The CLI can be built by running:
```
./gradlew shadowJar
```

### metamodel command

To generate the properties metamodel you can run:
```
java -jar properties-parser/build/libs/properties-parser-all.jar metamodel
```
You can optionally specify where to save the metamodel.

You can also specify to include the StarLasu metamodel (on which this metamodel depends), 
so that both metamodels are stored in the same file. To do that you can use the `-c`/`--combined` flag.

### starlasu command

To generate the StarLasu metamodel you can run:
```
java -jar properties-parser/build/libs/properties-parser-all.jar starlasu
```
You can optionally specify where to save the metamodel.

### parse command

To parse a file and save the AST you can run:
```
java -jar properties-parser/build/libs/properties-parser-all.jar parse properties-parser/examples/example1.props
```
You can optionally specify where to save the model.

### codegen command

To load an AST file and generate the corresponding props file you can run:
```
java -jar properties-parser/build/libs/properties-parser-all.jar codegen properties-parser/examples/example1.props
```
You can optionally specify where to save the props file.

### transform command

You can use this command to perform simple transformations on an existing AST.
The AST will be loaded, transformed, and saved again.

```
java -jar properties-parser/build/libs/properties-parser-all.jar transform properties-parser/examples/example1.props <TRANSFORMATION OPTIONS>
```
The transformation options can be any number of these:

* `-c`/`--capitalize`: capitalize all key names and string values
* `-d`/`--double`: double all integer and decimal values
* `-r`/`--reverse`: reverse the order of properties in PropertiesFile instances
* `-s`/`--to-string`: convert all integer, decimal, and boolean values into string values
* `-n`/`--negate`: negate all boolean values

You can optionally specify where to save the transformed AST file.

## Properties language

The language is defined as a variant of property files. It permits to define simple values using
strings, integers, decimals, and boolean values.

Example:
```
a = 1
b = true
c = "foo"
```