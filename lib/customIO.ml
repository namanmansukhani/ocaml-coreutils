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