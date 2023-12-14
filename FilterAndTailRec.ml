let rec filter_aux p acc = function 
| []-> acc 
| h::t -> if p h then filter_aux p (h :: acc) t else filter_aux p acc t;;
let filter p = filter_aux p [];;
let lst = filter (fun x-> x mod 2 = 0) [1; 2; 3; 4; 5; 6; 7];;

let rec filter_aux p acc = function 
|[]-> List.rev acc 
| h::t -> if p h then filter_aux p (h::acc) t else filter_aux p acc t;;
let filter p = filter_aux p [];;
let lst2 = filter (fun x-> x mod 2 = 0) [1; 2; 3; 4; 5; 6; 7];;