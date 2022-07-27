open Lib
let program_name = "head"
let usage_msg = "usage: head <file> [-n <lines>]"
let input_files = ref []
let anon_fun filename = input_files := filename :: !input_files
let lines = ref 10
let speclist = [("-n", Arg.Set_int lines, "Set number of lines")]
let exit_code = ref 0

let check_multiple_args () = 
  match !input_files with
  | [_] -> false
  | _ -> true

let head n multiple_args file = 
  try
    if multiple_args then Printf.printf "==> %s <==\n" file else ();
    Printf.printf "%s\n" (CustomIO.read_n_lines n file)
  with
    Sys_error (err_msg) -> (Printf.printf "%s: %s" program_name err_msg;exit_code:=1)

let main () =
  Arg.parse speclist anon_fun usage_msg;
  let multiple_args = (check_multiple_args ()) in 
  List.iter (head !lines multiple_args) (List.rev !input_files);
  exit (!exit_code)

let _ = main ()