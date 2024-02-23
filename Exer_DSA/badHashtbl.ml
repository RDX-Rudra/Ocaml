module BadHashtbl =
 Hashtbl.Make (struct
   type t = int
   let equal = (=)
   let hash _ = 0
 end)

let bad = BadHashtbl.create 16

let (--) x y =
let rec from x y acc =
  if x > y then acc
  else from x (y-1) (y:: acc)
in from x y []


let () =
 1--100
 |> List.map (fun x -> x, string_of_int x)
 |> List.iter (fun (k,v) -> BadHashtbl.add bad k v)

(* there is now one bucket that has 100 bindings *)
let () = assert ((BadHashtbl.stats bad).bucket_histogram.(100) = 1)