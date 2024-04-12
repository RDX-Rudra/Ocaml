(* let rec max = function
|[]->Failure e
|h1::h2::t->if h1>h2 then max h1::t else h2::t;; *)
(* Error: Unbound value e *)
(* let rec max = function
|[]->0
|h1::h2::t->if h1>h2 then max h1::t else h2::t;; *)
(* Error: This expression has type 'a list but an expression was expected of type
         int *)
let double x = 2 * x
let square x = x * x;;
(* val double : int -> int = <fun>
val square : int -> int = <fun> *)
let quad x = double (double x)
let fourth x = square (square x);;
(* val quad : int -> int = <fun>
val fourth : int -> int = <fun> *)
let twice f x = f (f x);;
(* val twice : ('a -> 'a) -> 'a -> 'a = <fun> *)
let quad x = twice double x
let fourth x = twice square x;;
(* val quad : int -> int = <fun>
val fourth : int -> int = <fun> *)
(* let rec max = function
|[]->0
|h1::h2::t->if h1>h2 then max h1::t else max h2::t;; *)
(* Error: This expression has type 'a list but an expression was expected of type
         int *)
let rec max = function
  | [] -> raise (Failure "Empty list")
  | [x] -> x
  | h1::h2::t ->
    if h1 > h2 then max (h1::t)
    else max (h2::t)
;;
(* val max : 'a list -> 'a = <fun> *)
max [];;
(* Exception: Failure "Empty list". *)
max [1;2;3;4;5;6];;
(* - : int = 6 *)
max [1;2;3;4;5;6;2;3;1];;
(* - : int = 6 *)
let pipeline x f = f x
let (|>) = pipeline
let x = 5 |> double;;
(* val pipeline : 'a -> ('a -> 'b) -> 'b = <fun>
val ( |> ) : 'a -> ('a -> 'b) -> 'b = <fun>
val x : int = 10 *)
let compose f g x = f (g x);;
(* val compose : ('a -> 'b) -> ('c -> 'a) -> 'c -> 'b = <fun> *)
let square_then_double = compose double square
let x = square_then_double 1
let y = square_then_double 2;;
(* val square_then_double : int -> int = <fun>
val x : int = 2
val y : int = 8 *)
nan;;
(* - : float = nan *)
let both f g x = (f x, g x)
let ds = both double square
let p = ds 3;;
(* val both : ('a -> 'b) -> ('a -> 'c) -> 'a -> 'b * 'c = <fun>
val ds : int -> int * int = <fun>
val p : int * int = (6, 9) *)
(* sqrt 5;; *)
(* Error: This expression has type int but an expression was expected of type
         float
  Hint: Did you mean `5.'? *)
sqrt 5.;;
(* - : float = 2.23606797749979 *)
(* square sqrt 5.;; *)
(* Error: This function has type int -> int
       It is applied to too many arguments; maybe you forgot a `;'. *)
(* square int_of_float(sqrt 5.);; *)
(* Error: This function has type int -> int
       It is applied to too many arguments; maybe you forgot a `;'. *)
let c = 5|>float_of_int |> sqrt|> int_of_float |> square;;
(* val c : int = 4 *)
sqrt;;
(* - : float -> float = <fun> *)
(* sqrt?;; *)
(* Error: Syntax error *)
(** [concat_bang lst] concatenates "!" to each element of [lst] *)
let rec concat_bang = function
  | [] -> []
  | h :: t -> (h ^ "y!") :: concat_bang t

let lst2 = concat_bang ["sweet"; "chud"];;
(* val concat_bang : string list -> string list = <fun>
val lst2 : string list = ["sweety!"; "chudy!"] *)
(** [add1 lst] adds 1 to each element of [lst] *)
let rec add1 = function
  | [] -> []
  | h :: t ->
    let f = fun x -> x + 1 in
    f h :: add1 t

(** [concat_bang lst] concatenates "!" to each element of [lst] *)
let rec concat_bang = function
  | [] -> []
  | h :: t ->
    let f = fun x -> x ^ "!" in
    f h :: concat_bang t;;
(* val add1 : int list -> int list = <fun>
val concat_bang : string list -> string list = <fun> *)
let rec add1' f = function
  | [] -> []
  | h :: t -> f h :: add1' f t

(** [add1 lst] adds 1 to each element of [lst] *)
let add1 = add1' (fun x -> x + 1)

let rec concat_bang' f = function
  | [] -> []
  | h :: t -> f h :: concat_bang' f t

(** [concat_bang lst] concatenates "!" to each element of [lst] *)
let concat_bang = concat_bang' (fun x -> x ^ "!");;
(* val add1' : ('a -> 'b) -> 'a list -> 'b list = <fun>
val add1 : int list -> int list = <fun>
val concat_bang' : ('a -> 'b) -> 'a list -> 'b list = <fun>
val concat_bang : string list -> string list = <fun> *)
let rec transform f = function
  | [] -> []
  | h :: t -> f h :: transform f t

(** [add1 lst] adds 1 to each element of [lst] *)
let add1 = transform (fun x -> x + 1)

(** [concat_bang lst] concatenates "!" to each element of [lst] *)
let concat_bang = transform (fun x -> x ^ "!");;
(* val transform : ('a -> 'b) -> 'a list -> 'b list = <fun>
val add1 : int list -> int list = <fun>
val concat_bang : string list -> string list = <fun> *)
let add1 = transform (fun x -> x + 1);;
(* val add1 : int list -> int list = <fun> *)
let rec map f = function
  | [] -> []
  | h :: t -> f h :: map f t

(** [add1 lst] adds 1 to each element of [lst] *)
let add1 = map (fun x -> x + 1)

(** [concat_bang lst] concatenates "!" to each element of [lst] *)
let concat_bang = map (fun x -> x ^ "!");;
(* val map : ('a -> 'b) -> 'a list -> 'b list = <fun>
val add1 : int list -> int list = <fun>
val concat_bang : string list -> string list = <fun> *)
let p x = print_int x; print_newline(); x + 1

let lst = map p [1; 2];;
(* val p : int -> int = <fun>
val lst : int list = [2; 3] *)
let rec map f = function
  | [] -> []
  | h :: t -> f h :: map f t

(** [add1 lst] adds 1 to each element of [lst] *)
let add1 = map (fun x -> x + 1)

(** [concat_bang lst] concatenates "!" to each element of [lst] *)
let concat_bang = map (fun x -> x ^ "!");;
(* val map : ('a -> 'b) -> 'a list -> 'b list = <fun>
val add1 : int list -> int list = <fun>
val concat_bang : string list -> string list = <fun> *)
let rec map f = function
  | [] -> []
  | h :: t -> let h' = f h in h' :: map f t

let lst2 = map p [1; 2];;
(* val map : ('a -> 'b) -> 'a list -> 'b list = <fun>
val lst2 : int list = [2; 3] *)
let rec map_tr_aux f acc = function
  | [] -> acc
  | h :: t -> map_tr_aux f (acc @ [f h]) t

let map_tr f = map_tr_aux f []

let lst = map_tr (fun x -> x + 1) [1; 2; 3];;
(* val map_tr_aux : ('a -> 'b) -> 'b list -> 'a list -> 'b list = <fun>
val map_tr : ('a -> 'b) -> 'a list -> 'b list = <fun>
val lst : int list = [2; 3; 4] *)
let rec rev_map_aux f acc = function
  | [] -> acc
  | h :: t -> rev_map_aux f (f h :: acc) t

let rev_map f = rev_map_aux f []

let lst = rev_map (fun x -> x + 1) [1; 2; 3];;
(* val rev_map_aux : ('a -> 'b) -> 'b list -> 'a list -> 'b list = <fun>
val rev_map : ('a -> 'b) -> 'a list -> 'b list = <fun>
val lst : int list = [4; 3; 2] *)
let lst = List.rev (List.rev_map (fun x -> x + 1) [1; 2; 3]);;
(* val lst : int list = [2; 3; 4] *)
let even n = n mod 2 = 0;;
(* val even : int -> bool = <fun> *)
let rec evens = function
  | [] -> []
  | h :: t -> if even h then h :: evens t else evens t

let lst1 = evens [1; 2; 3; 4];;
(* val evens : int list -> int list = <fun>
val lst1 : int list = [2; 4] *)
let rec filter p = function
  | [] -> []
  | h :: t -> if p h then h :: filter p t else filter p t;;
(* val filter : ('a -> bool) -> 'a list -> 'a list = <fun> *)
List.iter;;
(* - : ('a -> unit) -> 'a list -> unit = <fun> *)
(* let evens = filter even
let odds = filter odd;; *)
(* Error: Unbound value odd *)
let rec filter_aux p acc = function
  | [] -> acc
  | h :: t -> if p h then filter_aux p (h :: acc) t else filter_aux p acc t

let filter p = filter_aux p []

let lst = filter even [1; 2; 3; 4];;
(* val filter_aux : ('a -> bool) -> 'a list -> 'a list -> 'a list = <fun>
val filter : ('a -> bool) -> 'a list -> 'a list = <fun>
val lst : int list = [4; 2] *)
let rec filter_aux p acc = function
  | [] -> List.rev acc (* note the built-in reversal *)
  | h :: t -> if p h then filter_aux p (h :: acc) t else filter_aux p acc t

let filter p = filter_aux p [];;
(* val filter_aux : ('a -> bool) -> 'a list -> 'a list -> 'a list = <fun>
val filter : ('a -> bool) -> 'a list -> 'a list = <fun> *)
(* let rec filter_aux p acc = function
  | [] -> acc
  | h :: t -> if p h then filter_aux p (acc :: h) t else filter_aux p acc t

let filter p = filter_aux p []

let lst = filter even [1; 2; 3; 4];; *)
(* Error: This expression has type 'a list but an expression was expected of type
         'a
       The type variable 'a occurs inside 'a list *)
let rec filter_aux p acc = function
  | [] -> acc
  | h :: t -> if p h then filter_aux p (h :: acc) t else filter_aux p acc t

let filter p = filter_aux p []

let lst = filter even [1; 2; 3; 4];;
(* val filter_aux : ('a -> bool) -> 'a list -> 'a list -> 'a list = <fun>
val filter : ('a -> bool) -> 'a list -> 'a list = <fun>
val lst : int list = [4; 2] *)
let a= [1;2;3];;
(* val a : int list = [1; 2; 3] *)
(* a::4;; *)
(* Error: This expression has type int but an expression was expected of type
         int list list *)
(* [4]::a;; *)
(* Error: This expression has type int list but an expression was expected of type
         int list list
       Type int is not compatible with type int list *)
List.fold_left;;
(* - : ('a -> 'b -> 'a) -> 'a -> 'b list -> 'a = <fun> *)
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
