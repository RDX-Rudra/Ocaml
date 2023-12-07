(*write a function that determines if a value is in a list or not*)
let rec elem (element: 'a) (lst: 'a list) : bool =
  match lst with
  |[] -> false
  | x::t -> x=element || elem element t