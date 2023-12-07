let rec concat_string lst = 
  match lst with 
  | [] -> ""
  | h::t -> h ^ concat_string t;;

concat_string ["R";"u";"d";"r";"a"];;