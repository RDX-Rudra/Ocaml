(*write a function that appends two list*)
let rec append (lst1 : 'a list) (lst2: 'a list) : 'a list =
  match lst1 with 
  |[] -> lst2 
  | x::[] -> x::lst2 
  | h::t -> h :: (append t lst2)