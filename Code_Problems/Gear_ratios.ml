let isSymbol symbol = match symbol with
| '0'..'9' -> 0
| '.' -> 1
| _->2;;

type pos ={
  row: int;
  col: int;
}
;;

let getNum matrix position =
  let row = position.row in
  let col = position.col in
  let rec helper mat row col acc =
    if col >= Array.length mat.(row) then
      acc
    else
      let x = mat.(row).(col) in
      match isSymbol x with
      | 1 | 2 -> acc
      | _ -> helper mat row (col + 1) (int_of_string (String.make 1 x) :: acc) in
  helper matrix row col []
;;

let engine_schematic = [
  "467..114..";
  "...*......";
  "..35..633.";
  "......#...";
  "617*......";
  ".....+.58.";
  "..592.....";
  "......755.";
  "...$.*....";
  ".664.598.."
];;

let to_char_array_array matrix =
  Array.map (fun row -> Array.of_list (String.to_seq row |> List.of_seq)) (Array.of_list matrix)
;;
let engine_schematic_array = to_char_array_array engine_schematic
;;

getNum engine_schematic_array (row = 0; col= 1);;