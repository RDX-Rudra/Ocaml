let rec count_aux n acc =
  if n = 0 then acc else count_aux (n - 1) (acc + 1)
let count_tr n = count_aux n 0
