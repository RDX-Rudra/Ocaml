(*write a function that square every element of a list*)

let square_list (lst: int list) : int list =
  List.map (fun x -> x*x) lst 