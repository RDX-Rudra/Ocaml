let rec map f = function
|[] -> []
|h::t -> f h :: map f t;;
let add1 = map (fun x -> x+1);;
let p x = print_int x; print_newline(); x+1;;
let lst = map p [1; 2];;
