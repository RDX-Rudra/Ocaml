module MyModule = struct
  let inc x = x+1
  type primary_color = Red | Green | Blue 
  exception Oops
end;;

sig
  val inc: int -> int 
  type primary_color = Red | Green | Blue 
  exception Oops
end;;

module ListStack = struct
  let empty = []
  let is_empty = function [] -> true | _-> false 
  let push x s = x::s 
  exception Empty 
  let peek = function 
    | [] -> raise Empty 
    | x :: _-> x 
  let pop = function 
    |[] -> raise Empty 
    |_::s -> s 
end;;

ListStack.push 2 (ListStack.push 1 ListStack.empty);;
ListStack.(push 2 (push 1 empty))
;;

ListStack.(empty |> push 1 |> push 2);;
let s1 = ListStack.(empty |> push 1 |> push 2)
let s2 = ListStack.(empty |> push 3)
;;