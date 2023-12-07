let add x y = x+y;;
add 5 8;;

let addx x = fun y -> x + y;;
let add5 = addx 5;;
add5 8;;