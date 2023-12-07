let rec fact_aux n acc =
  if n = 0 then acc else fact_aux (n-1) (n*acc);;

let rec fact_tr n = fact_aux n 1;;
fact_tr 50;;

#require "Zarith.top";;

let rec zfact_aux n acc =
  if Z.equal n Z.zero then acc else zfact_aux (Z.pred n) (Z.mul acc n);;