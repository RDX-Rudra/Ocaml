(*write a function that will compute the length of a String given in the input list. return a tuple (pair) list with each pair containing the (string, length of String) *)

let rec length_of_pairs (lst: string list) : (string * int) list =
  match lst with 
  |[]->[]
  |h::[]-> (h, String.length h)::[]
  |h::t -> (h, String.length h):: length_of_pairs t 