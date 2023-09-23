%token <int> INT
%token TIMES
%token PLUS
%token LPAREN
%token RPAREN
%token EOF

%start <Ast.expr> prog

%%

prog:
  | e = expr; EOF { e }
  ;

expr:
  | i = INT { Int i }
  | e1 = expr; e2 = expr; PLUS { Binop (Add, e1, e2) }
  | e1 = expr; e2 = expr; TIMES { Binop (Mul, e1, e2) }
  | LPAREN; e = expr; RPAREN { e }
  ;
