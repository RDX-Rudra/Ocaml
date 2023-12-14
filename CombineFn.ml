let rec sum = function 
| []-> 0
| h::t -> h + sum t;;
let s = sum [1; 2; 3];;

let rec concat = function 
| [] -> ""
| h::t -> h ^ concat t;;

let c = concat ["a"; "b"; "c"; "d"];;

let rec sum' init = function 
| []->init 
| h::t -> h+ sum' init t;;
let sum = sum' 0;;

let rec concat' init = function 
| []-> init 
| h::t -> h ^ concat' init t;;
let concat = concat' "";;

let rec combine op init = function 
|[]-> init 
|h::t-> op h (combine op init t);;
let sum = combine (+) 0;;
let sum = combine (^) "";;



