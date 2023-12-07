let extract o =
match o with
  | Some i -> string_of_int i
  | None -> "";;

extract (Some 42);;
extract None;;

let rec list_max = function
| [] -> None
| h :: t -> begin
match list_max t with
| None -> Some h
| Some m -> Some (max h m)
end;;

let insert k v lst = (k, v) :: lst;;

let rec lookup k = function
| [] -> None
| (k', v) :: t -> if k = k' then Some v else lookup k t
;;