(*write a function that takes a list of pairs and unzips them into a pair of lists *)
(*list 0f tupple -> tupple of list*)
let rec unzip (lst: ('a * 'b) list) : ('a list * 'b list) =
  match lst with 
  | [] -> ([],[])
  | (x,y)::[]-> (x::[],y::[])
  | (x,y)::(x1,y1)::[] -> (x::x1::[], y::y1::[])
  | (x,y)::rest -> (x::(fst (unzip rest)), y::(snd (unzip rest)))