
module type Monad = 
sig 
    type 'a t 
    val return : 'a -> 'a t 
    val ( >>= ) : 'a t -> ('a -> 'b t) -> 'b t 
    val convert : ('a -> 'b) -> ('a -> 'b t) 
    val extract : 'a t -> ('a * float)
    val return2 : 'a -> 'b t -> 'a t 
end;;
module TimeMonad : Monad = struct 
    type 'a t = {v : 'a ; avgtime : float ; tottime: float; runcount : int }
    let return x = {v = x; avgtime = 0.0 ; tottime = 0.0 ; runcount = 0} 
    let convert f = 
        fun x -> 
            let start = Unix.time () in 
            let res = f x in 
            let stop = Unix.time () in 
            let time = stop -. start in
            {v = res; avgtime = time ; tottime = time ; runcount = 1 }
            
    let extract {v;avgtime; _} = (v, avgtime) 
    (* let return2 i {v; avgtime; tottime ; runcount} = {i; avgtime; tottime ; runcount} *)
    let return2 i r= let y =  {v = i; avgtime = r.avgtime;tottime = r.tottime;runcount = r.runcount} in y 
    let (>>=) m f = 
        let {v = arg; avgtime = _ ; tottime = oldtot ; runcount = oldcount} = m in 
        let {v = res; avgtime = _ ; tottime = tot ; runcount = count} = f arg in 
        let new_tot = oldtot +. tot in
        let new_count = oldcount + count in
        {v=res; avgtime=(new_tot /. (float_of_int new_count));
        tottime= new_tot; runcount= new_count}
end ;; 

let time () = Unix.sleep (Random.int 3);;

let resnew = 
    fun f' -> 
    let f = TimeMonad.convert f' in 
    fun x -> 
    let m = TimeMonad.return x in 
    fun n -> 
    let rec checking mot fot n = 
        let rep mo fo = 
            let m1 = TimeMonad.(>>=) mo fo in 
            let m2 = TimeMonad.return2 x m1 in 
            (m1, m2) in 
        let (m1, m2) = rep mot fot in 
        if (n < 1) then (TimeMonad.extract m1) else checking m2 f (n - 1) in 
    checking m f n ;;

resnew time () 10;;

(* let avg_run2  f x n = 
let start = TimeMonad.return x in 
let conv = TimeMonad.convert f in
let rec run n acc = 
  if n < 0 then TimeMonad.extract acc 
  else run (n-1) (
    print_endline (string_of_float acc.avgtime) ;
    acc >>= conv 
  )
in
run (n) start *)