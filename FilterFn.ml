let even n = n mod 2 = 0;;
let rec evens = function 
| []->[]
| h::t -> if even h then h :: evens t else evens t;;

let lst = evens [1; 2; 3; 4; 5];;

let odd n = n mod 2 <> 0;;
let rec odds = function 
|[] -> []
|h::t -> if odd h then h :: odds t else odds t;;
let lst2 = odds [1; 2; 3; 4; 5];;

let rec filter p = function 
|[]->[]
|h::t -> if p h then h :: filter p t else filter p t;;

let odds = filter odd;;
let evens = filter even;;

let lst = List.filter odd [1; 2; 3; 4; 5; 6; 7; 8];;