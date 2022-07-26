let program_name = "yes"
let usage_msg = "usage: yes [args ...]"
let args = ref []
let anon_fun arg = args := arg :: !args
let speclist = []
let exit_code = ref 0

let yes args = 
  let word = (match args with | [] -> "y" | (x::_) -> x) in
    while true do 
      try
        Printf.printf "%s\n" word
      with
        Sys_error (err_msg) -> (Printf.printf "%s: %s\n" program_name err_msg;exit_code:=1)
    done

let main () =
  Arg.parse speclist anon_fun usage_msg;
  yes (List.rev !args);
  exit (!exit_code)

let _ = main ()