parser grammar PropertiesParser;

options { tokenVocab = PropertiesLexer; }

propertiesFile
    : property* EOF
    ;

property
    : ID EQUAL value (NEWLINE|EOF)
    ;

value
    : STRING
    | INT_NUMBER
    | DEC_NUMBER
    | TRUE
    | FALSE
    ;
