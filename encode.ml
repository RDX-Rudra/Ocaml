let enc (c:char) (off:int) : char =
  let valc = Char.code (c) in
   let sum = valc + off in
    if valc >= 65 && valc <= 90 then
      if (sum < 65) then Char.chr(91 - ((65 - sum) mod 26))
      else if sum > 90 then Char.chr(((sum - 90) mod 26) + 64)
      else Char.chr(sum)
    else if valc >= 97 && valc <= 122 then
      if (sum < 97) then Char.chr(123 - ((97 - sum) mod 26))
      else if sum > 122 then Char.chr(((sum - 122) mod 26) + 96)
      else Char.chr(sum)
    else c;;

    
let encstr (s: string) (off: int) : string = String.map (fun x -> enc x off) s;;

let read_file filename = let ic = open_in filename in
        let rec read_lines lines =
          try
            let line = input_line ic in
            read_lines (line :: lines)
          with End_of_file ->
            close_in ic;
            List.rev lines
        in
        read_lines []
      ;;
      
      
let encfile s off =let out = open_out (s^".enc") in
  let f = read_file s in
  List.iter (fun x -> Printf.fprintf out "%s\n" (encstr x off)) f;
  close_out out
    ;;

encfile "one" 3;;