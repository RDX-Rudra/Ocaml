module type Monad = sig
  type 'a t
  val return : 'a -> 'a t
  val ( >>= ) : 'a t -> ('a -> 'b t) -> 'b t
end;;

module MyMonad : Monad = struct
  type 'a t = 'a * string  (* Using a tuple to hold the result and log *)

  let return x = (x, "")

  let ( >>= ) m f =
    let (a, s1) = m in
    let (b, s2) = f a in
    (b, s1 ^ s2)
end;;

open MyMonad;;

let log name f =
  let start = Sys.time () in
  fun x y ->
    let result = f x y in
    let stop = Sys.time () in
    let diff = stop -. start in
    (result, Printf.sprintf "Called %s for %f seconds; " name diff);;

let time name f a d =
  let (result, log_message) = log name f a d in
  print_endline log_message;
  return result;;
  
let average_time name f a d n =
  let rec loop acc i =
    if i = 0 then return acc
    else
      time name f a d >>= fun result ->
      loop (acc +. (Sys.time ())) (i - 1)
  in
  loop 0.0 n >>= fun total ->
  let average = total /. float_of_int n in
  print_endline (Printf.sprintf "Average time: %f" average);
  return average;;


let average_time name f a d n =
  let rec loop acc i =
  if i = 0 then return acc
  else
    time name f a d >>= fun (time, result, log_message) ->
    loop (acc +. time) (i - 1)
  in
  loop 0.0 n >>= fun total ->
  let average = total /. float_of_int n in
  print_endline (Printf.sprintf "Average time: %f" average);
  return average;;