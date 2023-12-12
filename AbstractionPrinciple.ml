#use"Higher_orderFn.ml";;
let quad x = double (double x);;
(* val quad : int -> int = <fun> *)
(* let fourth x square (square x);; *)
(* Error: Syntax error: ')' expected, the highlighted '(' might be unmatched *)
let fourth x = square (square x);;
(* val fourth : int -> int = <fun> *)
let twice f x = f (f x);;
(* val twice : ('a -> 'a) -> 'a -> 'a = <fun> *)
let quad x = twice double x;;
(* val quad : int -> int = <fun> *)
let fourth x= twice square x;;
(* val fourth : int -> int = <fun> *)
#utop_stash "HigherOrder.ml";;
let apply f x = f x;;
(* val apply : ('a -> 'b) -> 'a -> 'b = <fun> *)
let pipeline x f = f x;;
(* val pipeline : 'a -> ('a -> 'b) -> 'b = <fun> *)
let (|>) = pipeline;;
(* val ( |> ) : 'a -> ('a -> 'b) -> 'b = <fun> *)
let x=5 |> double;;
(* val x : int = 10 *)
let compose f g x = f (g x);;
(* val compose : ('a -> 'b) -> ('c -> 'a) -> 'c -> 'b = <fun> *)
let square_then_double = compose double square;;
(* val square_then_double : int -> int = <fun> *)
let x = square_then_double 1;;
(* val x : int = 2 *)
let y = square_then_double 2;;
(* val y : int = 8 *)
let both f g x = (f x, g x);;
(* val both : ('a -> 'b) -> ('a -> 'c) -> 'a -> 'b * 'c = <fun> *)
let ds = both double square;;
(* val ds : int -> int * int = <fun> *)
let p = ds 3;;
(* val p : int * int = (6, 9) *)
let cond p f g x = if p x then f x else g x;;
(* val cond : ('a -> bool) -> ('a -> 'b) -> ('a -> 'b) -> 'a -> 'b = <fun> *)
