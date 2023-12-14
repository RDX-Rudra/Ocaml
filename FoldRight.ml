let rec combine f acc = function 
|[]-> acc
|h::t -> f h (combine f acc t);;


let rec combine' f lst acc = match lst with 
|[] -> acc 
|h::t -> f h (combine' f t acc);;

let sum lst = combine' (+) lst 0;;
let concat lst = combine' (^) lst "";;

let rec fold_right f lst acc = match lst with 
|[] -> acc 
|h::t -> f h (fold_right f t acc);;

let lst = List.fold_right (+) [1; 2; 3; 4; 5; 6; 7; 8] 0;;

