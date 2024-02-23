module CaseInsensitiveString = struct
  type t = string
  let equal s1 s2 = String.equal (String.lowercase_ascii s1) (String.lowercase_ascii s2)
  let hash s = Hashtbl.hash (String.lowercase_ascii s)
end

module CaseInsensitiveHashtbl = Hashtbl.Make(CaseInsensitiveString)

(* Example usage *)
let () =
  let ht = CaseInsensitiveHashtbl.create 10 in
  CaseInsensitiveHashtbl.add ht "Key1" "Value1";
  CaseInsensitiveHashtbl.add ht "kEy1" "Value2"; (* this will overwrite the previous entry *)
  CaseInsensitiveHashtbl.iter (fun k v -> Printf.printf "Key: %s, Value: %s\n" k v) ht
