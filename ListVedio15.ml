(*write a function that takes in a list of integers. this function will return the sum of the even positions in the list*)

let f (sum, position) (element)=
  if position mod 2 = 0 then (sum + element, position + 1) else (sum, position+1);;

let sum_even_position (lst: int list) : int =
  match List.fold_left f (0,0) lst with 
  | (sum,pos) -> sum;;
  