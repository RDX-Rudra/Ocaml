(*write a ocaml function that returns true if all the elemenrs of a list are true*)
let rec all_true (lst : bool list) : bool =
  match lst with
  | [] -> true
  | x::[] -> if x = true then true else false
  | h::t -> if h = true then all_true t else false;;

