module type X = sig 
  val x : int
end
;;
module Incx (M:X) = struct 
  let x = M.x + 1
end 
;;
module A = struct let x = 0 end
;;
A.x;;
module B = Incx (A) ;;

B.x;;

module C = Incx (B);;

C.x;;

module AddX (M : X) = struct
  let add y = M.x + y
end;;

module Add42 = AddX (struct let x = 42 end);;

Add42.add 1;;

module type Add = sig val add : int -> int end;;
module CheckAddX : X -> Add = AddX;;

module type T = sig
  type t
  val x : t
end;;

module Pair1 (M : T) = struct
  let p = (M.x, 1)
end;;

(* functor (M : T) -> sig val p : M.t * int end;; *)

module type P1 = functor (M : T) -> sig val p : M.t * int end;;

module Pair1 : P1 = functor (M : T) -> struct
  let p = (M.x, 1)
end;;

module P0 = Pair1 (struct type t = int let x = 0 end);;
module PA = Pair1 (struct type t = char let x = 'a' end);;