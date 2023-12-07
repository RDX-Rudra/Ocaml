let rec transpose ls =
  let rec transpose' acc = function
    | [] | [] :: _ -> List.rev acc
    | ls -> transpose' (List.map List.hd ls :: acc) (List.map List.tl ls)
  in transpose' [] ls;;

let dot = List.fold_left2 (fun acc x y -> acc + x * y) 0;;

let multiply_matrices m1 m2 =
  List.map (fun row -> List.map (dot row) (transpose m2)) m1;;

(* another solution *)

let inner matrix row = List.map (dot row) (transpose matrix);;

let multiply_matrices' m1 m2 =
  List.map (inner m2) m1;;