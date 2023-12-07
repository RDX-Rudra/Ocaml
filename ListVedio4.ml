(*write an OCaml function named head that returns the front element of a list*)

let head (lst: 'a list) : 'a =
  match lst with 
  | x::_ -> x
  |_ -> raise (Invalid_argument "head")