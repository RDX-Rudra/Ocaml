let x = ref 0;;
(* val x : int ref = {contents = 0} *)
!x;;
(* - : int = 0 *)
let x = ref 0;;
(* val x : int ref = {contents = 0} *)
x := 1;;
(* - : unit = () *)
!x;;
(* - : int = 1 *)
let x = ref 42;;
(* val x : int ref = {contents = 42} *)
let y = ref 42;;
(* val y : int ref = {contents = 42} *)
let z = x;;
(* val z : int ref = {contents = 42} *)
x := 43;;
(* - : unit = () *)
let w = !y + !z;;
(* val w : int = 85 *)
let counter = ref 0

let next_val =
  fun () ->
    counter := !counter + 1;
    !counter;;
(* val counter : int ref = {contents = 0}
val next_val : unit -> int = <fun> *)
next_val ();;
(* - : int = 1 *)
next_val ();;
(* - : int = 2 *)
let add_list l1 l2 = if List.length l1 <> List.length l2 then failwith " nerrror" else List.map2 (fun x y->x+y )l1 l2;;
(* val add_list : int list -> int list -> int list = <fun> *)
let mat_add m1 m2 = if List.length m1<> List.length m2 then failwith "iuerih" else List.map2 (fun x y -> x+y) m1 m2;;
(* val mat_add : int list -> int list -> int list = <fun> *)
(* let mat_add m1 m2 = if List.length m1<> List.length m2 then failwith "iuerih" else List.map2 (mat_add x y -> x+y) m1 m2;; *)
(* Error: Syntax error: ')' expected, the highlighted '(' might be unmatched *)
(* let mat_add m1 m2 = if List.length m1<> List.length m2 then failwith "iuerih" else List.map2 (mat_add x y) m1 m2;; *)
(* Error: This expression has type int ref but an expression was expected of type
         int list *)
let mat_add m1 m2 = if List.length m1<> List.length m2 then failwith "iuerih" else List.map2 (fun x y -> mat_add x y) m1 m2;;
(* val mat_add : int list list -> int list list -> int list list = <fun> *)
let next_val_broken = fun () ->
  let counter = ref 0 in
  incr counter;
  !counter;;
(* val next_val_broken : unit -> int = <fun> *)
next_val_broken ();;
(* - : int = 1 *)
next_val_broken ();;
(* - : int = 1 *)
next_val_broken ();;
(* - : int = 1 *)
(* mat_add [[1.0; 2;0]] [[1.0; 2.0]];; *)
(* Error: This expression has type float but an expression was expected of type
         int *)
module type Matrix = sig
  type t
  val add : t -> t -> t
end;;
(* module type Matrix = sig type t val add : t -> t -> t end *)
(* module MatrixAdd (M : Matrix) = struct
  type t = M.t List List
let matrix_add a b=
let add_list l1 l2 = if List.length l1 <> List.length l2 then failwith " nerrror" else List.map2 (fun x y->add x y )l1 l2 in
let mat_add m1 m2 = if List.length m1<> List.length m2 then failwith "iuerih" else List.map2 (fun x y -> add_list x y) m1 m2
end;; *)
(* Error: Syntax error *)
(* module MatrixAdd (M : Matrix) = struct
  type t = M.t List List
let matrix_add a b=
let add_list l1 l2 = if List.length l1 <> List.length l2 then failwith " nerrror" else List.map2 (fun x y->add x y )l1 l2
end;; *)
(* Error: Syntax error *)
(* module MatrixAdd (M : Matrix) = struct
  type t = M.t List List
let matrix_add a b=
let add_list l1 l2 = if List.length l1 <> List.length l2 then failwith " nerrror" else List.map2 (fun x y->add x y )l1 l2 in
let mat_add m1 m2 = if List.length m1<> List.length m2 then failwith "iuerih" else List.map2 (fun x y -> add_list x y) m1 m2 in
end;; *)
(* Error: Syntax error *)
(* module MatrixAdd (M : Matrix) = struct
  type t = M.t List List
let matrix_add a b=
let add_list l1 l2 = if List.length l1 <> List.length l2 then failwith " nerrror" else List.map2 (fun x y->add x y )l1 l2 in
let mat_add m1 m2 = if List.length m1<> List.length m2 then failwith "iuerih" else List.map2 (fun x y -> add_list x y) m1 m2 in
mat_add a b
end;; *)
(* Error: Syntax error *)
(* module MatrixAdd (M : Matrix) = struct
  type t = M.t List List
let matrix_add a b=
let add_list l1 l2 = if List.length l1 <> List.length l2 then failwith " nerrror" else List.map2 (fun x y->add x y )l1 l2 in
add_list a b
end;; *)
(* Error: Syntax error *)
(* module MatrixAdd (M : Matrix) = struct
  type t = M.t List List
let add_list l1 l2 = if List.length l1 <> List.length l2 then failwith " nerrror" else List.map2 (fun x y->add x y )l1 l2
end;; *)
(* Error: Syntax error *)
(* module MatrixAdd (M : Matrix) = struct
  type t = M.t List List
let add_list l1 l2 = if List.length l1 <> List.length l2 then failwith " nerrror" else List.map2 (fun x y->M.add x y )l1 l2
end;; *)
(* Error: Syntax error *)
module MatrixAdd (M : Matrix) = struct
let add_list l1 l2 = if List.length l1 <> List.length l2 then failwith " nerrror" else List.map2 (fun x y->M.add x y )l1 l2
end;;
(* module MatrixAdd :
  functor (M : Matrix) ->
    sig val add_list : M.t list -> M.t list -> M.t list end *)
module MatrixAdd (M : Matrix) = struct
let matrix_add a b=
let add_list l1 l2 = if List.length l1 <> List.length l2 then failwith " nerrror" else List.map2 (fun x y->M.add x y )l1 l2 in
let mat_add m1 m2 = if List.length m1<> List.length m2 then failwith "iuerih" else List.map2 (fun x y -> add_list x y) m1 m2 in
mat_add a b
end;;
(* module MatrixAdd :
  functor (M : Matrix) ->
    sig val matrix_add : M.t list list -> M.t list list -> M.t list list end *)
module IntMatrix : Matrix = struct
  type t = int
  let add a b = a + b
end;;
(* module IntMatrix : Matrix *)
module IntMatrixAdd = MatrixAdd(IntMatrix);;
(* module IntMatrixAdd :
  sig
    val matrix_add :
      IntMatrix.t list list -> IntMatrix.t list list -> IntMatrix.t list list
  end *)
(* IntMatrixAdd.matrix_add [[1;2;3]] [[3;4;5]];; *)
(* Error: This expression has type int but an expression was expected of type
         IntMatrix.t *)
(* IntMatrixAdd.matrix_add [[1;2];[3;4]] [[5;6];[7;8]];; *)
(* Error: This expression has type int but an expression was expected of type
         IntMatrix.t *)
module IntMatrix : Matrix with type t = int = struct
  type t = int
  let add a b = a + b
end

module FloatMatrix : Matrix with type t = float = struct
  type t = float
  let add a b = a +. b
end

module StringMatrix : Matrix with type t = string = struct
  type t = string
  let add a b = a ^ b
end

module IntMatrixAdd = MatrixAdd(IntMatrix)
module FloatMatrixAdd = MatrixAdd(FloatMatrix)
module StringMatrixAdd = MatrixAdd(StringMatrix);;
(* module IntMatrix : sig type t = int val add : t -> t -> t end
module FloatMatrix : sig type t = float val add : t -> t -> t end
module StringMatrix : sig type t = string val add : t -> t -> t end
module IntMatrixAdd :
  sig val matrix_add : int list list -> int list list -> int list list end
module FloatMatrixAdd :
  sig
    val matrix_add : float list list -> float list list -> float list list
  end
module StringMatrixAdd :
  sig
    val matrix_add : string list list -> string list list -> string list list
  end *)
IntMatrixAdd.matrix_add [[1;2];[3;4]] [[5;6];[7;8]];;
(* - : int list list = [[6; 8]; [10; 12]] *)
