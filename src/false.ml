let program_name = "false"
let usage_msg = "usage: false [args ...]"
let exit_code = ref 1

let main () = exit (!exit_code)

let _ = main ()