let ( -- ) i j =
let rec from i j acc =
  if i > j then acc
  else from i (j-1) (j :: acc)
in from i j []
;;
let tab = Hashtbl.create 16
;;
let ints = List.map(fun x -> (x, string_of_int x)) (1 -- 31)
;;
let () = List.iter(fun (k, v) -> Hashtbl.add tab k v) ints
;;
let () = assert (Hashtbl.find tab 1 = "1");;
let () = assert ((try Hashtbl.find tab 0 with Not_found -> "") = "");;