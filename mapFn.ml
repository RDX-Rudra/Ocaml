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
#utop_stash "AbstractionPrinciple.ml";;
(* let rec add1 = function
| [] -> []
| h:t -> (h+1) :: add1 t;; *)
(* Error: Syntax error *)
let rec add1 = function
| [] -> []
| h :: t -> (h+1) :: add1 t;;
(* val add1 : int list -> int list = <fun> *)
(* let lst1 add1 [2;3;4;5];; *)
(* Error: Syntax error *)
let lst1 = add1 [2;3;4;5];;
(* val lst1 : int list = [3; 4; 5; 6] *)
let rec concat_bang = function
|[] -> []
|h::t -> (h ^ "!") :: concat_bang t;;
(* val concat_bang : string list -> string list = <fun> *)
let lst2 = concat_bang ["RDX"; "Dj"];;
(* val lst2 : string list = ["RDX!"; "Dj!"] *)
(* let rec add1 = function
|[]->[]
|h::t -> 
let f = fun x -> x + 1 in 
f h :: add1;; *)
(* Error: This expression has type int list -> int list
but an expression was expected of type int list *)
let rec add1 = function
|[]->[]
|h::t -> 
let f = fun x -> x + 1 in 
f h :: add1 t;;
(* val add1 : int list -> int list = <fun> *)
let m = add1 [2];;
(* val m : int list = [3] *)
let rec concat_bang = function
|[]->[]
|h::t -> 
let f = fun x -> x ^ "!" in 
f h :: concat_bang t;;
(* val concat_bang : string list -> string list = <fun> *)
let rec add1' f = function
|[] ->[]
| h::t -> f h :: add1' f t;;
(* val add1' : ('a -> 'b) -> 'a list -> 'b list = <fun> *)
let add1 = add1' (fun x -> x + 1);;
(* val add1 : int list -> int list = <fun> *)
let rec transform f = function
|[] -> []
|h::t -> f h :: transform f t;;
(* val transform : ('a -> 'b) -> 'a list -> 'b list = <fun> *)
let add1 = transform (fun x -> x + 1);;
(* val add1 : int list -> int list = <fun> *)
(* let add1 lst = transform (x -> x + 1);; *)
(* Error: Syntax error: ')' expected, the highlighted '(' might be unmatched *)
(* let add1 lst = transform (x -> x + 1) lst;; *)
(* Error: Syntax error: ')' expected, the highlighted '(' might be unmatched *)
let add1 lst = transform (fun x -> x + 1) lst;;
(* val add1 : int list -> int list = <fun> *)
let rec map f = function
|[] -> []
|h::t -> f h :: map f t;;
(* val map : ('a -> 'b) -> 'a list -> 'b list = <fun> *)
let add1 = map (fun x -> x+1);;
(* val add1 : int list -> int list = <fun> *)
(* let count_bang = map (x -> x ^ "!");; *)
(* Error: Syntax error: ')' expected, the highlighted '(' might be unmatched *)
let count_bang = map (fun x -> x ^ "!");;
(* val count_bang : string list -> string list = <fun> *)
