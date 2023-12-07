let rec sum lst =
  match lst with
  | [] -> 0
  | h :: t -> h + sum t;;

sum (1::2::3::4::5::6::[]);;

let rec length lst =
  match lst with
  | [] -> 0
  | h::t -> 1 + length t;;

length [1; 2; 3; 4; 5; 6; 7];;

let rec append lst1 lst2 =
  match lst1 with
  