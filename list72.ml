let rec append lst1 lst2 =
  match lst1 with
  | [] -> lst2
  | h::t -> h:: append t lst2;;

let empty lst=
  match lst with 
  | [] -> true
  | _::_ -> false;;

let empty lst =
  lst = [];;

let inc_first lst =
  match lst with 
  | [] -> []
  | h::t -> h+1 ::t;;

let rec sum lst = 
  match lst with 
  | [] -> 0
  | [h] -> h
  | h::t -> h+ sum t;;

let length_is lst n =
  match List.length lst with 
  | m -> m = n;;

let rec sum (l : int list) : int =
  match l with
  | [] -> 0
  | x::xs -> x + (sum xs);;

let rec sum_plus_acc (acc:int) (l: int list) : int =
  match l with
  | [] -> acc 
  | x::xs -> sum_plus_acc (acc + x) xs;;

let sum_tr : int list -> int =
  sum_plus_acc 0;;

let rec from i j l = if i > j then l else from i (j - 1) (j :: l);;

let ( -- ) i j = from i j [];;
let long_list = 0 -- 1_00;;

List.init 1_00 Fun.id;;