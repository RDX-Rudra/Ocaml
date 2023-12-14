let odd n = n mod 2 <> 0;;
let rec odds = function 
|[] -> []
|h::t -> if odd h then h :: odds t else odds t;;
let lst2 = odds [1; 2; 3; 4; 5];;