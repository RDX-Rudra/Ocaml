let bindings h = 
  Hashtbl.fold (fun k v acc -> (k, v) :: acc) h [];;