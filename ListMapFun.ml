(*
list.Map : ('a -> 'b -> 'b) -> 'a list -> 'b = <fun>
**Maps a function to a list**   
*)
(*write a function that uses the string concatenation operator ^ to add the string ! to the end of each string in the input list (no recursion)*)

let excited (lst: string list) : string list =
  List.map (fun x -> x ^ "!") lst