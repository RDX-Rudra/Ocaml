module type Map = sig
  type ('k, 'v)t
  val insert : 'k -> 'v -> ('k, 'v) t -> ('k, 'v) t
  val find : 'k -> ('k, 'v) t -> 'v option
  val remove : 'k -> ('k, 'v) t -> ('k, 'v) t
  val empty : ('k, 'v) t
  val of_list : ('k * 'v) list -> ('k, 'v) t
  val bindings : ('k, 'v) t -> ('k * 'v) list
end;;

module ListMap : Map = struct
  type ('k, 'v) t = ('k * 'v) list 
  let insert k v m = (k, v) :: m 
  let find = List.assoc_opt 
  (* let rec assoc_opt key = function
  | [] -> None
  | (k, v) :: tl -> 
    if k = key then
      Some v
    else
      assoc_opt key tl
 *)
  let remove k m = List.filter (fun (k',_) -> k<> k') m 
  let empty = []
  let of_list lst = lst
  let keys m = m |> List.map fst |> List.sort_uniq Stdlib.compare
  let binding m k = (k, List.assoc k m)
  let bindings m = List.map (binding m) (keys m)
end;;