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

exception Input_Complete

let read_n_lines_chan n chan =
  let buf = Buffer.create 4096 in
  let rec loop n =
    if n <= 0 then raise End_of_file
    else
      let line = input_line chan in
        Buffer.add_string buf line;
        Buffer.add_char buf '\n';
        loop (n-1)
  in
    try loop n with
      | End_of_file | Input_Complete -> Buffer.contents buf
  
let read_n_lines n filename =
  let chan = open_in filename in
  read_n_lines_chan n chan