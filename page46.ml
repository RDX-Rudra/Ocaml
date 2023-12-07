String.sub
let f ~name1:arg1 ~name2:arg2 = arg1 +arg2;;
f ~name1:2 ~name2:3;;
let f ~name1:name1 ~name2:name2 = name1+ name2;;
let f ~name1 ~name2 = name1 + name2;;
let f ?name:(arg1=8) arg2 = arg1 + arg2;;
f 7;;
f ~name: 2 7;;
