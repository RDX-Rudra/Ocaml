type ptype = TNormal | TFire | TWater;;

type mon = {name : string; hp : int; ptype: ptype};;

{name = "Rudra"; hp = 20; ptype = TFire};;
let c = {name = "Rudra"; hp = 20; ptype = TFire};;

c.hp;;
c.name;;

