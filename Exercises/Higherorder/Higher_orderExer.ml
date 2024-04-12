let double x = 2*x
let square x = x*x
let twice f x = f (f x)
let quad = twice double
let fourth = twice square;;
(* val double : int -> int = <fun>
val square : int -> int = <fun>
val twice : ('a -> 'a) -> 'a -> 'a = <fun>
val quad : int -> int = <fun>
val fourth : int -> int = <fun> *)
let ( $ ) f x = f x;;
(* val ( $ ) : ('a -> 'b) -> 'a -> 'b = <fun> *)
let ( @@ ) f g x = x |> g |> f;;
(* val ( @@ ) : ('a -> 'b) -> ('c -> 'a) -> 'c -> 'b = <fun> *)
(* String.length @@ string_of_int 1;; *)
(* Error: This expression has type string but an expression was expected of type
         'a -> string *)
let a = 10;;
(* val a : int = 10 *)
(* String.length @@ string_of_int a;; *)
(* Error: This expression has type string but an expression was expected of type
         'a -> string *)
(* String.length @@ (string_of_int a);; *)
(* Error: This expression has type string but an expression was expected of type
         'a -> string *)
(* let len_int x = String.length @@ string_of_int x;; *)
(* Error: This expression has type string but an expression was expected of type
         'a -> string *)
(* String.length @@ (string_of_int a);; *)
(* Error: This expression has type string but an expression was expected of type
         'a -> string *)
String.length @@ string_of_int;;
(* - : int -> int = <fun> *)
(* (string_of_int @@ String.length) 1
;; *)
(* Error: This expression has type int but an expression was expected of type
         string *)
(* String.length @@ string_of_int 1
;; *)
(* Error: This expression has type string but an expression was expected of type
         'a -> string *)
(* let rec repeat f n x = match n with
|1-> f x
|_-> f repeat f n-1 x;; *)
(* Error: This expression has type
         ('a -> 'b -> 'c -> 'd) -> int -> 'a -> 'b -> 'c -> 'd
       but an expression was expected of type 'a
       The type variable 'a occurs inside
       ('a -> 'b -> 'c -> 'd) -> int -> 'a -> 'b -> 'c -> 'd *)
let rec repeat f n x =
  match n with
  | 1 -> f x
  | _ -> f (repeat f (n-1) x);;
(* val repeat : ('a -> 'a) -> int -> 'a -> 'a = <fun> *)
(* repeat (+) 5 1;; *)
(* Error: This expression has type int -> int -> int
       but an expression was expected of type int -> int
       Type int -> int is not compatible with type int *)
(* repeat (+) 5 1 2;; *)
(* Error: This expression has type int -> int -> int
       but an expression was expected of type ('a -> 'b) -> 'a -> 'b
       Type int is not compatible with type 'a -> 'b *)
repeat (fun x->x+0) 5 1;;
(* - : int = 1 *)
repeat (fun x->x+1) 5 1;;
(* - : int = 6 *)
(* let prouduct lst = List.fold_left (fun x-> 1.0*x) lst;; *)
(* Error: This expression has type float but an expression was expected of type
         int *)
(* let prouduct lst = List.fold_left (fun x-> 1.0*.x) lst;; *)
(* Error: This expression has type float but an expression was expected of type
         'a -> float *)
let product lst = List.fold_left (fun acc x -> acc *. x) 1.0 lst;;
(* val product : float list -> float = <fun> *)
let product_left lst = List.fold_left (fun acc x -> acc *. x) 1.0 lst;;
(* val product_left : float list -> float = <fun> *)
let product_right lst = List.fold_right (fun x acc-> x *. acc) lst 1.0;;
(* val product_right : float list -> float = <fun> *)
let product_left lst = List.fold_left ( *. ) 1.0 lst;;
(* val product_left : float list -> float = <fun> *)
let product_right lst = List.fold_right ( *. ) lst 1.0;;
(* val product_right : float list -> float = <fun> *)
(* let sum_cube_odd n = List.map2 ( + ) (fun x-> x*x*x) (List.filter odd lst);; *)
(* Error: This expression should not be a function, the expected type is int list *)
(* let sum_cube_odd n = List.map2 ( + ) (fun x-> x*x*x) (List.filter (fun x -> x mod 2 <> 0) lst);; *)
(* Error: This expression should not be a function, the expected type is int list *)
(* let sum_cube_odd n = List.map ( + ) (List.map (fun x-> x*x*x) (List.filter (fun x -> x mod 2 <> 0) lst));; *)
(* Error: Unbound value lst
Hint: Did you mean fst, lsl or lsr? *)
let make_lst n = let rec helper n acc = match n with
|0->acc
|_->helper (n-1) (n::acc)
in helper n [];;
(* val make_lst : int -> int list = <fun> *)
let sum_cube_odd n = List.map ( + ) (List.map (fun x-> x*x*x) (List.filter (fun x -> x mod 2 <> 0) (make_lst n)));;
(* val sum_cube_odd : int -> (int -> int) list = <fun> *)
let sum_cube_odd n = List.fold_left ( + ) 0 (List.map (fun x-> x*x*x) (List.filter (fun x -> x mod 2 <> 0) (make_lst n)));;
(* val sum_cube_odd : int -> int = <fun> *)
sum_cube_odd 5;;
(* - : int = 153 *)
make_lst 5;;
(* - : int list = [1; 2; 3; 4; 5] *)
List.init;;
(* - : int -> (int -> 'a) -> 'a list = <fun> *)
(* List.init n (fun x -> x);; *)
(* Error: Unbound value n *)
let make_lst n = List.init n (fun x -> x);;
(* val make_lst : int -> int list = <fun> *)
let sum_cube_odd_pipeline n = n |> make_lst |> List.filter (fun x -> x mod 2 <> 0) |> List.map (fun x-> x*x*x) |> List.fold_left ( + ) 0;;
(* val sum_cube_odd_pipeline : int -> int = <fun> *)
sum_cube_odd_pipeline 5;;
(* - : int = 28 *)
make_lst 5;;
(* - : int list = [0; 1; 2; 3; 4] *)
let sum_cube_odd_pipeline n = n+1 |> make_lst |> List.filter (fun x -> x mod 2 <> 0) |> List.map (fun x-> x*x*x) |> List.fold_left ( + ) 0;;
(* val sum_cube_odd_pipeline : int -> int = <fun> *)
sum_cube_odd_pipeline 5;;
(* - : int = 153 *)
let rec exist_rec n = function
|[]->false
|h::t-> h==n || exist_rec n t;;
(* val exist_rec : 'a -> 'a list -> bool = <fun> *)
exist_rec 5 [1;2;3;4;5;6];;
(* - : bool = true *)
(* exist_rec 5 [1;2;3;4;;6];; *)
(* Error: Syntax error: ']' expected, the highlighted '[' might be unmatched *)
exist_rec 5 [1;2;3;4;6];;
(* - : bool = false *)
(* let exists_fold n lst = List.fold_left (fun x -> x==n) lst;; *)
(* Error: This expression has type bool but an expression was expected of type
         'a -> 'b *)
let exists_fold n lst = List.fold_left (fun n x-> x==n) n lst;;
(* val exists_fold : bool -> bool list -> bool = <fun> *)
(* exists_fold 5 [1;2;3;4;6];; *)
(* Error: This expression has type int but an expression was expected of type bool *)
let exists_fold n lst = List.fold_left (fun n x-> if x=n then true else false) n lst;;
(* val exists_fold : bool -> bool list -> bool = <fun> *)
(* let exists_fold n lst = List.fold_left (fun x-> if x=n then true else false) n lst;; *)
(* Error: This expression should not be a boolean literal, the expected type is
       'a -> 'b *)
let exists_fold n lst = List.fold_left (fun acc x->acc || x==n) false lst;;
(* val exists_fold : 'a -> 'a list -> bool = <fun> *)
exists_fold 5 [1;2;3;4;6];;
(* - : bool = false *)
exists_fold 5 [1;2;3;4;6;5];;
(* - : bool = true *)
let exists_lib n lst = List.filter (fun x-> if x=n then true else false) lst;;
(* val exists_lib : 'a -> 'a list -> 'a list = <fun> *)
let exists_lib n lst = List.filter (fun x-> x==n) lst;;
(* val exists_lib : 'a -> 'a list -> 'a list = <fun> *)
let exists_lib n lst = List.exists n lst;;
(* val exists_lib : ('a -> bool) -> 'a list -> bool = <fun> *)
(* exists_lib 5 [1;2;3;4;6;5];; *)
(* Error: This expression has type int but an expression was expected of type
         'a -> bool *)
let exists_lib = List.exists;;
(* val exists_lib : ('a -> bool) -> 'a list -> bool = <fun> *)
let exists_lib n lst = List.exists (fun x-> x==n) lst;;
(* val exists_lib : 'a -> 'a list -> bool = <fun> *)
exists_lib 5 [1;2;3;4;6;5];;
(* - : bool = true *)
let remain_bal_left n lst = List.fold_left (fun acc x -> acc-x) n lst;;
(* val remain_bal_left : int -> int list -> int = <fun> *)
remain_bal_left 10 [1;2;3];;
(* - : int = 4 *)
let remain_bal_right n lst = List.fold_right (fun x acc -> acc-x) lst n;;
(* val remain_bal_right : int -> int list -> int = <fun> *)
remain_bal_right 10 [1;2;3];;
(* - : int = 4 *)
let rec remain_bal n = function
|[] -> n
|h::t -> remain_bal (n-h) t;;
(* val remain_bal : int -> int list -> int = <fun> *)
remain_bal 10 [1;2;3];;
(* - : int = 4 *)
let uncurried_nth (lst, n) = List.nth lst n;;
(* val uncurried_nth : 'a list * int -> 'a = <fun> *)
let uncurried_append (lst1, lst2) = List.append lst1 lst2;;
(* val uncurried_append : 'a list * 'a list -> 'a list = <fun> *)
let uncurried_compare (lst1, lst2) = List.compare lst1 lst2;;
(* val uncurried_compare : ('a -> 'a -> int) * 'a list -> 'a list -> int = <fun> *)
(* uncurried_compare 4 8;; *)
(* Error: This expression has type int but an expression was expected of type
         ('a -> 'a -> int) * 'a list *)
(* let uncurried_compare (lst1, lst2) = char.compare lst1 lst2;; *)
(* Error: Unbound value char *)
let uncurried_compare (lst1, lst2) = Char.compare lst1 lst2;;
(* val uncurried_compare : char * char -> int = <fun> *)
(* uncurried_compare 'A' 'a';; *)
(* Error: This function has type Char.t * Char.t -> int
       It is applied to too many arguments; maybe you forgot a `;'. *)
uncurried_compare ('A','a');;
(* - : int = -32 *)
let uncurried_max (a,b) = Stdlib.max a b;;
(* val uncurried_max : 'a * 'a -> 'a = <fun> *)
(* uncurried_compare (5, 10);; *)
(* Error: This expression has type int but an expression was expected of type char *)
uncurried_max (5, 10);;
(* - : int = 10 *)
