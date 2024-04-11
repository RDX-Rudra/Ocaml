let a = [1;2;3;4;5];;
(* val a : int list = [1; 2; 3; 4; 5] *)
(* let b = 1::2::3::4::5;; *)
(* Error: This expression has type int but an expression was expected of type
         int list *)
let b = 1::2::3::4::5::[];;
(* val b : int list = [1; 2; 3; 4; 5] *)
let c = [1;2;3] @ [4;5];;
(* val c : int list = [1; 2; 3; 4; 5] *)
let rec product = function
|[]->1
|h::t-> h* product t;;
(* val product : int list -> int = <fun> *)
product a;;
(* - : int = 120 *)
let rec concat = function
|[]->""
|h::t-> h ^ concat t;;
(* val concat : string list -> string = <fun> *)
let d = ["R";"u";"d";"r";"a"];;
(* val d : string list = ["R"; "u"; "d"; "r"; "a"] *)
concat d;;
(* - : string = "Rudra" *)
assert (product a = 120);;
(* - : unit = () *)
assert (product a = 121);;
(* Exception: Assert_failure ("//toplevel//", 1, 0). *)
let patterns = function
|[]->false
|h::_-> h="bigred";;
(* val patterns : string list -> bool = <fun> *)
let pattern1 = function
|[]->false
|_::_::[]->true
|_::_::_::_::[]->true
|_->false;;
(* val pattern1 : 'a list -> bool = <fun> *)
let el =[1;2];;
(* val el : int list = [1; 2] *)
pattern1 el;;
(* - : bool = true *)
let e2 =[1;2;3;4];;
(* val e2 : int list = [1; 2; 3; 4] *)
pattern1 e2;;
(* - : bool = true *)
pattern1 a;;
(* - : bool = false *)
let pattern2 = function
|[]->false
|h1::h2::_->true
;;
(* val pattern2 : 'a list -> bool = <fun> *)
let pattern2 = function
|[]->false
|h1::h2::_->true
|_->false;;
(* val pattern2 : 'a list -> bool = <fun> *)
let pattern2 = function
|[]->false
|h1::h2::_-> h1=h2
|_->false;;
(* val pattern2 : 'a list -> bool = <fun> *)
(* List,nth;; *)
(* Error: Unbound constructor List *)
List.nth;;
(* - : 'a list -> int -> 'a = <fun> *)
let nth_ele lst = if List.length lst >5 || List.length lst<5 then 0 else List.nth lst 5;;
(* val nth_ele : int list -> int = <fun> *)
nth_ele a;;
(* Exception: Failure "nth". *)
let nth_ele lst = if List.length lst<5 then 0 else List.nth lst 5;;
(* val nth_ele : int list -> int = <fun> *)
nth_ele a;;
(* Exception: Failure "nth". *)
let nth_ele lst = if List.length lst<5 then 0 else List.nth lst 4;;
(* val nth_ele : int list -> int = <fun> *)
nth_ele a;;
(* - : int = 5 *)
(* let sort_list lst = List.rev( List.sort lst);; *)
(* Error: This expression has type 'a list -> 'a list
       but an expression was expected of type 'b list *)
List.sort;;
(* - : ('a -> 'a -> int) -> 'a list -> 'a list = <fun> *)
let sort_list lst = List.rev( List.sort Stdlib.compare lst);;
(* val sort_list : 'a list -> 'a list = <fun> *)
sort_list a;;
(* - : int list = [5; 4; 3; 2; 1] *)
let lst_ele lst = List.tl lst;;
(* val lst_ele : 'a list -> 'a list = <fun> *)
lst_ele a;;
(* - : int list = [2; 3; 4; 5] *)
let lst_ele lst = List.hd (List.rev lst);;
(* val lst_ele : 'a list -> 'a = <fun> *)
lst_ele a;;
(* - : int = 5 *)
List.compare;;
(* - : ('a -> 'a -> int) -> 'a list -> 'a list -> int = <fun> *)
List.iter;;
(* - : ('a -> unit) -> 'a list -> unit = <fun> *)
List.exists;;
(* - : ('a -> bool) -> 'a list -> bool = <fun> *)
List.exists2;;
(* - : ('a -> 'b -> bool) -> 'a list -> 'b list -> bool = <fun> *)
(* let contains_0 lst = List.exist (fun x-> x=0) lst;; *)
(* Error: Unbound value List.exist
Hint: Did you mean exists? *)
let contains_0 lst = List.exists (fun x-> x=0) lst;;
(* val contains_0 : int list -> bool = <fun> *)
contains_0 b;;
(* - : bool = false *)
