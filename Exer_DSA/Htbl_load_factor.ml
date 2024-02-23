let (/..) x y = float_of_int x /. float_of_int y

let load_factor h =
  let stats = Hashtbl.stats h in 
  stats.num_bindings /.. stats.num_buckets

let epsilon = 0.1

let close_to x y=
abs_float (x-.y) <= epsilon