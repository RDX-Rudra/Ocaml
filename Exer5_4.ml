let is_fst_bigred lst =
  match lst with
  | [] -> false
  | h::t -> h="bigred";;

let two_four lst =
  match lst with
  | _::_::[] -> true
  | _::_::_::_::[] -> true
  |_ -> false;;

let fst_two_equal = function
  | h1::h2::t -> h1=h2
  | _ -> false;;

let lst2 = ["bigred";"bigred";"Rdx";"RS"];;
is_fst_bigred lst2;;
two_four lst2;;
fst_two_equal lst2;;