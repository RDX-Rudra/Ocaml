module type Fraction = sig
  (* A fraction is a rational number p/q, where q != 0.*)
  type t

  (** [make n d] is n/d. Requires d != 0. *)
  val make : int -> int -> t

  val numerator : t -> int
  val denominator : t -> int
  val to_string : t -> string
  val to_float : t -> float

  val add : t -> t -> t
  val mul : t -> t -> t
end;;
(* module type Fraction =
  sig
    type t
    val make : int -> int -> t
    val numerator : t -> int
    val denominator : t -> int
    val to_string : t -> string
    val to_float : t -> float
    val add : t -> t -> t
    val mul : t -> t -> t
  end *)
(* module Fraction : Fraction = struct
type t = int * int
let make n d = assert(d != 0); (n, d)
let numerator (n, d) = n
let denominatir (n, d) = d
let to_string (n, d)=
string_of_int n^ " / "^ string_of_int d
let to_float (n, d) = float_of_int n /. float_of_int d
let add (n1, d1) (n2, d2) = (n1+n2, d1+d2)
val mul (n1, d1) (n2, d2) = (n1*n2, d1*d2)
end;; *)
(* Error: Syntax error *)
(* module Fraction : Fraction = struct
type t = int * int
let make n d = assert(d != 0); (n, d)
let numerator (n, d) = n
let denominator (n, d) = d
let to_string (n, d)=
string_of_int n^ " / "^ string_of_int d
let to_float (n, d) = float_of_int n /. float_of_int d
let add (n1, d1) (n2, d2) = (n1+n2, d1+d2)
val mul (n1, d1) (n2, d2) = (n1*n2, d1*d2)
end;; *)
(* Error: Syntax error *)
(* module Fraction : Fraction = struct
type t = int * int
let make n d = assert(d != 0); (n, d)
let numerator (n, d) = n
let denominator (n, d) = d
let to_string (n, d)=
string_of_int n ^ " / " ^ string_of_int d
let to_float (n, d) = float_of_int n /. float_of_int d
let add (n1, d1) (n2, d2) = (n1+n2, d1+d2)
val mul (n1, d1) (n2, d2) = (n1*n2, d1*d2)
end;; *)
(* Error: Syntax error *)
module Fraction :Fraction = struct
type t = int * int
let make n d = assert(d!=0); (n,d)
let numerator (n,d) = n
let denominator (n,d) = d
let to_string (n,d) = string_of_int n ^"/"^ string_of_int d
let to_float (n,d) = float_of_int n  /. float_of_int d
let add (n1,d1) (n2,d2) = (n1+n2,d1+d2)
let mul (n1,d1) (n2,d2) = (n1*n2,d1*d2)
end;;
(* module Fraction : Fraction *)
(* module Fraction : Fraction = struct
type t = int * int
let make n d = assert(d != 0); (n, d)
let numerator (n,d) = n
let denominator (n,d) = d
let to_string (n,d)=
string_of_int n ^ " / " ^ string_of_int d
let to_float (n,d) = float_of_int n /. float_of_int d
let add (n1,d1) (n2,d2) = (n1+n2,d1+d2)
val mul (n1,d1) (n2,d2) = (n1*n2,d1*d2)
end;; *)
(* Error: Syntax error *)
module PairFraction = struct
  type t = int * int
  let make n d =
    assert (d != 0);
    (n,d)
  let numerator (n,d) = n
  let denominator (n,d) = d
  let to_string (n,d) =
    string_of_int n ^ " / " ^ string_of_int d
  let to_float (n,d) =
    float_of_int n /. float_of_int d
  let add (n1,d1) (n2,d2) =
    let d' = d1 * d2 in
    (n1 * d2 + n2 * d1, d')
  let mul (n1,d1) (n2,d2) =
    (n1 * n2, d1 * d2)
end;;
(* module PairFraction :
  sig
    type t = int * int
    val make : 'a -> int -> 'a * int
    val numerator : 'a * 'b -> 'a
    val denominator : 'a * 'b -> 'b
    val to_string : int * int -> string
    val to_float : int * int -> float
    val add : int * int -> int * int -> int * int
    val mul : int * int -> int * int -> int * int
  end *)
module PairFraction: Fraction = struct
  type t = int * int
  let make n d =
    assert (d != 0);
    (n,d)
  let numerator (n,d) = n
  let denominator (n,d) = d
  let to_string (n,d) =
    string_of_int n ^ " / " ^ string_of_int d
  let to_float (n,d) =
    float_of_int n /. float_of_int d
  let add (n1,d1) (n2,d2) =
    let d' = d1 * d2 in
    (n1 * d2 + n2 * d1, d')
  let mul (n1,d1) (n2,d2) =
    (n1 * n2, d1 * d2)
end;;
(* module PairFraction : Fraction *)
module PairFraction: Fraction = struct
  type t = int * int
  let make n d =
    assert (d != 0);
    (n,d)
  let numerator (n,d) = n
  let denominator (n,d) = d
  let to_string (n,d) =
    string_of_int n ^ " / " ^ string_of_int d
  let to_float (n,d) =
    float_of_int n /. float_of_int d
  let add (n1,d1) (n2,d2) =
    let d' = d1 * d2 in
    (n1 * d2 + n2 * d1, d')
  let mul (n1,d1) (n2,d2) =
    (n1 * n2, d1 * d2)
end;;
(* module PairFraction : Fraction *)
(* module PairFraction: Fraction = struct
  type t = int * int
  let make n d =
    assert (d != 0);
    (n,d)
  let numerator (n,d) = n
  let denominator (n,d) = d
  let to_string (n,d) =
    string_of_int n ^ " / " ^ string_of_int d
  let to_float (n,d) =
    float_of_int n /. float_of_int d
  let add (n1,d1) (n2,d2) =
   let rec gcd a b =
  if b = 0 then a
  else gcd b (a mod b) in
    let d' = (d1 * d2) / (gcd a b) in
    (n1 * d2 + n2 * d1, d')
  let mul (n1,d1) (n2,d2) =
    (n1 * n2, d1 * d2)
end;; *)
(* Error: Unbound value a *)
module PairFraction: Fraction = struct
  type t = int * int
  let make n d =
    assert (d != 0);
    (n,d)
  let numerator (n,d) = n
  let denominator (n,d) = d
  let to_string (n,d) =
    string_of_int n ^ " / " ^ string_of_int d
  let to_float (n,d) =
    float_of_int n /. float_of_int d
  let add (n1,d1) (n2,d2) =
   let rec gcd a b =
  if b = 0 then a
  else gcd b (a mod b) in
    let d' = (d1 * d2) / (gcd d1 d2) in
    (n1 * d2 + n2 * d1, d')
  let mul (n1,d1) (n2,d2) =
    (n1 * n2, d1 * d2)
end;;
(* module PairFraction : Fraction *)
(* module PairFraction: Fraction = struct
  type t = int * int
  let make n d =
    assert (d != 0);
    (n,d)
  let numerator (n,d) = n
  let denominator (n,d) = d
  let to_string (n,d) =
    string_of_int n ^ " / " ^ string_of_int d
  let to_float (n,d) =
    float_of_int n /. float_of_int d
  let rec gcd a b =
  if b = 0 then a
  else gcd b (a mod b)
  let add (n1,d1) (n2,d2) =
    let d' = (d1 * d2) / (gcd d1 d2) in
    (n1 * d2 + n2 * d1, d')
  let mul (n1,d1) (n2,d2) =
    (n1 * n2 / ged (n1*n2) (d1*d2), d1 * d2 / ged (n1*n2) (d1*d2))
end;; *)
(* Error: Unbound value ged
Hint: Did you mean gcd? *)
module PairFraction: Fraction = struct
  type t = int * int
  let make n d =
    assert (d != 0);
    (n,d)
  let numerator (n,d) = n
  let denominator (n,d) = d
  let to_string (n,d) =
    string_of_int n ^ " / " ^ string_of_int d
  let to_float (n,d) =
    float_of_int n /. float_of_int d
  let rec gcd a b =
  if b = 0 then a
  else gcd b (a mod b)
  let add (n1,d1) (n2,d2) =
    let d' = (d1 * d2) / (gcd d1 d2) in
    (n1 * d2 + n2 * d1, d')
  let mul (n1,d1) (n2,d2) =
    (n1 * n2 / gcd (n1*n2) (d1*d2), d1 * d2 / gcd (n1*n2) (d1*d2))
end;;
(* module PairFraction : Fraction *)
let rec gcd a b =
  if b = 0 then a
  else gcd b (a mod b)
  let add (n1,d1) (n2,d2) =
    let d' = (d1 * d2) / (gcd d1 d2) in
    (n1 * d2 + n2 * d1, d');;
(* val gcd : int -> int -> int = <fun>
val add : int * int -> int * int -> int * int = <fun> *)
add (5, 12) (5, 12);;
(* - : int * int = (120, 12) *)
let rec gcd a b =
  if b = 0 then a
  else gcd b (a mod b)
  let add (n1,d1) (n2,d2) =
    let d' = (d1 * d2) / (gcd d1 d2) in
    ((n1 * d2 + n2 * d1) / (gcd d1 d2), d');;
(* val gcd : int -> int -> int = <fun>
val add : int * int -> int * int -> int * int = <fun> *)
add (5, 12) (5, 12);;
(* - : int * int = (10, 12) *)
(* module PairFraction: Fraction = struct
  type t = int * int
  let make n d =
    assert (d != 0);
    (n,d)
  let numerator (n,d) = n
  let denominator (n,d) = d
  let to_string (n,d) =
    string_of_int n ^ " / " ^ string_of_int d
  let to_float (n,d) =
    float_of_int n /. float_of_int d
  let rec gcd a b =
  let mul (n1,d1) (n2,d2) =
    (n1 * n2 / gcd (n1*n2) (d1*d2), d1 * d2 / gcd (n1*n2) (d1*d2))
end;; *)
(* Error: Syntax error *)
module PairFraction: Fraction = struct
  type t = int * int
  let make n d =
    assert (d != 0);
    (n,d)
  let numerator (n,d) = n
  let denominator (n,d) = d
  let to_string (n,d) =
    string_of_int n ^ " / " ^ string_of_int d
  let to_float (n,d) =
    float_of_int n /. float_of_int d
  let rec gcd a b =
  if b = 0 then a
  else gcd b (a mod b)
  let add (n1,d1) (n2,d2) =
    let d' = (d1 * d2) / (gcd d1 d2) in
    ((n1 * d2 + n2 * d1) / (gcd d1 d2), d')
  let mul (n1,d1) (n2,d2) =
    (n1 * n2 / gcd (n1*n2) (d1*d2), d1 * d2 / gcd (n1*n2) (d1*d2))
end;;
(* module PairFraction : Fraction *)
let rec gcd a b =
  if b = 0 then a
  else gcd b (a mod b)
  let add (n1,d1) (n2,d2) =
    let d' = (d1 * d2) / (gcd d1 d2) in
    ((n1 * d2 + n2 * d1) / (gcd d1 d2), d')
  let mul (n1,d1) (n2,d2) =
    (n1 * n2 / gcd (n1*n2) (d1*d2), d1 * d2 / gcd (n1*n2) (d1*d2));;
(* val gcd : int -> int -> int = <fun>
val add : int * int -> int * int -> int * int = <fun>
val mul : int * int -> int * int -> int * int = <fun> *)
add (5, 12) (5, 12);;
(* - : int * int = (10, 12) *)
add (4, 3) (3, 4);;
(* - : int * int = (25, 12) *)
module PairFraction: Fraction = struct
  type t = int * int
  let make n d =
    assert (d != 0);
    (n,d)
  let numerator (n,d) = n
  let denominator (n,d) = d
  let to_string (n,d) =
    string_of_int n ^ " / " ^ string_of_int d
  let to_float (n,d) =
    float_of_int n /. float_of_int d
  let rec gcd a b =
  if b = 0 then a
  else gcd b (a mod b)
  let add (n1,d1) (n2,d2) =
   let rec gcd a b =
  if b = 0 then a
  else gcd b (a mod b) in
    let n'=(n1*d2+n2*d1)/(gcd (n1*d2+n2*d1) (d1 * d2)) in
    let d' = (d1 * d2) / (gcd (n1*d2+n2*d1) (d1 * d2)) in
    (n', d')
  let mul (n1,d1) (n2,d2) =
    (n1 * n2 / gcd (n1*n2) (d1*d2), d1 * d2 / gcd (n1*n2) (d1*d2))
end;;
(* module PairFraction : Fraction *)
(* PairFraction.add (5, 12) (5, 12);; *)
(* Error: This expression has type 'a * 'b but an expression was expected of type
         PairFraction.t *)
(* let a:PairFraction.t = (5, 12);; *)
(* Error: This expression has type 'a * 'b but an expression was expected of type
         PairFraction.t *)
open PairFraction;;
let a = (5, 12);;
(* val a : int * int = (5, 12) *)
let b = (5, 12);;
(* val b : int * int = (5, 12) *)
(* add (5, 12) (5, 12);; *)
(* Error: This expression has type 'a * 'b but an expression was expected of type
         t *)
(* let a:t = (5, 12);; *)
(* Error: This expression has type 'a * 'b but an expression was expected of type
         t *)
PairFraction.make 2 3;;
(* - : t = <abstr> *)
let a = PairFraction.make 2 3;;
(* val a : t = <abstr> *)
let a = PairFraction.make 4 5;;
(* val a : t = <abstr> *)
let b = PairFraction.make 2 3;;
(* val b : t = <abstr> *)
PairFraction.add a b;;
(* - : t = <abstr> *)
let c = PairFraction.add a b;;
(* val c : t = <abstr> *)
c;;
(* - : t = <abstr> *)
(* print_int c;; *)
(* Error: This expression has type t but an expression was expected of type int *)
(* module print (PairFraction: Fraction) = struct 
let print t = 
let (a, b) = t in
print_int a; 
print_endline;
print_int b
end
;; *)
(* Error: Syntax error *)
(* module print (PairFraction: Fraction) = struct 
let print t = 
let (a, b) = t in
print_int a 
print_endline
print_int b
end
;; *)
(* Error: Syntax error *)
to_float c;;
(* - : float = 1.4666666666666666 *)
to_string c;;
(* - : string = "22 / 15" *)
type date = {month : int; day : int};;
(* type date = { month : int; day : int; } *)
(* Map.Make;; *)
(* Error: Unbound constructor Map.Make *)
module Date = struct
  type t = date

  let compare d1 d2 =
    if d1.month = d2.month then d1.day - d2.day
    else d1.month - d2.month
end;;
(* module Date : sig type t = date val compare : t -> t -> int end *)
module DateMap = Map.Make (Date);;
(* module DateMap :
  sig
    type key = date
    type 'a t = 'a Map.Make(Date).t
    val empty : 'a t
    val is_empty : 'a t -> bool
    val mem : key -> 'a t -> bool
    val add : key -> 'a -> 'a t -> 'a t
    val update : key -> ('a option -> 'a option) -> 'a t -> 'a t
    val singleton : key -> 'a -> 'a t
    val remove : key -> 'a t -> 'a t
    val merge :
      (key -> 'a option -> 'b option -> 'c option) -> 'a t -> 'b t -> 'c t
    val union : (key -> 'a -> 'a -> 'a option) -> 'a t -> 'a t -> 'a t
    val compare : ('a -> 'a -> int) -> 'a t -> 'a t -> int
    val equal : ('a -> 'a -> bool) -> 'a t -> 'a t -> bool
    val iter : (key -> 'a -> unit) -> 'a t -> unit
    val fold : (key -> 'a -> 'b -> 'b) -> 'a t -> 'b -> 'b
    val for_all : (key -> 'a -> bool) -> 'a t -> bool
    val exists : (key -> 'a -> bool) -> 'a t -> bool
    val filter : (key -> 'a -> bool) -> 'a t -> 'a t
    val filter_map : (key -> 'a -> 'b option) -> 'a t -> 'b t
    val partition : (key -> 'a -> bool) -> 'a t -> 'a t * 'a t
    val cardinal : 'a t -> int
    val bindings : 'a t -> (key * 'a) list
    val min_binding : 'a t -> key * 'a
    val min_binding_opt : 'a t -> (key * 'a) option
    val max_binding : 'a t -> key * 'a
    val max_binding_opt : 'a t -> (key * 'a) option
    val choose : 'a t -> key * 'a
    val choose_opt : 'a t -> (key * 'a) option
    val split : key -> 'a t -> 'a t * 'a option * 'a t
    val find : key -> 'a t -> 'a
    val find_opt : key -> 'a t -> 'a option
    val find_first : (key -> bool) -> 'a t -> key * 'a
    val find_first_opt : (key -> bool) -> 'a t -> (key * 'a) option
    val find_last : (key -> bool) -> 'a t -> key * 'a
    val find_last_opt : (key -> bool) -> 'a t -> (key * 'a) option
    val map : ('a -> 'b) -> 'a t -> 'b t
    val mapi : (key -> 'a -> 'b) -> 'a t -> 'b t
    val to_seq : 'a t -> (key * 'a) Seq.t
    val to_rev_seq : 'a t -> (key * 'a) Seq.t
    val to_seq_from : key -> 'a t -> (key * 'a) Seq.t
    val add_seq : (key * 'a) Seq.t -> 'a t -> 'a t
    val of_seq : (key * 'a) Seq.t -> 'a t
  end *)
