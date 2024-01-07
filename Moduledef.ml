module M = struct
  let x = 0;;
  type t = int;;
end;;

module M = struct
  let x = 0;;
  let _ = assert (x = 0);;
end;;

module N = struct let x = 0 let y = 1 end;;
module O = struct let x = 0;; let y = 1 end;;