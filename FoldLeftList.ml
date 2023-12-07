(*
List.fold_left :- ('a -> 'b -> 'a) -> 'a -> 'b list -> 'a = <fun> 
List.fold_right :- ('a -> 'b -> 'b) -> 'a list -> 'b -> 'b = <fun>

**Fold essentialy analyze a recursive structure through combination, and recombine the results of recursively processing the parts to build a value and return it**
*)
(*write a function that adds up all the numbers in an integer list*)

let suml (lst: int list) : int =
  List.fold_left (+) 0 lst;;