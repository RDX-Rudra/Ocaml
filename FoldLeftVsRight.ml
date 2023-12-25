ListLabels.fold_left;;
ListLabels.fold_left ~f: (fun x y -> x - y) ~init:0 [1; 2; 3];;

ListLabels.fold_right;;
ListLabels.fold_right ~f: (fun y x -> x - y) ~init:0 [1; 2; 3];;

