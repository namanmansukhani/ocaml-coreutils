(lang dune 3.3)

(name ocaml_coreutils)

(generate_opam_files true)

(source
 (github namanmansukhani/ocaml-coreutils))

(authors "Naman Mansukhani" "Sarthak Mangla")

; (maintainers "Maintainer Name")

(license LICENSE)

; (documentation https://url/to/documentation)

(package
 (name ocaml_coreutils)
 (allow_empty)
 (synopsis "An OCaml rewrite of GNU coreutils")
 (description "GNU coreutils rewritten in OCaml for fun and learning!")
 (depends ocaml dune)
 (tags
  (topics "to describe" your project)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
