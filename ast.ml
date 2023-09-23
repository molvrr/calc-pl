type bop =
  | Add
  | Mul

type expr =
  | Int of int
  | Binop of bop * expr * expr
