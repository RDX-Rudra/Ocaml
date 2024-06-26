(* let make_mat n = Array.make_matrix n n 0;;

let fillup n =
 let matrix = make_mat n in
 for i=0 to (n-1) do
     for j=0 to (n-1) do
       let a = Random.int(2) in
       matrix.(i).(j) <- a;
     done;
 done;
 matrix
;; *)

let border_ele mat pos =
  match pos with
  | Some (x, y) -> x <= 0 || x >= (Array.length mat - 1) || y <= 0 || y >= (Array.length mat.(0) - 1)
  | None -> false
;;

let play (i, j) matrix =
  let res = Stack.create () in
  let start = Some (i, j) in
  let rec helper (x,y) =
    try
      if matrix.(x).(y) = 0 then
        if (border_ele matrix (Some (x, y))) && (Some (x, y) <> start) then
          Stack.push (Some (x, y)) res
        else
          (matrix.(x).(y) <- 1;
          helper (x, y+1);
          helper (x+1, y);
          helper (x, y-1);
          helper (x-1, y);)
        else ()
    with outOfBound -> ()
  in helper (i, j);
  match Stack.pop_opt res with
    | None -> Printf.printf "No valid position found\n"
    | Some (Some (x, y)) -> Printf.printf "Position found: Some (%d, %d)\n" x y
    | Some None -> Printf.printf "Unexpected None in the stack\n"
;;

(* Example usage *)
let mat = [|[|1; 1; 1; 1; 1|]; 
            [|1; 0; 0; 1; 0|];
            [|1; 0; 1; 1; 1|];
            [|0; 0; 0; 0; 1|];
            [|1; 1; 1; 0; 1|]|] in
let starting_position = (1, 2) in
play starting_position mat
;;

(* let solver matrix start = 
  let res = Stack.create () in 
  let n = Array.length matrix in 
  let a,b = start in 
  let outline x y = if x = 0 || y = 0 || x = n - 1 || y = n - 1 then true else false in
  let is_start x y = if x = a && y = b then true else false in
  let rec helper (x,y) acc = 
      try (  
          if matrix.(x).(y) = 0 then 
              if (outline x y ) && ((is_start x y) = false) 
              then Stack.push ((x,y)::acc) res
              else ( 
                  matrix.(x).(y) <- (-1);
                  (helper ((x+1),y) ((x,y)::acc));  
                  (helper ((x),y+1) ((x,y)::acc));
                  (helper ((x),y-1) ((x,y)::acc));
                  (helper ((x-1),y) ((x,y)::acc))
              )

          else () 
      )
      with outOfBound -> ()
  in helper (a,b) [];
  res
;; *)