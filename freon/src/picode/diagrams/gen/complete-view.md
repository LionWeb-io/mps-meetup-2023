# Class diagram for language properties
```mermaid
    %%{init: {'theme': 'forest'} }%%
    classDiagram
    direction TD
    %% other possibilites: LR RL DT TB (same as TD)
    class Property {
        
        + identifier name
    }
    class Value {
        
        
    }
    class BooleanValue {
        
        + boolean value
    }
    class DecValue {
        
        + string value
    }
    class IntValue {
        
        + string value
    }
    class StringValue {
        
        + string value
    }

    Value <|-- BooleanValue
Value <|-- DecValue
Value <|-- IntValue
Value <|-- StringValue

        Property *-- "1" Value : value

        
        
```
