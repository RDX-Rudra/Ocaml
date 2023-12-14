let rec map_tr_aux f acc = function
|[]->acc
|h::t-> map_tr_aux f (acc @ [f h]) t;;

let map_tr f = map_tr_aux f [];;
let lst = map_tr (fun x -> x+1) [1; 2; 3];;

let rec map_tr_aux f acc = function
| []->acc
| h::t-> map_tr_aux f (f h :: acc) t;;

let map_tr f = map_tr_aux f [];;

let lst = map_tr (fun x-> x+1) [1; 2; 3];;

let rec rev_map_aux f acc = function 
| []-> acc
| h::t-> rev_map_aux f (f h :: acc) t;;
let rev_map f = rev_map_aux f [];;
let lat3 = rev_map (fun x-> x+1) [1; 2; 3];;

let lst = List.rev (List.rev_map (fun x -> x+1) [1; 2; 3]);;