(* test_matrix.ml *)

open OUnit2
open Matrix

(* Test case for a valid matrix file *)
let test_valid_matrix_file _ =
  let file_content = [| "0 1"; "1 0 1"; "4 0 1"; "7 0 1" |] in
  let expected_output = "Starting position: 0, 1\nMatrix:\n1 0 1 \n4 0 1 \n7 0 1 \nPosition found: (2, 1)\n" in
  let output = ref "" in
  let _ = Printf.printf := (fun fmt s -> output := !output ^ s) in (* Redirect Printf.printf *)
  mat_run file_content;
  assert_equal ~msg:"Valid matrix file test" ~printer:(fun x -> x) expected_output !output

(* Test case for an invalid matrix file *)
let test_invalid_matrix_file _ =
  let file_content = [| "Invalid content" |] in
  let expected_output = "Invalid format in the matrix file\n" in
  let output = ref "" in
  let _ = Printf.printf := (fun fmt s -> output := !output ^ s) in (* Redirect Printf.printf *)
  mat_run file_content;
  assert_equal ~msg:"Invalid matrix file test" ~printer:(fun x -> x) expected_output !output

let suite =
  "Matrix Test Suite" >::: [
    "test_valid_matrix_file" >:: test_valid_matrix_file;
    "test_invalid_matrix_file" >:: test_invalid_matrix_file;
  ]

let () = run_test_tt_main suite
