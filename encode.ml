let enc (c:char) (off:int) : char =
  let valc = Char.code (c) in
   let sum = valc + off in
    if valc >= 65 && valc <= 90 then
      if (sum < 65) then Char.chr(91 - ((65 - sum) mod 26))
      else if sum > 90 then Char.chr(((sum - 90) mod 26) + 64)
      else Char.chr(sum)
    else if valc >= 97 && valc <= 122 then
      if (sum < 97) then Char.chr(123 - ((97 - sum) mod 26))
      else if sum > 122 then Char.chr(((sum - 122) mod 26) + 96)
      else Char.chr(sum)
    else c;;

    
let encstr (s: string) (off: int) : string = String.map (fun x -> enc x off) s;;

