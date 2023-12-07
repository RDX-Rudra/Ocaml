type suit = Clubs | Diamonds | Hearts | Spades ;;
type rank = Jack | Queen | King | Ace | Num of int ;;
type card = suit * rank ;;
type color = Red | Black ;;
type move = Discard of card | Draw ;;
exception IllegalMove ;;
exception CardNotFound ;;
exception GameOver ;;

let card_color card = match card with
	|Diamonds,_ | Hearts,_-> Red
	|Spades,_ | Clubs,_-> Black
;;	
let card_value card = match card with
	| _,Num n -> n
	| _,Ace -> 11
	| _-> 10 ;;
	
let rec remove_card cs c e = match cs with
	|[]->raise e
	|h::t->if h = c then t else h::(remove_card t c e)
;;
let rec all_same_color cs = match cs with
	|[]->true
	|[card]->true
	|h1::h2::t-> (card_color h1 = card_color h2) && all_same_color (h2::t)
;;
let sum_cards cs = let rec helper cs acc = match cs with
	|[]->acc
	|h::t-> helper t (acc + card_value h) in helper cs 0
;;	
let clist = [(Spades,Ace);(Clubs,King);(Clubs, (Num 5))] ;;
let clist1 = [(Spades,Ace);(Clubs,King);(Diamonds, (Num 5))];;
let c1 = (Clubs,King);;

let score cs goal = if sum_cards cs > goal then
	if all_same_color cs then (3*(sum_cards cs - goal))
	else ((3*(sum_cards cs - goal))/2) 
else (goal - sum_cards cs);;

let take (c1: card list) (m1:card list) : card list = match c1 with
| []->m1
| h::t -> h :: m1 
;;
let officiate (tc1: card list) (mc1:card list) goal = match tc1 with
	|[]-> score mc1 goal
	| h::t-> 
