let matrix = 
  [|
    [|1;1;1;0;1;1;0|]; 
    [|1;1;1;0;1;0;1|];
    [|1;0;0;0;0;1;1|];
    [|1;1;0;1;0;1;1|];
    [|1;1;0;0;0;1;0|];
    [|1;0;1;1;1;1;1|];
    [|1;0;1;1;1;1;1|];
  |];;
  
(* let current_matrix = ref (Array.length matrix , matrix);; *)
let res : (int * int) list Stack.t = Stack.create()

let start_from (a,b) = 
  let row = Array.length(matrix) in
  let col = Array.length(matrix.(0)) in
  let arr = matrix in
  let outLine x y = if x <> a || y <> b then x = (row - 1)|| x = 0 || y = (col - 1) || y = 0 else false in 
  if arr.(a).(b) = 1 then failwith "Not a point of Entry" else
    let rec helper (x,y) acc = 
      try 
        if arr.(x).(y) = 0 then 
          if (List.mem (x, y) acc) then () else if (outLine x y) then 
            (print_endline("Result Found");(Stack.push ((x,y) :: acc) res)) else 
            ((helper ((x+1),y) ((x,y):: acc)); (helper ((x-1),y) ((x,y):: acc));
             (helper (x,(y + 1)) ((x,y):: acc));(helper (x,(y - 1)) ((x,y):: acc)))
        else ()
      with outOfBound -> ()
    in helper (a,b) [] ;;
let printResult () = 
  let rec helper s = 
    match Stack.pop_opt s with 
    |Some v -> v :: helper s 
    |None -> []
  in helper res;;
  
print_endline("\n\nnext give starting location (start_from (a,b))\n\n");;