let rec prod_lst lst = 
  match lst with
  |[] -> 1
  |h::t -> h* prod_lst t
;;

let lst1 = [1;2;3;4;5];;
prod_lst lst1;;
