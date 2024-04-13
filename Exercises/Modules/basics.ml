(* struct
  let inc x = x + 1
  type primary_color = Red | Green | Blue
  exception Oops
end;; *)
(* Error: Syntax error *)
module MyModule = struct
  let inc x = x + 1
  type primary_color = Red | Green | Blue
  exception Oops
end;;
(* module MyModule :
  sig
    val inc : int -> int
    type primary_color = Red | Green | Blue
    exception Oops
  end *)
module ListStack = struct
  (** [empty] is the empty stack. *)
  let empty = []

  (** [is_empty s] is whether [s] is empty. *)
  let is_empty = function [] -> true | _ -> false

  (** [push x s] pushes [x] onto the top of [s]. *)
  let push x s = x :: s

  (** [Empty] is raised when an operation cannot be applied
      to an empty stack. *)
  exception Empty

  (** [peek s] is the top element of [s].
      Raises [Empty] if [s] is empty. *)
  let peek = function
    | [] -> raise Empty
    | x :: _ -> x

  (** [pop s] is all but the top element of [s].
      Raises [Empty] if [s] is empty. *)
  let pop = function
    | [] -> raise Empty
    | _ :: s -> s
end;;
(* module ListStack :
  sig
    val empty : 'a list
    val is_empty : 'a list -> bool
    val push : 'a -> 'a list -> 'a list
    exception Empty
    val peek : 'a list -> 'a
    val pop : 'a list -> 'a list
  end *)
ListStack.push 2 (ListStack.push 1 ListStack.empty);;
(* - : int list = [2; 1] *)
(* x =5;; *)
(* Error: Unbound value x *)
let s1 = ListStack.(empty |> push 1 |> push 2)
let s2 = ListStack.(empty |> push 3);;
(* val s1 : int list = [2; 1]
val s2 : int list = [3] *)
module M = struct
  (* Requires: input is non-negative. *)
  let rec even = function 
    | 0 -> true 
    | n -> odd (n - 1)
  and odd = function 
    | 0 -> false 
    | n -> even (n - 1)
end;;
(* module M : sig val even : int -> bool val odd : int -> bool end *)
open ListStack;;
empty |> push(4) |> push(5);;
(* - : int list = [5; 4] *)
(* pop();; *)
(* Error: This variant expression is expected to have type 'a list
       There is no constructor () within type list *)
pop([5; 4]);;
(* - : int list = [4] *)
module M = struct
  open List

  (** [uppercase_all lst] upper-cases all the elements of [lst]. *)
  let uppercase_all = map String.uppercase_ascii
end;;
(* module M : sig val uppercase_all : string list -> string list end *)
let s = Stack.create;;
(* val s : unit -> 'a Stack.t = <fun> *)
(* s.push(4);; *)
(* Error: This expression has type unit -> 'a Stack.t which is not a record type. *)
(* Stack.push 5 s;; *)
(* Error: This expression has type unit -> 'a Stack.t
       but an expression was expected of type int Stack.t
       Hint: Did you forget to provide `()' as argument? *)
(* Stack.push (5) s;; *)
(* Error: This expression has type unit -> 'a Stack.t
       but an expression was expected of type int Stack.t
       Hint: Did you forget to provide `()' as argument? *)
let s = Stack.create ();;
(* val s : '_weak1 Stack.t = <abstr> *)
Stack.push (5) s;;
(* - : unit = () *)
(* Stack.pop() s;; *)
(* Error: This expression has type unit but an expression was expected of type
         ('a -> 'b) Stack.t *)
(* Stack.pop();; *)
(* Error: This expression has type unit but an expression was expected of type
         'a Stack.t *)
Stack.pop s;;
(* - : int = 5 *)
(* map;; *)
(* Error: Unbound value map
Hint: Did you mean max? *)
module M = struct
  open List

  (** [uppercase_all lst] upper-cases all the elements of [lst]. *)
  let uppercase_all = map String.uppercase_ascii
end;;
(* module M : sig val uppercase_all : string list -> string list end *)
String.map;;
(* - : (char -> char) -> string -> string = <fun> *)
String.trim;;
(* - : string -> string = <fun> *)
String.trim "   sfgjf   ";;
(* - : string = "sfgjf" *)
String.trim "   sfg    jf   ";;
(* - : string = "sfg    jf" *)
(* remove surrounding whitespace from [s] and convert it to lower case *)
let s = "BigRed "
let s' = s |> String.trim |> String.lowercase_ascii (* long way *)
let s'' = String.(s |> trim |> lowercase_ascii) (* short way *);;
(* val s : string = "BigRed "
val s' : string = "bigred"
val s'' : string = "bigred" *)
(** [lower_trim s] is [s] in lower case with whitespace removed. *)
let lower_trim s =
  let open String in
  s |> trim |> lowercase_ascii;;
(* val lower_trim : string -> string = <fun> *)
module M = struct
  (** [uppercase_all lst] upper-cases all the elements of [lst]. *)
  let uppercase_all = List.map String.uppercase_ascii
end;;
(* module M : sig val uppercase_all : string list -> string list end *)
module type LIST_STACK = sig
  exception Empty
  val empty : 'a list
  val is_empty : 'a list -> bool
  val push : 'a -> 'a list -> 'a list
  val peek : 'a list -> 'a
  val pop : 'a list -> 'a list
end;;
(* module type LIST_STACK =
  sig
    exception Empty
    val empty : 'a list
    val is_empty : 'a list -> bool
    val push : 'a -> 'a list -> 'a list
    val peek : 'a list -> 'a
    val pop : 'a list -> 'a list
  end *)
module ListStack : LIST_STACK = struct
  let empty = []

  let is_empty = function [] -> true | _ -> false

  let push x s = x :: s

  exception Empty

  let peek = function
    | [] -> raise Empty
    | x :: _ -> x

  let pop = function
    | [] -> raise Empty
    | _ :: s -> s
end;;
(* module ListStack : LIST_STACK *)
(* module ListStackAlias : LIST_STACK = ListStack
(* equivalently *)
module ListStackAlias = (ListStack : LIST_STACK)

module M : sig val x : int end = struct let x = 42 end
(* equivalently *)
module M = (struct let x = 42 end : sig val x : int end);; *)
(* Error: Multiple definition of the module name ListStackAlias.
       Names must be unique in a given structure or signature. *)
module ListStackAlias : LIST_STACK = ListStack;;
(* module ListStackAlias : LIST_STACK *)
module ListStackAlias = (ListStack : LIST_STACK);;
(* module ListStackAlias : LIST_STACK *)
module M : sig val x : int end = struct let x = 42 end;;
(* equivalently *)
module M = (struct let x = 42 end : sig val x : int end);;
(* module M : sig val x : int end *)
module type IntFun = sig
  val f : int -> int
end

module IdFun = struct
  let f x = x
end

module Iid = (IdFun : IntFun);;
(* module type IntFun = sig val f : int -> int end
module IdFun : sig val f : 'a -> 'a end
module Iid : IntFun *)
