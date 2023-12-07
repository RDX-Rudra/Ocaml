print_endline "Dj RDX";;
let _ = print_endline "Rudra" in
let _ =print_endline "Das" in
print_endline "Smart";;

print_endline "Rudra";
print_endline "Rudra";
print_endline "Rudra";;

(ignore 3); 5;;
let ignore x = (ignore 5);;
let ignore x = (ignore 5); x;;

let print_stat name num =
  Printf.printf "%s: %F\n%!" name num;;

print_stat "rudra" 98.3;;

let print_stat name (num: int) =
  Printf.printf "%s: %i\n%!" name num;;
  print_stat "rudra" 98;;