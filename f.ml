let f x =
    match x with
    | 0x0800278a4e3f -> true
    | _ -> false
let _ =Callback.register "verifyingmac" f 
