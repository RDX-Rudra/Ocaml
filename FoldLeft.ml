let rec fold_left f acc = function 
| [] -> acc 
| h::t -> fold_left f (f acc h) t;;

let sum = fold_left (+) 0;;
let concat = fold_left (^) "";;