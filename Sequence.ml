let rec ones = 1 :: ones;;
(* val ones : int list = [1; <cycle>] *)
let rec a = 0 :: b and b = 1:: a;;
(* val a : int list = [0; 1; <cycle>]
val b : int list = [1; 0; <cycle>] *)
(** [from n] is the infinite list [[n; n + 1; n + 2; ...]]. *)
let rec from n = n :: from (n + 1);;
(* val from : int -> int list = <fun> *)
let nats = from 0;;
(* Stack overflow during evaluation (looping recursion?). *)
(* type 'a mylist = Nil | Cons of 'a * 'a sequence;; *)
(* Error: Unbound type constructor sequence *)
type 'a mylist = Nil | Cons of 'a * 'a mylist;;
(* type 'a mylist = Nil | Cons of 'a * 'a mylist *)
type 'a sequence = Cons of 'a * 'a sequence;;
(* type 'a sequence = Cons of 'a * 'a sequence *)
let rec from n = Cons (n, from (n+1));;
(* val from : int -> int sequence = <fun> *)
let nats = from 0;;
(* Stack overflow during evaluation (looping recursion?). *)
type 'a sequence = Cons of 'a * (unit -> 'a sequence);;
(* type 'a sequence = Cons of 'a * (unit -> 'a sequence) *)
(* let rec from n = cons (n, fun () -> from (n+1));; *)
(* Error: Unbound value cons
Hint: Did you mean cos? *)
let rec from n = Cons (n, fun () -> from (n+1));;
(* val from : int -> int sequence = <fun> *)
let hd (Cons (h, _)) = h;;
(* val hd : 'a sequence -> 'a = <fun> *)
let tl (Cons (_, t)) = t ();;
(* val tl : 'a sequence -> 'a sequence = <fun> *)
let rec take n s = if n =0 then [] else hd s :: take (n-1)  (tl s);;
(* val take : int -> 'a sequence -> 'a list = <fun> *)
(* let rec drop n s = if n = 0 then s else (n - 1) (tl s);; *)
(* Error: This expression has type int
       This is not a function; it cannot be applied. *)
let rec drop n s = if n = 0 then s else drop (n - 1) (tl s);;
(* val drop : int -> 'a sequence -> 'a sequence = <fun> *)
(* take 10 nats;; *)
(* Error: Unbound value nats *)
let nats = from 0;;
(* val nats : int sequence = Cons (0, <fun>) *)
take 10 nats;;
(* - : int list = [0; 1; 2; 3; 4; 5; 6; 7; 8; 9] *)
drop 10 nats;;
(* - : int sequence = Cons (10, <fun>) *)
take 10 (drop 5 nats);;
(* - : int list = [5; 6; 7; 8; 9; 10; 11; 12; 13; 14] *)
(** [square <a; b; c; ...>] is [<a * a; b * b; c * c; ...]. *)
let rec square (Cons (h, t)) =
  Cons (h * h, fun () -> square (t ()))

(** [sum <a1; a2; a3; ...> <b1; b2; b3; ...>] is
   [<a1 + b1; a2 + b2; a3 + b3; ...>] *)
let rec sum (Cons (h1, t1)) (Cons (h2, t2)) =
  Cons (h1 + h2, fun () -> sum (t1 ()) (t2 ()));;
(* val square : int sequence -> int sequence = <fun>
val sum : int sequence -> int sequence -> int sequence =
  <fun> *)
(** [map f <a; b; c; ...>] is [<f a; f b; f c; ...>] *)
let rec map f (Cons (h, t)) =
  Cons (f h, fun () -> map f (t ()))

(** [map2 f <a1; b1; c1;...> <a2; b2; c2; ...>] is
   [<f a1 b1; f a2 b2; f a3 b3; ...>] *)
let rec map2 f (Cons (h1, t1)) (Cons (h2, t2)) =
  Cons (f h1 h2, fun () -> map2 f (t1 ()) (t2 ()))

let square' = map (fun n -> n * n)
let sum' = map2 ( + );;
(* val map : ('a -> 'b) -> 'a sequence -> 'b sequence = <fun>
val map2 :
  ('a -> 'b -> 'c) ->
  'a sequence -> 'b sequence -> 'c sequence = <fun>
val square' : int sequence -> int sequence = <fun>
val sum' : int sequence -> int sequence -> int sequence =
  <fun> *)
let rec nats = Cons (0, fun () -> map (fun x -> x + 1) nats);;
(* val nats : int sequence = Cons (0, <fun>) *)
let rec fibs =
  Cons (1, fun () ->
    Cons (1, fun () ->
      sum fibs (tl fibs)));;
(* val fibs : int sequence = Cons (1, <fun>) *)
