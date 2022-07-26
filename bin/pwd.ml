let program_name = "pwd"
(* Still need to implement flags for physical and logical addresses *)
let usage_msg = "usage: pwd"
let args = ref []
let anon_fun arg = args := arg :: !args
let speclist = []
let exit_code = ref 0

let pwd () = 
  try
    Printf.printf "%s\n" (Sys.getcwd ())
  with
    Sys_error (err_msg) -> (Printf.printf "%s: %s\n" program_name err_msg;exit_code:=1)

let main () =
  Arg.parse speclist anon_fun usage_msg;
  pwd ();
  exit (!exit_code)

let _ = main ()