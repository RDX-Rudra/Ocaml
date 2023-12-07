(*write a function that uses the string concatenation operator ^ to add the string ! to the end of each string in the input list*)

let rec exclaim (lst: string list) : string list =
  match lst with 
  | [] -> []
  | h::t -> (h^"!") :: exclaim t 