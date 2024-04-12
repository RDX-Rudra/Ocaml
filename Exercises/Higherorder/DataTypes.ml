let rec take n lst = if n<0 then [] else match lst with
|[] ->[]
|h::t->h:: take (n-1) lst;;
(* val take : int -> 'a list -> 'a list = <fun> *)
let a= [1;2;3;4;5;6;7;8;9];;
(* val a : int list = [1; 2; 3; 4; 5; 6; 7; 8; 9] *)
let rec take n lst = if n=0 then [] else match lst with
|[] ->[]
|h::t->h:: take (n-1) lst;;
(* val take : int -> 'a list -> 'a list = <fun> *)
let b = take 5 a;;
(* val b : int list = [1; 1; 1; 1; 1] *)
let rec take n lst = if n=0 then [] else match lst with
|[] ->[]
|h::t->h:: take (n-1) t;;
(* val take : int -> 'a list -> 'a list = <fun> *)
let b = take 5 a;;
(* val b : int list = [1; 2; 3; 4; 5] *)
(* let rec drop n lst = if List.length lst <n then [] else match n with
|0->lst
|h::t-> drop (n-1) t;; *)
(* Error: This pattern matches values of type 'a list
       but a pattern was expected which matches values of type int *)
(* let rec drop n lst = if List.length lst <n then [] else match n with
|0->[]
|h::t-> drop (n-1) t;; *)
(* Error: This pattern matches values of type 'a list
       but a pattern was expected which matches values of type int *)
let rec drop n lst = if n=0 then lst else match lst with
|[]->[]
|h::t-> drop (n-1) t;;
(* val drop : int -> 'a list -> 'a list = <fun> *)
let c = drop 3 a;;
(* val c : int list = [4; 5; 6; 7; 8; 9] *)
(* let rec drop_tail n lst acc = if n=0 then acc else match lst with
|[]->[]
|h::t-> drop_tail (n-1) t (acc::h);; *)
(* Error: This expression has type 'a list but an expression was expected of type
         'a
       The type variable 'a occurs inside 'a list *)
let rec drop_tail n lst acc = if n=0 then acc else match lst with
|[]->[]
|h::t-> drop_tail (n-1) t (h::acc);;
(* val drop_tail : int -> 'a list -> 'a list -> 'a list = <fun> *)
let rec take_tail n lst acc = if n=0 then acc else match lst with
|[]->[]
|h::t-> drop_tail (n-1) t (h::acc);;
(* val take_tail : int -> 'a list -> 'a list -> 'a list = <fun> *)
take_tail 5 a;;
(* - : int list -> int list = <fun> *)
let p = take_tail 5 a;;
(* val p : int list -> int list = <fun> *)
p;;
(* - : int list -> int list = <fun> *)
let rec take_tail n lst acc = if n=0 then acc else match lst with
|[]->[]
|h::t-> drop_tail (n-1) t (h::acc);;
(* val take_tail : int -> 'a list -> 'a list -> 'a list = <fun> *)
let take_new n lst = take_tail n lst [];;
(* val take_new : int -> 'a list -> 'a list = <fun> *)
(* take_new a;; *)
(* Error: This expression has type int list but an expression was expected of type
         int *)
take_new 5 a;;
(* - : int list = [5; 4; 3; 2; 1] *)
let take_new n lst = take_tail n lst [] |> List.rev;;
(* val take_new : int -> 'a list -> 'a list = <fun> *)
take_new 5 a;;
(* - : int list = [1; 2; 3; 4; 5] *)
(* lat dro_tail = drop;; *)
(* Error: Unbound value lat *)
let dro_tail = drop;;
(* val dro_tail : int -> 'a list -> 'a list = <fun> *)
let c = drop 3 a;;
(* val c : int list = [4; 5; 6; 7; 8; 9] *)
drop
;;
(* - : int -> 'a list -> 'a list = <fun> *)
let rec drop n lst = if n=0 then lst else match lst with
|[]->[]
|h::t-> drop (n-1) t;;
(* val drop : int -> 'a list -> 'a list = <fun> *)
let dro_tail = drop;;
(* val dro_tail : int -> 'a list -> 'a list = <fun> *)
let c = drop 3 a;;
(* val c : int list = [4; 5; 6; 7; 8; 9] *)
(* let rec is_unimodal = function
|[]->true
|h1::h2::h3::_->if h1>h2 then;; *)
(* Error: Syntax error *)
let rec from i j l =
  if i > j then l
  else from i (j - 1) (j :: l);;
(* val from : int -> int -> int list -> int list = <fun> *)
take_tail 3 a [];;
(* - : int list = [3; 2; 1] *)
(* let rec is_unimodal = function
|[]|[_]|[_,_]->true
|h1::h2::h3::_->if h1>h2 and h2>h3 then true
else if h1<h2 and h2<h3 then true else false;; *)
(* Error: Syntax error *)
let rec is_unimodal = function
|[]|[_]|[_,_]->true
|h1::h2::h3::_->if h1>h2 & h2>h3 then true
else if h1<h2 & h2<h3 then true else false;;
(* val is_unimodal : ('a * 'b) list -> bool = <fun> *)
let rec is_unimodal = function
|[]|[_]|[_;_]|[_;_;_]->true
|h1::h2::h3::_->if h1>h2 & h2>h3 then true
else if h1<h2 & h2<h3 then true else false;;
(* val is_unimodal : 'a list -> bool = <fun> *)
let rec is_unimodal = function
|[]|[_]|[_;_]|[_;_;_]->true
|h1::h2::h3::_->if h1>h2 && h2>h3 then true
else if h1<h2 && h2<h3 then true else false;;
(* val is_unimodal : 'a list -> bool = <fun> *)
let lst1 = [1;2;3;4;5;4;3;2;1];;
(* val lst1 : int list = [1; 2; 3; 4; 5; 4; 3; 2; 1] *)
let lst2 = [1;2;3;2;1;3;4;5];;
(* val lst2 : int list = [1; 2; 3; 2; 1; 3; 4; 5] *)
is_unimodal lst1;;
(* - : bool = true *)
is_unimodal lst2;;
(* - : bool = true *)
(* let powerset lst =
let rec helper lst acc = match lst with 
|[]->[]
|h::t-> helper t ((acc::h)::h);; *)
(* Error: Syntax error *)
(* let powerset lst =
let rec helper lst acc = match lst with 
|[]->acc
|h::t-> helper t [[acc::h]::h]
in helper lst [[]];; *)
(* Error: This expression has type 'a list list list list
       but an expression was expected of type 'a
       The type variable 'a occurs inside 'a list list list list *)
(* let powerset lst =
let rec helper lst acc = match lst with 
|[]->acc
|h::t-> helper t [[acc::h]::[h]]
in helper lst [[]];; *)
(* Error: This expression has type 'a list list list list
       but an expression was expected of type 'a
       The type variable 'a occurs inside 'a list list list list *)
(* let powerset lst =
let rec helper lst acc = match lst with 
|[]->acc
|h::t-> helper t [acc::h]::[h]
in helper lst [];; *)
(* Error: This expression has type 'a list list
       but an expression was expected of type 'a
       The type variable 'a occurs inside 'a list list *)
(* let powerset lst =
let rec helper lst acc = match lst with 
|[]->acc
|h::t-> helper t (acc::h)::[h]
in helper lst [[]];; *)
(* Error: This expression has type 'a list but an expression was expected of type
         'a
       The type variable 'a occurs inside 'a list *)
(* let powerset lst =
let rec helper lst acc = match lst with 
|[]->acc
|h::t-> helper t [acc::h]@[h]
in helper lst [];; *)
(* Error: This expression has type 'a list list
       but an expression was expected of type 'a
       The type variable 'a occurs inside 'a list list *)
let rec powerset = function
|[]->[]
|h::t->let p = powerset t in List.map (List.cons h) p@p;;
(* val powerset : 'a list -> 'a list list = <fun> *)
List.cons;;
(* - : 'a -> 'a list -> 'a list = <fun> *)
type poketype = Normal | Fire | Water;;
(* type poketype = Normal | Fire | Water *)
type pokemon = {name: string; hp:int; ptype: poketype};;
(* type pokemon = { name : string; hp : int; ptype : poketype; } *)
(* let charizard = {name= charizard; hp=78; ptype=Fire};; *)
(* Error: Unbound value charizard *)
let charizard = {name= "charizard"; hp=78; ptype=Fire};;
(* val charizard : pokemon = {name = "charizard"; hp = 78; ptype = Fire} *)
let squirtle = {name= "sqirtle"; hp=44; ptype=Water};;
(* val squirtle : pokemon = {name = "sqirtle"; hp = 44; ptype = Water} *)
let self_hd = function
|[]-> None
|h::t->Some h;;
(* val self_hd : 'a list -> 'a option = <fun> *)
let safe_tl = function
| []->None
|h::t->Some t;;
(* val safe_tl : 'a list -> 'a list option = <fun> *)
(* let max_hp = function
|[]->None
|h::t->Some(max (h, max_hp t));; *)
(* Error: Unbound value max_hp
Hint: If this is a recursive definition,
you should add the 'rec' keyword on line 1 *)
(* let rec max_hp = function
|[]->None
|h::t->Some(max (h, max_hp t));; *)
(* Error: This expression has type 'a * 'b option -> 'a * 'b option
       but an expression was expected of type 'b
       The type variable 'b occurs inside 'a * 'b option -> 'a * 'b option *)
(* let rec max_hp = function
|[]->None
|h::t->max (Some h, max_hp t);; *)
(* Error: This expression has type 'a option * 'b option -> 'a option * 'b option
       but an expression was expected of type 'b option *)
(* let rec max_hp = function
|[]->None
|h::t->max (Some h.hp, max_hp t);; *)
(* Error: This expression has type
         int option * 'a option -> int option * 'a option
       but an expression was expected of type 'a option *)
max;;
(* - : 'a -> 'a -> 'a = <fun> *)
max(Some 1, Some 2);;
(* - : int option * int option -> int option * int option = <fun> *)
max(1, 2);;
(* - : int * int -> int * int = <fun> *)
(* let rec max_hp = function
|[]->None
|h::t->begin
match max_hp t with
|None->Some h
|Some h1-> if h1>h then Some h1 else h;; *)
(* Error: Syntax error: 'end' expected, the highlighted 'begin' might be unmatched *)
(* let rec max_hp = function
|[]->None
|h::t->begin
match max_hp t with
|None->Some h
|Some h1-> if h1>h then Some h1 else h
end;; *)
(* Error: This expression has type 'a but an expression was expected of type
         'a option
       The type variable 'a occurs inside 'a option *)
let rec max_hp = function
|[]->None
|h::t->begin
match max_hp t with
|None->Some h
|Some h1-> if h1>h then Some h1 else Some h
end;;
(* val max_hp : 'a list -> 'a option = <fun> *)
type date = int * int* int;;
(* type date = int * int * int *)
(* let date_before p n = 
let p = (year1, month1, day1) in
let n = (year2, month2, day2)in
if year1<year2 then true
else if month1<month2 then true
else if day1<day2 then true
else false;; *)
(* Error: Unbound value year1 *)
let date_before p n = 
let (year1, month1, day1) = p in
let (year2, month2, day2) = p in
if year1<year2 then true
else if month1<month2 then true
else if day1<day2 then true
else false;;
(* val date_before : 'a * 'b * 'c -> 'd -> bool = <fun> *)
let date_before p n = 
if p.(0)<n.(0) then true
else if p.(1)<n.(1) then true
else if p.(2)<n.(2) then true
else false;;
(* val date_before : 'a array -> 'a array -> bool = <fun> *)
let date_before p n = 
let (year1, month1, day1) = p in
let (year2, month2, day2) = n in
if year1<year2 then true
else if month1<month2 then true
else if day1<day2 then true
else false;;
(* val date_before : 'a * 'b * 'c -> 'a * 'b * 'c -> bool = <fun> *)
(* date1 = (2003, 9, 1);; *)
(* Error: Unbound value date1 *)
let date1 = (2003, 9, 1);;
(* val date1 : int * int * int = (2003, 9, 1) *)
let date2 = (2003, 9, 5);;
(* val date2 : int * int * int = (2003, 9, 5) *)
(* let date_before1 (p: int * int * int) (n: int* int* int) = 
if p.(0)<n.(0) then true
else if p.(1)<n.(1) then true
else if p.(2)<n.(2) then true
else false;; *)
(* Error: This expression has type int * int * int
       but an expression was expected of type 'a array *)
date_before date1 date2;;
(* - : bool = true *)
(* let rec earliest = function
|[]->None
|h::t->begin
match max_hp t with
|None->Some h
|Some h1-> if date_before h1 h = = true then Some h1 else h
end;; *)
(* Error: Syntax error *)
(* let rec earliest = function
|[]->None
|h::t->begin
match earliest t with
|None->Some h
|Some h1-> if date_before h1 h = = true then Some h1 else h
end;; *)
(* Error: Syntax error *)
(* let rec earliest = function
|[]->None
|h::t->begin
match earliest t with
|None->Some h
|Some h1-> if date_before h1 h = = true then Some h1 else Some h
end;; *)
(* Error: Syntax error *)
let rec earliest = function
  | [] -> None
  | h :: t ->
    begin
      match earliest t with
      | None -> Some h
      | Some h1 -> if date_before h1 h then Some h1 else Some h
    end
;;
(* val earliest : ('a * 'b * 'c) list -> ('a * 'b * 'c) option = <fun> *)
let rec earliest = function
|[]->None
|h::t->begin
match earliest t with
|None->Some h
|Some h1-> if date_before h1 h = true then Some h1 else Some h
end;;
(* val earliest : ('a * 'b * 'c) list -> ('a * 'b * 'c) option = <fun> *)
type suit = Clubs | Diamonds | Hearts | Spades ;;
(* type suit = Clubs | Diamonds | Hearts | Spades *)
type rank = Jack | Queen | King | Ace | Num of int ;;
(* type rank = Jack | Queen | King | Ace | Num of int *)
type card = suit * rank ;;
(* type card = suit * rank *)
let ace_of_clubs = (Clubs, Ace);;
(* val ace_of_clubs : suit * rank = (Clubs, Ace) *)
(* let Queen_of_Hearts = (Hearts, Queen);; *)
(* Error: Unbound constructor Queen_of_Hearts *)
let queen_of_Hearts = (Hearts, Queen);;
(* val queen_of_Hearts : suit * rank = (Hearts, Queen) *)
