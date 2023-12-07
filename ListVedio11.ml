(*write a function that capitalizes each string in a list. use string.capitalize_ascii*)

let capitalize_list (lst: string list) : string list =
  List.map (fun x -> String.capitalize_ascii x) lst 