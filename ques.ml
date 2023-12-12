let is_alpha c =
  (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z')

let extract_words s =
  let rec extract acc buffer = function
    | [] ->
      if Buffer.length buffer > 0 then
        List.rev (Buffer.contents buffer :: acc)
      else
        List.rev acc
    | c :: rest ->
      if is_alpha c then (
        Buffer.add_char buffer c;
        extract acc buffer rest
      ) else if Buffer.length buffer > 0 then (
        let word = Buffer.contents buffer in
        Buffer.clear buffer;
        extract (word :: acc) buffer rest
      ) else (
        extract acc buffer rest
      )
  in
  extract [] (Buffer.create 16) (String.to_seq s |> List.of_seq)

let words_in_string (s: string) : string list =
  extract_words s;;

(* Function to print words in a list *)
let print_words words_list =
  List.iter (fun word -> print_endline word) words_list;;

(* Example usage *)
words_in_string "hello I am, Rudra!";;
