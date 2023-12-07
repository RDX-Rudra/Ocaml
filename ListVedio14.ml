(*write a function (without recursion) that takes in any list and returns the length of the list*)

let f (length_so_far: int) (x: 'a) =
  length_so_far + 1

let length (lst: 'a list) : int = 
  List.fold_left f 0 lst;;