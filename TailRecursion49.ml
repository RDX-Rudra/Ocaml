let rec count n =
  if n = 0 then 0 else 1 + count(n-1);;
count 10;;
count 100_000;;

let rec count_forever n = 1 + count_forever n;;
count_forever 6;;

let rec count_aux n acc =
  if n =0 then acc else count_aux (n-1) (acc + 1);;
count_aux 6 0;;
let count_tr n = count_aux n 0;;
count_tr 1_000_000;;
