let inc x = x+1;;
let square x = x*x;;
square (inc 5);;
5 |> inc |> square;;
5 |> inc |> square |> inc |> inc |> square;;
square (inc (inc (square (inc 5))));;
let id_int (x : int): int = x;;