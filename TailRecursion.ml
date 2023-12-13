let rec map_tr_aux f acc = function
|[]->acc
|h::t-> map_tr_aux f (acc @ [f h]) t;;

let map_tr f = map_tr_aux f [];;
let lst = map_tr (fun x -> x+1) [1; 2; 3];;

130