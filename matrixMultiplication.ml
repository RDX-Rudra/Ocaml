let rec transpose = function
|[]->[]
|[]::_->[]
|m->(List.Map (List.hd m))::transpose (List.map (List.tl m));;

let rec vectprod v1 v2= match (v1,v2) with
|[], []->0
|((h1::t1),(h2::t2))->(h1*h2)+ vectprod t1 t2;;

let rec matrowprod v m = match m with
|[]-> []
| h::t -> (vectprod v h):: matrowprod v t;;
let compatible m1 m2 = 
  (List.length(List.hd m1)) = (List.length m2);;
let mat_mult mx my = if not (compatible mx my) then failwith "matrix multiplication is not possible"
else let rec mat_mult mx my = match mx with
| [] -> []
| h::t-> (matrowprod h my)::(mat_mult t my)
in mat_mult mx (transpose my);;