(*List.filter;;
- : ('a -> bool) -> 'a list -> 'a list = <fun>
*)
(*write a fun that returns only the odd integers in a list of integers*)

let only_odds (lst: int list) : int list =
  List.filter (fun x -> (x mod 2 != 0)) lst 

  