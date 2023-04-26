lexer grammar PropertiesLexer;

//
// Whitespace and comments
//

WS      : [\t ]           -> channel(HIDDEN);
COMMENT : '//' (~[\r\n])* -> channel(HIDDEN);
NEWLINE : [\r\n]+;

//
// Literals
//

STRING            : '"' (~["])* '"';
INT_NUMBER        : [0-9]+([\r\n]+[0-9]+)? | '0';
DEC_NUMBER        : [0-9]*([\r\n]+[0-9]*)?('.'|',')[0-9]+([\r\n ]+[0-9]+)?;
TRUE              : 'true';
FALSE             : 'false';

//
// Symbols
//

EQUAL               : '=';

//
// ID
//

ID : [a-zA-Z][a-zA-Z0-9_]*;