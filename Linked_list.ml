type 'a node = {
  value : 'a;
  mutable next : 'a node option;
}

type 'a mlist = {
  mutable first : 'a node option;
}

let create_node v = {
  next = None;
  value = v;
}

let singleton v = {
  first = Some (create_node v)
}

let insert_first lst v =
  match lst.first with 
  | None -> lst.first <- Some (create_node v)
  | was_first ->
    let new_first = create_node v in
    new_first.next <- was_first;
    lst.first <- Some new_first

let empty = {
  first = None
}