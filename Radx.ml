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

let border_ele mat (x, y) = 
  if x <= 0 || x >= (Array.length mat -1) || y<=0 || y>= (Array.length mat -1) then true
  else false;;

let connected_ele mat (x, y) =
  if x <= 0 then
  [1; mat.(x).(y+1); mat.(x+1).(y); mat.(x).(y-1)]
  else if y>= (Array.length mat -1) then
  [mat.(x-1).(y); 1; mat.(x+1).(y); mat.(x).(y-1)]
  else if x >= Array.length mat - 1 then
  [mat.(x-1).(y); mat.(x).(y+1); 1; mat.(x).(y-1)]
  else if y<=0 then
  [mat.(x-1).(y); mat.(x).(y+1); mat.(x+1).(y); 1]
  else
  [mat.(x-1).(y); mat.(x).(y+1); mat.(x+1).(y); mat.(x).(y-1)]
  ;;
let move_up (x, y) = Some (x-1, y);;
let move_right (x,y) = Some (x, y+1);;
let move_down (x, y) = Some (x+1, y);;
let move_left (x,y) = Some (x, y-1);;

let one_move i j lstct =
  let up = if List.nth lstct 0 = 0 then move_up (i, j) else None in
  let right = if List.nth lstct 1 = 0 then move_right (i, j) else None in
  let down = if List.nth lstct 2 = 0 then move_down (i, j) else None in
  let left = if List.nth lstct 3 = 0 then move_left (i, j) else None in
  [up; right; down; left]
;;

let take (Some (x,y)) = (x,y);;
let play (x, y) matrix =
  let start = Some (x, y) in
  let rec move start matrix =
    let lstct = connected_ele matrix (x, y) in
    let possible_moves = one_move x y lstct in
    let filtered_moves =
      List.filter (fun move_opt ->
        match move_opt with
        | Some (a, b) -> (a <> x || b <> y)
        | None -> false
      ) possible_moves
    in
    match filtered_moves with
    | [] -> None
    | hd :: _ -> if (border_ele matrix (take hd)) then hd
    else move hd matrix
  in
  move start matrix
;;


(* Example usage *)
let matrix = [|[|1; 1; 1; 1; 1|]; [|1; 0; 0; 1; 0|]; [|1; 0; 1; 1; 1|]; [|1; 0; 0; 0; 1|];
  [|1; 1; 1; 0; 1|]|] in
let starting_position = (1, 2) in
match play starting_position matrix with
| Some (a, b) -> print_endline ("Bob moved to: (" ^ string_of_int a ^ ", " ^ string_of_int b ^ ")")
| None -> print_endline "Bob has no valid moves"
;;
