let program_name = "cat"
let usage_msg = "usage: cat [-file1] [file ...]"
let input_files = ref []
let anon_fun filename = input_files := filename :: !input_files
let speclist = []
let exit_code = ref 0

(* read_whole_chan and read_whole_file from ocaml.org *)
(* prevents stack overflow on huge files by being tail-recursive *)
let read_whole_chan chan =
  let buf = Buffer.create 4096 in
  let rec loop () =
    let line = input_line chan in
      Buffer.add_string buf line;
      Buffer.add_char buf '\n';
      loop ()
  in
    try loop () with
      End_of_file -> Buffer.contents buf
  
let read_whole_file filename =
  let chan = open_in filename in
  read_whole_chan chan

let cat_file file = 
  try
    Printf.printf "%s\n" (read_whole_file file)
  with
    Sys_error (err_msg) -> (Printf.printf "%s: %s" program_name err_msg;exit_code:=1)

let () =
  Arg.parse speclist anon_fun usage_msg;
  List.iter (cat_file) (List.rev !input_files);
  exit (!exit_code)