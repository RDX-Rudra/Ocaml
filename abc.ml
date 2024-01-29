let inc x = x+1;;
(* val inc : int -> int = <fun> *)
let square x = x*x;;
(* val square : int -> int = <fun> *)
square (inc 5);;
(* - : int = 36 *)
5 |> inc |> square;;
(* - : int = 36 *)
5 |> inc |> square |> inc |> inc |> square;;
(* - : int = 1444 *)
square (inc (inc (square (inc 5))));;
(* - : int = 1444 *)
let id_int (x : int): int = x;;
(* val id_int : int -> int = <fun> *)
(* let x = e [in e'];; *)
(* Error: Syntax error *)
let first x y = x;;
(* val first : 'a -> 'b -> 'a = <fun> *)
let first_int : int -> 'b -> int = first;;
(* val first_int : int -> 'b -> int = <fun> *)
String.sub;;
(* - : string -> int -> int -> string = <fun> *)
let f ~name1:arg1 ~name2:arg2 = arg1 +arg2;;
(* val f : name1:int -> name2:int -> int = <fun> *)
f ~name1:2 ~name2:3;;
(* - : int = 5 *)
let f ~name1:name1 ~name2:name2 = name1+ name2;;
(* val f : name1:int -> name2:int -> int = <fun> *)
(* let ~name1 ~name2 = name1 + name2;; *)
(* Error: Syntax error *)
let f ~name1 ~name2 = name1 + name2;;
(* val f : name1:int -> name2:int -> int = <fun> *)
(* let f : ?name:(arg1=8) arg2 = arg1 + arg2;; *)
(* Error: Syntax error *)
(* let f : ?name:(arg1=8) arg2 = arg1 + arg2;; *)
(* Error: Syntax error *)
let f ?name:(arg1=8) arg2 = arg1 + arg2;;
(* val f : ?name:int -> int -> int = <fun> *)
f 7;;
(* - : int = 15 *)
f ~name: 2 7;;
(* - : int = 9 *)
let add x y = x+y;;
(* val add : int -> int -> int = <fun> *)
add 5 8;;
(* - : int = 13 *)
let addx x = fun y -> x + y;;
(* val addx : int -> int -> int = <fun> *)
let add5 = addx 5;;
(* val add5 : int -> int = <fun> *)
add5 8;;
(* - : int = 13 *)
(+);;
(* - : int -> int -> int = <fun> *)
(+) 3 8;;
(* - : int = 11 *)
(* add3 = (+) 3;; *)
(* Error: Unbound value add3
Hint: Did you mean add, add5 or addx? *)
(* add3 5;; *)
(* Error: Unbound value add3
Hint: Did you mean add, add5 or addx? *)
let add3 = (+) 3;;
(* val add3 : int -> int = <fun> *)
add3 5;;
(* - : int = 8 *)
( ^^ );;
(* - : ('a, 'b, 'c, 'd, 'e, 'f) format6 ->
    ('f, 'b, 'c, 'e, 'g, 'h) format6 ->
    ('a, 'b, 'c, 'd, 'g, 'h) format6
= <fun> *)
let ( ^^ ) x y = max x y;;
(* val ( ^^ ) : 'a -> 'a -> 'a = <fun> *)
( ^^ ) 4 5;;
(* - : int = 5 *)
let rec count n =
  if n = 0 then 0 else 1 + count(n-1);;
(* val count : int -> int = <fun> *)
count 10;;
(* - : int = 10 *)
count 100_000;;
(* - : int = 100000 *)
let rec count_forever n = 1 + count_forever n;;
(* val count_forever : 'a -> int = <fun> *)
count_forever 6;;
(* Stack overflow during evaluation (looping recursion?). *)
(* if n =0 then acc else count_aux (n-1) (acc + 1);; *)
(* Error: Unbound value n *)
let rec count_aux n acc =
  if n =0 then acc else count_aux (n-1) (acc + 1);;
(* val count_aux : int -> int -> int = <fun> *)
count_aux 6;;
(* - : int -> int = <fun> *)
count_aux 6 1;;
(* - : int = 7 *)
count_aux 6 0;;
(* - : int = 6 *)
let count_tr n = count_aux n 0;;
(* val count_tr : int -> int = <fun> *)
count_tr 1_000_000;;
(* - : int = 1000000 *)
let rec fact_aux n acc =
  if n = 0 then acc else fact_aux (n-1) (n*acc);;
(* val fact_aux : int -> int -> int = <fun> *)
let rec fact_tr n = fact_aux n 1;;
(* val fact_tr : int -> int = <fun> *)
fact_tr 50;;
(* - : int = -3258495067890909184 *)
#require "zarith.top";;
#require "Zarith.top";;
#require "Zarith.top";;
print_endline "Dj RDX";;
(* - : unit = () *)
(* # utop.save;; *)
(* Error: Syntax error *)
print_endline "Dj RDX";;
(* - : unit = () *)
let _ = print_endline "Rudra" in
let _ =print_endline "Das" in
print_endline "Smart";;
(* - : unit = () *)
(* print_endline "Dj RDX"
let _ = print_endline "Rudra" in
let _ =print_endline "Das" in
print_endline "Smart";; *)
(* Error: Syntax error *)
print_endline "Rudra";
print_endline "Rudra";
print_endline "Rudra";;
(* - : unit = () *)
(ignore 3); 5;;
(* - : int = 5 *)
let ignore x = (ignore 5);;
(* val ignore : 'a -> unit = <fun> *)
let ignore x = (ignore 5); x;;
(* val ignore : 'a -> 'a = <fun> *)
ignore 10;;
(* - : int = 10 *)
let ignore x = (ignore 5); x;;
(* val ignore : 'a -> 'a = <fun> *)
let ignore x = (ignore 5); x;;
(* val ignore : 'a -> 'a = <fun> *)
#utop_stash;;
(* Directive `utop_stash' expects a `string' literal, got no argument. *)
