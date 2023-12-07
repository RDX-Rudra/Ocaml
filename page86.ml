type day = Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday;;

let next_weekday d = failwith "Unimplemented";;

let tests = "test suite for next_weekday" >::: [
"tue_after_mon" >:: (fun _ -> assert_equal Tuesday (next_weekday Monday));
];;