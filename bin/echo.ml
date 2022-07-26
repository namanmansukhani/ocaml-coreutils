let program_name = "echo"
let usage_msg = "usage: echo [-arg1] [args ...]"
let args = ref []
let anon_fun arg = args := arg :: !args
let speclist = []
let exit_code = ref 0

let echo_arg arg = 
  try
    Printf.printf "%s " (arg)
  with
    Sys_error (err_msg) -> (Printf.printf "%s: %s\n" program_name err_msg;exit_code:=1)

let main () =
  Arg.parse speclist anon_fun usage_msg;
  List.iter (echo_arg) (List.rev !args);
  Printf.printf "\n";
  exit (!exit_code)

let _ = main ()