(*write a function that returns true if the list is empty and false otherwise*)

let is_empty (lst: 'a list) : bool =
  match lst with
  | [] -> true
  | _::_ -> false