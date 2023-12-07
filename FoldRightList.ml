(*write a function that adds up all the numbers in an integer list*)

let sumr (lst: int list) : int =
  List.fold_right (+) lst 0;;