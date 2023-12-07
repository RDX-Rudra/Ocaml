(*w.a.F. that capitalized strings in a string list (use String.get to extract the first character from a list, check uppercase with char.uppercase_ascii) *)

let is_capital (s: string) : bool =
  String.get s 0 = Char.uppercase_ascii (String.get s 0)

let only_capitalized (lst: string list) : string list =
  List.filter is_capital lst;;