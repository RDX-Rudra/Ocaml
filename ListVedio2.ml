(*write a function even2ways that checks if an integer list only concatains even values and has a even number of elements*)

let even x = x mod 2 = 0

let rec even2ways (lst : int list) : bool =
  match lst with 
  | [] -> true
  | x::[] -> false 
  | x1::x2::rest -> even x1 && even x2 && even2ways rest;;