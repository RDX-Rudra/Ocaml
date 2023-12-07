type suit = Clubs | Diamonds | Hearts | Spades
type rank = Jack | Queen | King | Ace | Num of int
type card = suit * rank
type color = Red | Black
type move = Discard of card | Draw
exception IllegalMove
exception CardNotFound
val card_color : suit * 'a -> color
val card_value : 'a * rank -> int
val remove_card : 'a list -> 'a -> exn -> 'a list
val all_same_color : (suit * 'a) list -> bool
val sum_cards : ('a * rank) list -> int
val clist : (suit * rank) list
val c1 : suit * rank
val score : (suit * rank) list -> int -> int
