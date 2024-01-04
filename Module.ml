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