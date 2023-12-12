#use"Higher_orderFn.ml";;
let quad x = double (double x);;
(* val quad : int -> int = <fun> *)
#utop_stash "HigherOrder.ml";;
(* let fourth x square (square x);; *)
(* Error: Syntax error: ')' expected, the highlighted '(' might be unmatched *)
let fourth x = square (square x);;
(* val fourth : int -> int = <fun> *)
let twice f x = f (f x);;
(* val twice : ('a -> 'a) -> 'a -> 'a = <fun> *)
#utop_stash "HigherOrder.ml";;
let quad x = twice double x;;
(* val quad : int -> int = <fun> *)
let fourth x= twice square x;;
(* val fourth : int -> int = <fun> *)
