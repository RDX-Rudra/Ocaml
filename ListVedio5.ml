(*write a function that finds the smallest element in the list*)

let rec minimum (lst: 'a list) : 'a =
  match lst with 
  | [] -> raise (Invalid_argument "minimum")
  | x::[] -> x 
  | x::rest -> if x< minimum rest then x else minimum rest  