(* possibility 1 *)
let random_int bound =
  assert (bound > 0 && bound < 1 lsl 30);;
  (* proceed with the implementation of the function *)
  (* possibility 2 *)
let random_int bound =
  if not (bound > 0 && bound < 1 lsl 30)
  then invalid_arg "bound";;
  (* proceed with the implementation of the function *)
  (* possibility 3 *)
let random_int bound =
  if not (bound > 0 && bound < 1 lsl 30)
  then failwith "bound";;
  (* proceed with the implementation of the function *)

random_int 15;;
random_int 30;;
random_int 45;;
random_int 0;;
