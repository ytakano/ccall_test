module Test


(** [canValidate] is a function specifing whether a file [f] matches with MAC ADDRESS*)
let canValidate (f:int) =
	match f with
	| 0x0800278a4e3f -> true
	| _ -> false

