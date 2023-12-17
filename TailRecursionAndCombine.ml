let rec combine_tr f acc = function 
|[]-> acc 
|h::t-> combine_tr f (f acc h) t;;

let rec combine f acc = function 
| [] -> acc 
| h::t -> 
  let acc' = combine f acc t in f h acc';;

let rec combine_tr f acc = function 
| [] -> acc 
| h::t -> 
  let acc' = f acc h in combine_tr f acc' t;;

let sum = combine_tr (+) 0;;
let s = sum [1; 2; 3; 4];;

let sub = combine (-) 0;;
let subs = sub [3; 2; 1];;
let sub' = combine_tr (-) 0;;
let s' = sub [3; 2; 1];;