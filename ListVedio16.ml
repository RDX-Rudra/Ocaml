(*productf: function multiplies all the numbers in a list function satishfies product (11@12)= productf 11 * product 12 *)

let mult_float (x: float) (y: float) : float = x*.y

let productf (lst: float list) : float =
  List.fold_left mult_float 1. lst;;