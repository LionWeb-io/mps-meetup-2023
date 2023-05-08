# LIonWeb MPS Meetup 2023 Demo

This project contains a demo of LIonWeb for the MPS Meetup 2023 event.

In the `properties-parser` directory we have a parser and code generator for a variant of the properties file format.

In the `mps` directory we have an MPS project which can import the properties language and its instances.

In the `freon` directory we have a web editor for the properties language.

## Language Schema

```mermaid
classDiagram

    class ASTNode["StarLasu::ASTNode"]

class PropertiesFile

ASTNode <|-- PropertiesFile
PropertiesFile *-- "0..*" Property: props 

class Property {
    name: String
}

ASTNode <|-- Property

Property *-- "1" Value: value

class Value

ASTNode <|-- Value

class BooleanValue {
    value: Boolean
}

Value <|-- BooleanValue

class DecValue {
    value: String
}

Value <|-- DecValue

class IntValue {
    value: String
}

Value <|-- IntValue

class StringValue {
    value: String
}

Value <|-- StringValue
```

You can learn more about LIonWeb visiting [https://lionweb.io](https://lionweb.io).
