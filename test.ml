open OUnit2
open Ast
open Main

(** [make_i n i s] makes an OUnit test named [n] that expects [s] to evaluate to [i]. *)
let make_i n i s = n >:: fun _ -> assert_equal (string_of_int i) (interp s)

(* TODO: Change tests descriptions *)
let tests =
  [ make_i "int" 22 "22"
  ; make_i "add" 22 "11 11 +"
  ; make_i "mult" 22 "2 11 *"
  ; make_i "mult of mult" 40 "2 2 * 10 *"
  ; make_i "mult on right of add" 22 "2 10 * 2 +"
  ; make_i "mult on left of add" 14 "2 2 * 10 +"
  ; make_i "nested add" 22 "10 1 + 5 6 + +"
  ]
;;

let _ = run_test_tt_main ("suite" >::: tests)
