(* let program_name = "sleep" *)
let usage_msg = "usage: sleep [seconds]"
let args = ref []
let anon_fun arg = args := arg :: !args
let speclist = []
let exit_code = ref 0

let sleep args = 
  match args with
    | [x] -> (
      let time = Float.of_string_opt x in
        match time with
          | None -> Printf.printf "%s\n" usage_msg;exit_code:=1
          | Some time -> Thread.delay (Float.max 0.0 time)
    )
    | _ -> Printf.printf "%s\n" usage_msg;exit_code:=1

let main () =
  Arg.parse speclist anon_fun usage_msg;
  sleep (!args);
  exit (!exit_code)

let _ = main ()