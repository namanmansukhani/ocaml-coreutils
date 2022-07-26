(* let program_name = "false" *)
let usage_msg = "usage: false [args ...]"
let args = ref []
let anon_fun arg = args := arg :: !args
let speclist = []
let exit_code = ref 0

let main () = 
  Arg.parse speclist anon_fun usage_msg;
  exit (!exit_code)

let _ = main ()