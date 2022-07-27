open Lib
let program_name = "cat"
let usage_msg = "usage: cat [-file1] [file ...]"
let input_files = ref []
let anon_fun filename = input_files := filename :: !input_files
let speclist = []
let exit_code = ref 0

let cat_file file = 
  try
    Printf.printf "%s\n" (CustomIO.read_whole_file file)
  with
    Sys_error (err_msg) -> (Printf.printf "%s: %s" program_name err_msg;exit_code:=1)

let main () =
  Arg.parse speclist anon_fun usage_msg;
  List.iter (cat_file) (List.rev !input_files);
  exit (!exit_code)

let _ = main ()