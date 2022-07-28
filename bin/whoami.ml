(* open Core *)
(* let program_name = "whoami" *)
let usage_msg = "usage: whoami"
let args = ref []
let anon_fun arg = args := arg :: !args
let speclist = []
let exit_code = ref 0

let whoami () = Printf.printf "%s\n" (Unix.getlogin ()) 

let main () =
  Arg.parse speclist anon_fun usage_msg;
  whoami ();
  exit (!exit_code)

let _ = main ()