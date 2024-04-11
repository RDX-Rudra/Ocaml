let square x = x * x;;
(* val square : int -> int = <fun> *)
let ($) f x = f x;;
(* val ( $ ) : ('a -> 'b) -> 'a -> 'b = <fun> *)
square $ 2 + 2;;
(* - : int = 16 *)
square 2+2;;
(* - : int = 6 *)
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
let rec repeat f n x =
  if n = 0 then x else repeat f (n - 1) (f x);;
(* val repeat : ('a -> 'a) -> int -> 'a -> 'a = <fun> *)
let product_left lst = List.fold_left ( *. ) 1.0 lst;;
(* val product_left : float list -> float = <fun> *)
let product_right lst = List.fold_right ( *. ) lst 1.0;;
(* val product_right : float list -> float = <fun> *)
let rec from i j l =
  if i>j then l
  else from i (j-1) (j::l);;
(* val from : int -> int -> int list -> int list = <fun> *)
let rec fib n=
match n with
|1->1
|2->1
|n->fib(n-1) + fib(n-2);;
(* val fib : int -> int = <fun> *)
fib 5;;
(* - : int = 5 *)
fib 7;;
(* - : int = 13 *)
let rec h n pp p =
  if n = 1 then p
  else h (n-1) p (pp+p);;
(* val h : int -> int -> int -> int = <fun> *)
let fib_fast n =
  if n=0 then 0
  else h n 0 1;;
(* val fib_fast : int -> int = <fun> *)
let f x = if x then x else x
let g x y = if y then x else x
let h x y z = if x then y else z
let i x y z = if x then y else y;;
(* val f : bool -> bool = <fun>
val g : 'a -> bool -> 'a = <fun>
val h : bool -> 'a -> 'a -> 'a = <fun>
val i : bool -> 'a -> 'b -> 'a = <fun> *)
print_endline "Hello world!";;
(* - : unit = () *)
print_string "Hello world!";;
(* - : unit = () *)
let empty lst =
  match lst with
  | [] -> true
  | h :: t -> false;;
(* val empty : 'a list -> bool = <fun> *)
let empty lst =
  match lst with
  | [] -> true
  | _ -> false;;
(* val empty : 'a list -> bool = <fun> *)
empty [];;
(* - : bool = true *)
empty [1];;
(* - : bool = false *)
let rec fact n = 
match n with
|1->1
|n->n * fact(n-1);;
(* val fact : int -> int = <fun> *)
fact 5;;
(* - : int = 120 *)
type day = Sun | Mon | Tue | Wed | Thu | Fri | Sat;;
(* type day = Sun | Mon | Tue | Wed | Thu | Fri | Sat *)
let int_of_day d =
  match d with
  | Sun -> 1
  | Mon -> 2
  | Tue -> 3
  | Wed -> 4
  | Thu -> 5
  | Fri -> 6
  | Sat -> 7;;
(* val int_of_day : day -> int = <fun> *)
(* let int_of_day d =
  match d with
  | Sun -> 1
  | Mon -> 2
  | Tue -> 3
  | Wed -> 4
  | Thu -> 5
  | Fri -> 6
  | Satur -> 7;; *)
(* Error: This variant pattern is expected to have type day
       There is no constructor Satur within type day
Hint: Did you mean Sat? *)
let int_of_day d =
  match d with
  | Sun -> 1
  | Mon -> 2
  | Tue -> 3
  | Wed -> 4
  | Thu -> 5
  | Fri -> 6
  | Sat -> 7;;
(* val int_of_day : day -> int = <fun> *)
(* type ptype =
  TNormal | TFire | peff &&

type peff =
  ENormal | ENotVery | ESuper;; *)
(* Error: Syntax error *)
(* type ptype =
  TNormal | TFire | peff &

type peff =
  ENormal | ENotVery | ESuper;; *)
(* Error: Syntax error *)
(* type ptype =
  TNormal | TFire | peff 

type peff =
  ENormal | ENotVery | ESuper;; *)
(* Error: Syntax error *)
type ptype =
  TNormal | TFire | TWater

type peff =
  ENormal | ENotVery | ESuper;;
(* type ptype = TNormal | TFire | TWater
type peff = ENormal | ENotVery | ESuper *)
(* assert 1 = 2;; *)
(* Error: This expression has type int but an expression was expected of type 
       bool because it is in the condition of an assertion *)
assert (1 = 2);;
(* Exception: Assert_failure ("//toplevel//", 1, 0). *)
assert (1 == 1);;
(* - : unit = () *)
assert (1 = 1);;
(* - : unit = () *)
(* assert_equal 0 0;; *)
(* Error: Unbound value assert_equal *)
(* open OUnit2;; *)
(* Error: Unbound module OUnit2
Hint: Did you mean Unit? *)
(* incr .4;; *)
(* Error: Syntax error *)
(* incr 8;; *)
(* Error: This expression has type int but an expression was expected of type
         int ref *)
(* incr Some 8;; *)
(* Error: This function has type int ref -> unit
       It is applied to too many arguments; maybe you forgot a `;'. *)
let a = ref 8;;
(* val a : int ref = {contents = 8} *)
(* type a = {foo: int, bar: int*bool, baz: bool*int};; *)
(* Error: Syntax error *)
type a = {foo: int; bar: int*bool; baz: bool*int};;
(* type a = { foo : int; bar : int * bool; baz : bool * int; } *)
(* let b= {foo= 5; bar= (3, false); baz= (true, 4);; *)
(* Error: Syntax error: '}' expected, the highlighted '{' might be unmatched *)
let b= {foo= 5; bar= (3, false); baz= (true, 4)};;
(* val b : a = {foo = 5; bar = (3, false); baz = (true, 4)} *)
(* let fun trip y = 3*y in trip;; *)
(* Error: Syntax error *)
(* let fu trip y = 3*y in trip;; *)
(* Error: Unbound value trip *)
(* let fu y = 3*y in trip;; *)
(* Error: Unbound value trip *)
(* fun trip y = 3*y;; *)
(* Error: Syntax error *)
fun trip y -> 3*y;;
(* - : 'a -> int -> int = <fun> *)
type point = float * float
type shape =
  | Point of point
  | Circle of point * float (* center and radius *)
  | Rect of point * point (* lower-left and upper-right corners *);;
(* type point = float * float
type shape = Point of point | Circle of point * float | Rect of point * point *)
(* type point = float * float
type shape =
  | Point of point
  | Circle of point * float (* center and radius *)
  | type Rect = point * point (* lower-left and upper-right corners *);; *)
(* Error: Syntax error *)
type point = float * float
type shape =
  | Point of point
  | Circle of point * float (* center and radius *)
  | Rect of point * point (* lower-left and upper-right corners *);;
(* type point = float * float
type shape = Point of point | Circle of point * float | Rect of point * point *)
type string_or_int =
  | String of string
  | Int of int;;
(* type string_or_int = String of string | Int of int *)
(* type string_or_int_list = string_or_int list

let rec sum : string_or_int list : int = function
  | [] -> 0
  | String s :: t -> int_of_string s + sum t
  | Int i :: t -> i + sum t

let lst_sum = sum [String "1"; Int 2];; *)
(* Error: Syntax error *)
(* type string_or_int_list = string_or_int list

let rec (sum : string_or_int list) : int = function
  | [] -> 0
  | String s :: t -> int_of_string s + sum t
  | Int i :: t -> i + sum t

let lst_sum = sum [String "1"; Int 2];; *)
(* Error: This pattern matches values of type string_or_int list
       but a pattern was expected which matches values of type int *)
(* type string_or_int_list = string_or_int list

let rec sum string_or_int list : int = function
  | [] -> 0
  | String s :: t -> int_of_string s + sum t
  | Int i :: t -> i + sum t

let lst_sum = sum [String "1"; Int 2];; *)
(* Error: This expression has type 'a -> 'b but an expression was expected of type
         int *)
type string_or_int_list = string_or_int list

let rec sum : string_or_int list -> int = function
  | [] -> 0
  | String s :: t -> int_of_string s + sum t
  | Int i :: t -> i + sum t

let lst_sum = sum [String "1"; Int 2];;
(* type string_or_int_list = string_or_int list
val sum : string_or_int list -> int = <fun>
val lst_sum : int = 3 *)
int_of_float 8.9;;
(* - : int = 8 *)
type intlist = Dudu | Ghud of int * intlist;;
(* type intlist = Dudu | Ghud of int * intlist *)
(* type ptype =
  TNormal | TFire | peff and peff =
  ENormal | ENotVery | ESuper;; *)
(* Error: Syntax error *)
(* type ptype =
  TNormal | TFire | peff and type peff =
  ENormal | ENotVery | ESuper;; *)
(* Error: Syntax error *)
(* type ptype =
  TNormal | TFire | peff and type peff =
  ENormal | ENotVery | ESuper;; *)
(* Error: Syntax error *)
(* type ptype =
  TNormal | TFire | peff 
and type peff =
  ENormal | ENotVery | ESuper;; *)
(* Error: Syntax error *)
let rec even n =
  match n with
  | 0 -> true
  | x -> odd (x - 1)
and odd n =
  match n with
  | 0 -> false
  | x -> even (x - 1)
;;
(* val even : int -> bool = <fun>
val odd : int -> bool = <fun> *)
(* type ptype =
  TNormal | TFire | Peff 
and type peff =
  ENormal | ENotVery | ESuper;; *)
(* Error: Syntax error *)
type ptype =
  TNormal | TFire | Peff of peff
and  peff =
  ENormal | ENotVery | ESuper;;
(* type ptype = TNormal | TFire | Peff of peff
and peff = ENormal | ENotVery | ESuper *)
(* type 'b mylist = Nil | Cons of 'a * 'b mylist;; *)
(* Error: The type variable 'a is unbound in this type declaration. *)
type 'a mylist = Nil | Cons of 'a * 'a mylist;;
(* type 'a mylist = Nil | Cons of 'a * 'a mylist *)
let f = function
  | 0 -> `Infinity
  | 1 -> `Finite 1
  | n -> `Finite (-n);;
(* val f : int -> [> `Finite of int | `Infinity ] = <fun> *)
(* match f with
  | `NegInfinity -> "negative infinity"
  | `Finite n -> "finite"
  | `Infinity -> "infinite";; *)
(* Error: This pattern matches values of type [? `NegInfinity ]
       but a pattern was expected which matches values of type
         int -> [> `Finite of int | `Infinity ] *)
let f = function
  | `NegInfinity -> "negative infinity"
  | `Finite n -> "finite"
  | `Infinity -> "infinite";;
(* val f : [< `Finite of 'a | `Infinity | `NegInfinity ] -> string = <fun> *)
let a = Failure "something went wrong";;
(* val a : exn = Failure "something went wrong" *)
(* raise e;; *)
(* Error: Unbound value e *)
(* let e = raise e;; *)
(* Error: Unbound value e *)
let e = raise a;;
(* Exception: Failure "something went wrong". *)
