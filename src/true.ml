let program_name = "true"
let usage_msg = "usage: true [args ...]"
let exit_code = ref 0

let main () = exit (!exit_code)

let _ = main ()