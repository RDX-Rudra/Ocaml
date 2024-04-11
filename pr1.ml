let square x = x * x
let ($) f x = f x;;
(* val square : int -> int = <fun>
val ( $ ) : ('a -> 'b) -> 'a -> 'b = <fun> *)
square $ 2 + 2;;
(* - : int = 16 *)
square 2+2;;
(* - : int = 6 *)
let (@@) f g x = x |> g |> f;;
(* val ( @@ ) : ('a -> 'b) -> ('c -> 'a) -> 'c -> 'b = <fun> *)
(* String.length @@ String_of_int 1;; *)
(* Error: This expression should not be a constructor, the expected type is
       'a -> string *)
(* String.length @@ String_of_int 1,10,100;; *)
(* Error: This expression should not be a constructor, the expected type is
       'a -> string *)
let rec repeat f n x =
if n= 0 then x else repeat f (n-1) (f x);;
(* val repeat : ('a -> 'a) -> int -> 'a -> 'a = <fun> *)
repeat square 4 2;;
(* - : int = 65536 *)
(* let product_left f lst=
match lst with
| [] -> 1.0
|_-> List.fold_left(fun x -> f x) lst;; *)
(* Error: This expression has type 'a list -> 'b list
       but an expression was expected of type float *)
