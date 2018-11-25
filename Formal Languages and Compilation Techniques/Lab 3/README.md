## Minilanguage in BNF

>       <program> ::= <stmtlist>
>       
>       <stmtlist> ::= <stmt>
>                   | <stmt><stmtlist>
>
>
>       <stmt> ::= <structdecl>
>	            | <decl>
>	            | <simplestmt>
>   	        | <structstmt>
>
>       <structdecl> ::= “STRUCT” <identifier> “{“ <decllist> “}”
>       
>       <decllist> ::= <decl> “;”
>                   | <decl> “;” <decllist>
>       
>       <decl> ::= <type> <identifier>
>       
>       <type> ::= <primarytype>
>         	    | <arraytype>
>       
>       <primarytype> ::= “INT”
>                      | “BOOL”
>                      | “FLOAT”
>       
>       <arraytype> ::= <primarytype> ”[“ <nr> “]”
>       
>       <cmpstmt> ::= “{“ <stmtlist> ”}”
>       
>       <simplestmt> ::= <assignment>
>       		      | <istmt>
>       		      | <ostmt>
>       
>       <assignment> ::= <identifier> “=” <expression>
>       
>       <expression> ::= <term>
>       	   	      | <expression> <operation> <expression>
>       		      | “(” <expression> <operation> <expression> “)”
>                     | “!” <expression>
>       
>       
>       <operation> ::= “+” | “-” | “*” | “/” | “%” | “^”
>       
>       <term> ::= <identifier> | <nr> | <constchar>
>       
>       <ostmt> ::= “out” <oterms>
>       
>       <oterms> ::= <oterm>
>       	      | <oterm> <oterms>
>       
>       <oterm> ::= “<<” <term>
>       
>       <istmt> ::= “in” <iterms>
>       
>       <iterms> ::= <iterm>
>       	      | <iterm> <iterms>
>       <iterm> ::= “>>” <identifier>
>       
>       <structstmt> ::= <ifstmt>
>       		      | <whilestmt>
>       		      | <forstmt>
>       
>       <ifstmt> ::= “if” <condition> <cmpstmt>
>       	      | “if” <condition> <cmpstmt> “else” <cmpstmt>
>       
>       <condition> ::= “(“ <expression> <relation> <expression> “)”
>       
>       <whilestmt> ::= “while” <condition> <compstmt>
>       
>       <forstmt> ::= “for” “(“ <assignment> “;” <condition> “;” <assignments> “)” cmpstmt
>       
>       
>       <identifier> ::= <letter>
>       		      | <letter> <identifierchars>
>       
>       <identifierchars> ::= <identifierchar>
>       			       | <identifierchar> <identifierchars>
>       
>       <identifierchar> ::= <letter>
>       		          | <digit>
>       			      | “_”
>       
>       <letter> ::= “a” | “b” | … | “z” | "A" | "B" |...| "Z"
>       
>       <digit> ::= "0" | "1" |...| "9"
>       
>       <relation> ::= "<" | "<=" | "==" | "!=" | ">=" | ">" | “&&” | “||”
>       
>       <constchar> ::= “"” <string> ”"”
>       
>       <string> ::= <char>
>               | <char> <string>
>       
>       <char> ::= <letter>
>       	    | <digit>
>       
>       
>       

### Minilanguage Grammar

>
>        G = (N, E, P, S)
>
>        N = {
>           PROGRAM,
>           STMTLIST,
>           STMT,
>           STRUCTDECL,
>           DECLLIST,
>           DECL,
>           TYPE,
>           PRIMARYTYPE,
>           ARRARYTYPE,
>           CMPSTMT,
>           SIMPLESTMT,
>           ASSIGNMENT,
>           EXPRESSION,
>           OPERATION,
>           TERM,
>           OSTMT,
>           OTERMS,
>           OTERM,
>           ISTMT,
>           ITERMS,
>           ITERM,
>           STRUCTSTMT,
>           IFSTMT,
>           CONDITION,
>           WHILESTMT,
>           FORSTMT,
>           IDENTIFIER,
>           IDENTIFIERCHARS,
>           IDENTIFIERCHAR,
>           LETTER,
>           DIGIT,
>           RELATION,
>           CONSTCHAR,
>           STRING,
>           CHAR
>        }
>
>        E = {
>           int,
>           bool,
>           float,
>           <<,
>           >>,
>           for,
>           while,
>           if,
>           else,
>           &&,
>           ||,
>           !,
>           ;,
>           ,,
>           .,
>           -,
>           +,
>           /,
>           *,
>           ^,
>           =,
>           >=,
>           <=,
>           ==,
>           (,
>           ),
>           {,
>           },
>           [,
>           ],
>           ",
>           '
>        }
>
>        S = PROGRAM
>        P = {
>           PROGRAM -> STMTLIST,
>           STMTLIST -> STMT
>           | STMT STMTLIST
>           STMT - STRUCTDECL
>           | DECL
>           | SIMPLESTMT
>           | STRUCTSTMT
>           
>           STRUCTDECL -> struct IDENTIFIER { DECLLIST }
>           
>           DECLLIST -> DECL ;
>           | DECL ; DECLLIST
>           
>           DECL -> TYPE IDENTIFIER
>           
>           TYPE -> PRIMARYTYPE
>           | ARRAYTYPE
>           
>           PRIMARYTYPE -> int
>           | bool
>           | float
>           
>           ARRAYTYPE -> PRIMARYTYPE [ NR ]
>           
>           CMPSTMT -> { STMTLIST }
>           
>           SIMPLESTMT -> ASSIGNMENT
>           | ISTMT
>           | OSTMT
>           
>           ASSIGNMENT -> IDENTIFIER = EXPRESSION
>           
>           EXPRESSION -> TERM
>           | EXPRESSION OPERATION EXPRESSION
>           | ( EXPRESSION OPERATION EXPRESSION )
>           | ! EXPRESSION
>           
>           
>           OPERATION -> + | - | * | / | % | ^
>           
>           TERM -> IDENTIFIER | NR | CONSTCHAR
>           
>           OSTMT -> out OTERMS
>           
>           OTERMS -> OTERM
>           | OTERM OTERMS
>           
>           OTERM -> << TERM
>           
>           ISTMT -> in ITERMS
>           
>           ITERMS -> ITERM
>           | ITERM ITERMS
>           ITERM -> >> IDENTIFIER
>           
>           STRUCTSTMT -> IFSTMT
>           | WHILESTMT
>           | FORSTMT
>           
>           IFSTMT -> if CONDITION CMPSTMT
>           | if CONDITION CMPSTMT else CMPSTMT
>           
>           CONDITION -> ( EXPRESSION RELATION EXPRESSION )
>           
>           WHILESTMT -> while CONDITION COMPSTMT
>           
>           FORSTMT -> FOR ( ASSIGNMENT ; CONDITION ; ASSIGNMENTS ) CMPSTMT
>           
>           
>           IDENTIFIER -> LETTER
>           | LETTER IDENTIFIERCHARS
>           
>           IDENTIFIERCHARS -> IDENTIFIERCHAR
>           | IDENTIFIERCHAR IDENTIFIERCHARS
>           
>           IDENTIFIERCHAR -> LETTER
>           | DIGIT
>           | _
>           
>           LETTER -> A | B | … | Z | A | B |...| Z
>           
>           DIGIT -> 0 | 1 |...| 9
>           
>           RELATION -> < | <= | = | == | != | => | > | && | ||
>           
>           CONSTCHAR -> " STRING "
>           
>           STRING -> CHAR
>           | CHAR STRING
>           
>           CHAR -> LETTER
>           | DIGIT
>
>        }
